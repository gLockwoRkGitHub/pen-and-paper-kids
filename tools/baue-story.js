// Kompiliert story/main.ink für den Browser-Player.
// Ergebnis: player/src/generated/story.json (wird nicht committet, siehe .gitignore)
// und player/src/generated/version.json (Prüfsumme der Story – ein Spielstand passt nur zu seiner Version).
// Aufruf: node tools/baue-story.js   (läuft automatisch bei npm run player / npm run spielen)
const fs = require('fs');
const path = require('path');
const crypto = require('crypto');
const { Compiler, CompilerOptions } = require('inkjs/full');
const { PosixFileHandler } = require('inkjs/compiler/FileHandler/PosixFileHandler');

const storyDir = path.join(__dirname, '..', 'story');
const ziel = path.join(__dirname, '..', 'player', 'src', 'generated');
const mainFile = path.join(storyDir, 'main.ink');

const fehler = [];
const options = new CompilerOptions(mainFile, [], false, (msg, typ) => { if (typ === 2) fehler.push(msg); }, new PosixFileHandler(storyDir));
const compiler = new Compiler(fs.readFileSync(mainFile, 'utf8'), options);
let story;
try { story = compiler.Compile(); } catch (e) { fehler.push(String(e.message || e)); }
if (!story || compiler.errors.length || fehler.length) {
  console.error('Story lässt sich nicht kompilieren:\n' + [...compiler.errors, ...fehler].join('\n'));
  process.exit(1);
}
const json = story.ToJson();
fs.mkdirSync(ziel, { recursive: true });
fs.writeFileSync(path.join(ziel, 'story.json'), json);
const version = crypto.createHash('sha1').update(json).digest('hex').slice(0, 12);
fs.writeFileSync(path.join(ziel, 'version.json'), JSON.stringify({ version, gebaut: new Date().toISOString() }) + '\n');
console.log(`Story gebaut (${Math.round(json.length / 1024)} KB, Version ${version}).`);
