// Wandelt die fertigen Bilder aus docs/art in WebP für den Browser-Player um.
// Ergebnis: player/public/bilder/<art>/<name>.webp (wird nicht committet).
// Zuordnung (docs/story-konventionen.md, Abschnitt 5):
//   # bild: szene/hafen-kran      -> docs/art/szenen/perle-<n>/szene-hafen-kran.png
//   # bild: entdeckung/...        -> docs/art/szenen/perle-<n>/entdeckung-....png
//   # bild: tagebuch/...          -> docs/art/szenen/perle-<n>/tagebuch-....png
//   # bild: figur/tickwort        -> docs/art/szenen/perle-<n>/figur-tickwort.png, sonst docs/art/figuren/tickwort-einzel.png
//   Taschen/Menschen-Skizzen      -> docs/art/tagebuch/taschen|menschen/<name>.png
//   Karten                        -> docs/art/karten/** (Grundkarten und Skizzen)
// Schon umgewandelte Bilder werden übersprungen, wenn das PNG nicht neuer ist.
// Aufruf: node tools/baue-bilder.js
const fs = require('fs');
const path = require('path');
const sharp = require('sharp');

const art = path.join(__dirname, '..', 'docs', 'art');
const ziel = path.join(__dirname, '..', 'player', 'public', 'bilder');
const auftraege = [];   // [quelle, ziel, breite]

const szenen = path.join(art, 'szenen');
for (const perle of fs.readdirSync(szenen).filter((d) => d.startsWith('perle-')).sort()) {
  for (const datei of fs.readdirSync(path.join(szenen, perle))) {
    const m = datei.match(/^(szene|entdeckung|tagebuch|figur)-(.+)\.png$/);
    if (m) auftraege.push([path.join(szenen, perle, datei), path.join(ziel, m[1], m[2] + '.webp'), 1536]);
  }
}
const figuren = path.join(art, 'figuren');
for (const datei of fs.readdirSync(figuren)) {
  const m = datei.match(/^(.+)-einzel\.png$/);
  const z = m && path.join(ziel, 'figur', m[1] + '.webp');
  if (m && !auftraege.some((a) => a[1] === z)) auftraege.push([path.join(figuren, datei), z, 1024]);
}
for (const teil of ['taschen', 'menschen']) {
  const ordner = path.join(art, 'tagebuch', teil);
  if (!fs.existsSync(ordner)) continue;
  for (const datei of fs.readdirSync(ordner).filter((d) => d.endsWith('.png'))) {
    auftraege.push([path.join(ordner, datei), path.join(ziel, teil, datei.replace(/\.png$/, '.webp')), 768]);
  }
}
const karten = path.join(art, 'karten');
const kartenJson = JSON.parse(fs.readFileSync(path.join(karten, 'karten.json'), 'utf8'));
const kartenBilder = new Set();
for (const k of Object.values(kartenJson.karten)) kartenBilder.add(k.grundkarte.replace(/^karten\//, ''));
for (const o of Object.values(kartenJson.orte)) if (o.skizze) kartenBilder.add(o.skizze);
for (const b of kartenBilder) {
  const quelle = path.join(karten, b);
  if (fs.existsSync(quelle)) auftraege.push([quelle, path.join(ziel, 'karten', b.replace(/\.png$/, '.webp')), 2048]);
}

(async () => {
  let neu = 0;
  for (const [quelle, datei, breite] of auftraege) {
    if (fs.existsSync(datei) && fs.statSync(datei).mtimeMs >= fs.statSync(quelle).mtimeMs) continue;
    fs.mkdirSync(path.dirname(datei), { recursive: true });
    await sharp(quelle).resize({ width: breite, withoutEnlargement: true }).webp({ quality: 80 }).toFile(datei);
    neu++;
  }
  console.log(`Bilder: ${auftraege.length} insgesamt, ${neu} neu umgewandelt.`);
})().catch((e) => { console.error(e); process.exit(1); });
