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
if (probleme.length) {
  console.error(`${probleme.length} Probleme:\n` + [...new Set(probleme)].slice(0, 30).join('\n'));
  process.exit(1);
}
console.log('Alles in Ordnung.');
