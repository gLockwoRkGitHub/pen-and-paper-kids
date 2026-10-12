// Spielt einen zufälligen Durchlauf und gibt den kompletten Text aus.
// Aufruf: node tools/zeige-durchlauf.js [seed]
const fs = require('fs');
const path = require('path');
const { Compiler, CompilerOptions } = require('inkjs/full');
const { PosixFileHandler } = require('inkjs/compiler/FileHandler/PosixFileHandler');
const d = path.join(__dirname, '..', 'story');
const story = new Compiler(fs.readFileSync(d + '/main.ink', 'utf8'),
  new CompilerOptions(d + '/main.ink', [], false, null, new PosixFileHandler(d))).Compile();
const seed = parseInt(process.argv[2] || '1', 10);
story.state.storySeed = seed;
let r = seed * 9301 + 49297;
const zufall = (n) => { r = (r * 9301 + 49297) % 233280; return Math.floor((r / 233280) * n); };
const out = [];
while (true) {
  while (story.canContinue) {
    const t = story.Continue();
    const tags = story.currentTags.length ? '   [' + story.currentTags.join(' | ') + ']' : '';
    out.push(t.trimEnd() + tags);
  }
  if (!story.currentChoices.length) break;
  const i = zufall(story.currentChoices.length);
  out.push('  > ' + story.currentChoices.map((c, k) => (k === i ? '*' : ' ') + c.text).join('\n    '));
  story.ChooseChoiceIndex(i);
}
console.log(out.join('\n'));
