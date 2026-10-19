// Startet den fertig gebauten Player im Heim-WLAN (nach `npm run player:bauen`).
// Aufruf: npm run spielen   – baut zuerst und startet dann diesen Server.
// Auf dem Tablet im selben WLAN die angezeigte Adresse öffnen. Beenden mit Strg+C.
const os = require('os');
const path = require('path');

const PORT = 8080;

(async () => {
  const { preview } = await import('vite');
  const server = await preview({
    configFile: path.join(__dirname, '..', 'player', 'vite.config.mjs'),
    preview: { host: true, port: PORT, strictPort: true }
  });
  const adressen = Object.values(os.networkInterfaces()).flat()
    .filter((a) => a && a.family === 'IPv4' && !a.internal)
    .map((a) => `http://${a.address}:${PORT}/`);
  console.log('\n  Der Weg hinaus läuft.\n');
  console.log(`  Auf diesem PC:      http://localhost:${PORT}/`);
  for (const a of adressen) console.log(`  Auf dem Tablet:     ${a}`);
  console.log('\n  Fragt Windows nach der Firewall: „Private Netzwerke“ erlauben.');
  console.log('  Beenden mit Strg+C.\n');
  process.on('SIGINT', () => server.httpServer.close(() => process.exit(0)));
})().catch((e) => { console.error('Start fehlgeschlagen:', e.message || e); process.exit(1); });
