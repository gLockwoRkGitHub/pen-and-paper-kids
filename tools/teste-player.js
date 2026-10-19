// Spielt den gebauten Player im Browser an (Playwright) und macht Bildschirmfotos
// in Tablet- und Handygröße. Vorher: npm run player:bauen
// Aufruf: node tools/teste-player.js [ordner-fuer-fotos]   (Standard: test-results/player)
// Prüft: Startbildschirm, Charaktererstellung mit Zurück, Lesen mit Würfelproben,
// Lesefluss (gewählte Zeile oben), Speichern und Weiterlesen, keine Fehler in der Konsole.
const fs = require('fs');
const path = require('path');
const { chromium } = require('@playwright/test');

const ORDNER = path.resolve(process.argv[2] || path.join(__dirname, '..', 'test-results', 'player'));
const GERAETE = [
  { name: 'tablet-quer', breite: 1194, hoehe: 834, schritte: 45, touch: true },
  { name: 'tablet-hoch', breite: 834, hoehe: 1194, schritte: 12, touch: true },
  { name: 'handy', breite: 390, hoehe: 844, schritte: 12, touch: true }
];

function chromePfad() {
  const p = '/opt/pw-browsers/chromium';
  return fs.existsSync(p) ? p : undefined;   // sonst das von Playwright installierte Chromium
}

