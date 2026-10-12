// Wird beim Start jeder Claude-Code-Sitzung ausgeführt (Hook in .claude/settings.json).
// 1. Holt den neuesten Stand aus GitHub.
// 2. Zeigt offene Aufträge aus docs/auftraege.md an (die Ausgabe landet im Kontext von Claude).
const { execSync } = require('child_process');
const fs = require('fs');
const path = require('path');

const root = path.join(__dirname, '..');
try {
  const out = execSync('git pull --rebase --autostash', { cwd: root, encoding: 'utf8', stdio: ['ignore', 'pipe', 'pipe'] });
  console.log('git pull: ' + out.trim().split('\n').slice(-1)[0]);
} catch (e) {
  console.log('ACHTUNG: git pull fehlgeschlagen – bitte prüfen (git status). ' + (e.stderr || e.message || '').toString().trim().split('\n')[0]);
}

try {
  const text = fs.readFileSync(path.join(root, 'docs', 'auftraege.md'), 'utf8');
  const offen = text.split('\n').filter((z) => z.trim().startsWith('- [ ]'));
  if (offen.length) {
    console.log(`\nOffene Aufträge in docs/auftraege.md (${offen.length}):`);
    offen.forEach((z) => console.log(z.length > 300 ? z.slice(0, 300) + ' …' : z));
    console.log('\nBitte zuerst docs/stand.md lesen, dann die offenen Aufträge abarbeiten (oder Pasco fragen, womit er anfangen möchte).');
  } else {
    console.log('Keine offenen Aufträge in docs/auftraege.md.');
  }
} catch (e) {
  console.log('docs/auftraege.md nicht gefunden.');
}
