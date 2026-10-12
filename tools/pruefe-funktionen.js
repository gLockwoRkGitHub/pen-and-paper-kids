// Kleine Prüfung der Hilfsfunktionen (Sprache, Proben). Aufruf: node tools/pruefe-funktionen.js
const fs = require('fs');
const path = require('path');
const { Compiler, CompilerOptions } = require('inkjs/full');
const { PosixFileHandler } = require('inkjs/compiler/FileHandler/PosixFileHandler');
const d = path.join(__dirname, '..', 'story');
const st = new Compiler(fs.readFileSync(d + '/main.ink', 'utf8'),
  new CompilerOptions(d + '/main.ink', [], false, null, new PosixFileHandler(d))).Compile();
const v = st.variablesState;
const f = (n, a = []) => st.EvaluateFunction(n, a);
v.geschlecht = 'w'; v.volk = 'zwerg'; v.hintergrund = 'schausteller';
console.log('Spielerin:', f('freund'), f('fr_er'), f('fr_sein') + 'e', f('volk_wort'), f('bp'), f('Bp_er'), f('anrede'));
v.geschlecht = 'm'; v.hintergrund = 'kartografenlehrling';
console.log('Spieler:', f('freund'), f('fr_er'), f('fr_sein') + 'e', f('volk_wort'), f('bp'), f('Bp_er'), f('anrede'));
const e = f('probe', [1]);
console.log('Probe:', JSON.stringify(st.EvaluateFunction('probe_zeile', ['Kraft', e], true)));