(async () => {
  fs.mkdirSync(ORDNER, { recursive: true });
  const { preview } = await import('vite');
  const server = await preview({ configFile: path.join(__dirname, '..', 'player', 'vite.config.mjs'), preview: { port: 4173, host: '127.0.0.1' } });
  const url = 'http://127.0.0.1:4173/';
  const browser = await chromium.launch({ executablePath: chromePfad() });
  const probleme = [];

  for (const g of GERAETE) {
    const ctx = await browser.newContext({ viewport: { width: g.breite, height: g.hoehe }, deviceScaleFactor: 1, hasTouch: g.touch, locale: 'de-DE' });
    const seite = await ctx.newPage();
    seite.on('pageerror', (e) => probleme.push(`${g.name}: Seitenfehler ${e.message}`));
    seite.on('console', (m) => { if (m.type() === 'error') probleme.push(`${g.name}: Konsole ${m.text()}`); });
    const foto = (n) => seite.screenshot({ path: path.join(ORDNER, `${g.name}-${n}.png`) });
    const pause = (ms) => seite.waitForTimeout(ms);

    await seite.goto(url);
    await seite.getByText('Das Abenteuer beginnen').waitFor();
    await pause(300);
    await foto('01-start');
    await seite.getByText('Das Abenteuer beginnen').click();

    // Charaktererstellung
    await seite.locator('#name').fill('Kai');
    await foto('02-name');
    await seite.getByRole('button', { name: 'Weiter' }).click();
    await seite.getByRole('button', { name: /Ein Junge/ }).click();
    await seite.getByRole('button', { name: /Zwerg/ }).click();
    await foto('03-herkunft');
    await seite.getByRole('button', { name: /Schiffsjunge/ }).click();
    await seite.getByRole('button', { name: /^Kraft/ }).click();
    await foto('04-staerken');
    // Zurück muss den Wert wieder wegnehmen
    await seite.getByRole('button', { name: 'Zurück' }).click();
    const kraft = await seite.evaluate(() => window.spiel.werte().kraft);
    if (kraft !== 0) probleme.push(`${g.name}: Zurück hat Kraft nicht zurückgesetzt (${kraft})`);
    await seite.getByRole('button', { name: /^Kraft/ }).click();
    await seite.getByRole('button', { name: /^Geschick/ }).click();
    await seite.getByRole('button', { name: /^Verstand/ }).click();
    await seite.getByText('Das Abenteuer beginnt').waitFor();
    await foto('05-bereit');
    const w = await seite.evaluate(() => window.spiel.werte());
    if (w.kraft !== 3 || w.geschick !== 1 || w.verstand !== 1) probleme.push(`${g.name}: Werte nach Erstellung falsch ${JSON.stringify(w)}`);
    await seite.getByText('Das Abenteuer beginnt').click();

    // Lesen
    await seite.locator('.wahl').first().waitFor();
    await pause(600);
    await foto('06-geschichte');
    let probeFoto = false;
    let lesefluss = 0;
    for (let i = 0; i < g.schritte; i++) {
      await seite.locator('.wahlen .wahl').first().waitFor({ timeout: 10000 });
      // Proben bevorzugen, damit Würfel vorkommen
      const mitWert = seite.locator('.wahlen .wahl:has(.raute)');
      const knopf = (await mitWert.count()) ? mitWert.first() : seite.locator('.wahlen .wahl').first();
      await knopf.click();
      if (!probeFoto && (await seite.locator('.rollen').count())) {
        await pause(150);
        await foto('07-wuerfel-rollen');
        await seite.locator('.rollen').waitFor({ state: 'detached' });
        await pause(400);
        await foto('08-wuerfel-ergebnis');
        probeFoto = true;
      }
      await seite.locator('.rollen').waitFor({ state: 'detached' }).catch(() => {});
      await pause(700);
      // Lesefluss: die gewählte Zeile steht oben im Lesebereich
      const lage = await seite.evaluate(() => {
        const leser = document.querySelector('.leser');
        const anker = document.querySelector(`[data-block="${window.spiel.ankerId}"]`);
        if (!leser || !anker) return null;
        return anker.getBoundingClientRect().top - leser.getBoundingClientRect().top;
      });
      if (lage === null || lage < -2 || lage > 40) { lesefluss++; if (process.env.DEBUG) console.log(g.name, i, lage, await seite.evaluate(() => { const l = document.querySelector(".leser"); return [l.scrollTop, l.scrollHeight, l.clientHeight]; })); }
      if (i === 8) await foto('09-weiter-gelesen');
    }
    if (lesefluss) probleme.push(`${g.name}: ${lesefluss}× stand die gewählte Zeile nicht oben`);
    await foto('10-nach-schritten');
    const zustand = await seite.evaluate(() => ({ buch: window.spiel.buch.da, eintraege: window.spiel.buch.eintraege.length, perle: window.spiel.perle }));

    // Speichern und Weiterlesen
    const textVorher = await seite.locator('.wahlen').innerText();
    await seite.reload();
    await seite.getByText('Weiterlesen').waitFor();
    await pause(300);
    await foto('11-start-mit-spielstand');
    await seite.getByText('Weiterlesen').click();
    await seite.locator('.wahlen .wahl').first().waitFor();
    const textNachher = await seite.locator('.wahlen').innerText();
    if (textVorher !== textNachher) probleme.push(`${g.name}: Nach dem Weiterlesen andere Entscheidungen`);
    await pause(500);
    await foto('12-weitergelesen');
    if (zustand.buch) {
      await seite.getByRole('button', { name: /Tagebuch öffnen/ }).click();
      await pause(300);
      await foto('13-tagebuch');
      await seite.getByText('Zurück zur Geschichte').click();
    }
    // Diese Perle von vorn beginnen
    await seite.getByRole('button', { name: 'Zum Einband' }).first().click();
    await seite.getByText('Diese Perle von vorn beginnen').click();
    await seite.locator('.kapitel h2').first().waitFor();
    const neuStart = await seite.evaluate(() => ({ perle: window.spiel.perle, wahlen: window.spiel.wahlen.length }));
    if (neuStart.perle !== zustand.perle || !neuStart.wahlen) probleme.push(`${g.name}: Perle von vorn hat nicht geklappt ${JSON.stringify(neuStart)}`);
    await pause(400);
    await foto('14-perle-von-vorn');
    console.log(`${g.name}: ${g.schritte} Entscheidungen, Perle ${zustand.perle}, Tagebuch ${zustand.buch ? 'da' : 'noch nicht'}, ${zustand.eintraege} Einträge`);
    await ctx.close();
  }

  await browser.close();
  server.httpServer.close();
  if (probleme.length) {
    console.error('PROBLEME:\n' + probleme.join('\n'));
    process.exit(1);
  }
  console.log(`Player: in Ordnung. Fotos in ${ORDNER}`);
})().catch((e) => { console.error(e); process.exit(1); });
