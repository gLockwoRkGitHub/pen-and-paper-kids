// Kompiliert story/main.ink und spielt die Geschichte mehrfach zufällig durch.
// Aufruf: npm test            (Standard: 500 Durchläufe)
//         node tools/teste-story.js 2000
//
// Prüft: Kompilierfehler und Warnungen, Laufzeitfehler, Sackgassen,
// und dass alle Werte im erlaubten Bereich bleiben.

const fs = require('fs');
const path = require('path');
const { Compiler, CompilerOptions } = require('inkjs/full');
const { PosixFileHandler } = require('inkjs/compiler/FileHandler/PosixFileHandler');

const storyDir = path.join(__dirname, '..', 'story');
const mainFile = path.join(storyDir, 'main.ink');
const durchlaeufe = parseInt(process.argv[2] || '500', 10);

const fehlerMeldungen = [];
const options = new CompilerOptions(
  mainFile, [], false,
  (msg, typ) => { if (typ === 2) fehlerMeldungen.push(msg); },
  new PosixFileHandler(storyDir)
);
const compiler = new Compiler(fs.readFileSync(mainFile, 'utf8'), options);
let story;
try {
  story = compiler.Compile();
} catch (e) {
  console.error('Kompilieren fehlgeschlagen:', e.message || e);
}
if (compiler.errors.length || fehlerMeldungen.length || !story) {
  console.error('FEHLER:\n' + [...compiler.errors, ...fehlerMeldungen].join('\n'));
  process.exit(1);
}
if (compiler.warnings.length) console.warn('Warnungen:\n' + compiler.warnings.join('\n'));

const WERTE = ['kraft', 'geschick', 'verstand', 'ausstrahlung'];
const probleme = [];
const tags = {};
let laengsterText = 0;

for (let lauf = 0; lauf < durchlaeufe; lauf++) {
  story.ResetState();
  story.state.storySeed = lauf;
  story.onError = (msg) => probleme.push(`Lauf ${lauf}: ${msg}`);
  let schritte = 0;
  let text = '';
  while (true) {
    while (story.canContinue) {
      text += story.Continue();
      story.currentTags.forEach((t) => { tags[t] = (tags[t] || 0) + 1; });
    }
    if (!story.currentChoices.length) break;
    if (++schritte > 2000) { probleme.push(`Lauf ${lauf}: Endlosschleife?`); break; }
    const i = Math.floor(Math.random() * story.currentChoices.length);
    story.ChooseChoiceIndex(i);
  }
  laengsterText = Math.max(laengsterText, text.length);
  for (const w of WERTE) {
    const v = story.variablesState[w];
    if (v < 0 || v > 3) probleme.push(`Lauf ${lauf}: ${w} = ${v} außerhalb 0–3`);
  }
}

console.log(`${durchlaeufe} Durchläufe, längster Text ${laengsterText} Zeichen.`);
console.log('Tags:', tags);

// Hinweis (kein Fehler): Bild-Tags ohne passende Prompt-Datei in docs/art/.
// szene/hafen-kran -> szene-hafen-kran.prompt.txt, figur/borrik -> borrik-einzel.prompt.txt
// Siehe docs/story-konventionen.md, Abschnitt 5.
const promptDateien = new Set();
(function sammle(dir) {
  for (const e of fs.readdirSync(dir, { withFileTypes: true })) {
    const p = path.join(dir, e.name);
    if (e.isDirectory()) sammle(p);
    else if (e.name.endsWith('.prompt.txt')) promptDateien.add(e.name.replace('.prompt.txt', ''));
  }
})(path.join(__dirname, '..', 'docs', 'art'));
const ohnePrompt = Object.keys(tags)
  .filter((t) => t.startsWith('bild:'))
  .map((t) => t.slice(5).trim())
  .filter((b) => {
    const [art, name] = b.split('/');
    return !promptDateien.has(`${art}-${name}`) && !(art === 'figur' && promptDateien.has(`${name}-einzel`));
  })
  .sort();
if (ohnePrompt.length) {
  console.log(`Hinweis: ${ohnePrompt.length} Bild-Tags ohne Prompt-Datei (noch nicht ausgearbeitet oder Tippfehler):\n  ` + ohnePrompt.join('\n  '));
}

// Karten: Jeder '# karte:'-Schlüssel braucht einen Eintrag in docs/art/karten/karten.json,
// und alles, was dort aufgedeckt wird, muss es geben. Siehe docs/art/karten/README.md.
const kartenDatei = path.join(__dirname, '..', 'docs', 'art', 'karten', 'karten.json');
if (fs.existsSync(kartenDatei)) {
  let karten = null;
  try { karten = JSON.parse(fs.readFileSync(kartenDatei, 'utf8')); } catch (e) { probleme.push('karten.json ist kein gültiges JSON: ' + e.message); }
  if (karten) {
    const kartenHinweise = [];
    const storyText = fs.readdirSync(storyDir, { recursive: true })
      .filter((f) => String(f).endsWith('.ink'))
      .map((f) => fs.readFileSync(path.join(storyDir, String(f)), 'utf8')).join('\n');
    const schluessel = new Set([...storyText.matchAll(/#\s*karte:\s*([^\s#]+)/g)].map((m) => m[1]));
    for (const k of [...schluessel].sort()) {
      if (!karten.tags[k]) kartenHinweise.push(`'# karte: ${k}' fehlt in karten.json (tags)`);
    }
    const gibt = (ziel) => {
      const [art, name] = ziel.split(':');
      if (art === 'alles') return !!karten.karten[name];
      const sammlung = { ort: karten.orte, bereich: karten.bereiche, weg: karten.wege }[art];
      return !!(sammlung && sammlung[name]);
    };
    const pruefe = (wo, ziele) => ziele.forEach((z) => { if (!gibt(z)) kartenHinweise.push(`${wo}: '${z}' gibt es nicht`); });
    pruefe('start', karten.start || []);
    for (const [k, v] of Object.entries(karten.tags)) { pruefe(`tags.${k}`, v.zeigt || []); if (v.aktuell) pruefe(`tags.${k}.aktuell`, [v.aktuell]); }
    for (const [k, v] of Object.entries(karten.variablen || {})) pruefe(`variablen.${k}`, v.zeigt || []);
    for (const [k, o] of Object.entries(karten.orte)) if (!karten.karten[o.karte]) kartenHinweise.push(`orte.${k}: Karte '${o.karte}' gibt es nicht`);
    if (kartenHinweise.length) console.log(`Hinweis: ${kartenHinweise.length} Punkte in karten.json:\n  ` + kartenHinweise.join('\n  '));
  }
}
if (probleme.length) {
  console.error(`${probleme.length} Probleme:\n` + [...new Set(probleme)].slice(0, 30).join('\n'));
  process.exit(1);
}
console.log('Alles in Ordnung.');
