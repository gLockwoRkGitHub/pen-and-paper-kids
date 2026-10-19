// Einfacher Offline-Speicher: Seite zuerst aus dem Netz (damit Updates ankommen),
// Bilder, Schriften und Programmteile aus dem Speicher, sobald sie einmal geladen wurden.
const SPEICHER = 'weg-hinaus-1';

self.addEventListener('install', () => self.skipWaiting());
self.addEventListener('activate', (e) => e.waitUntil(self.clients.claim()));

self.addEventListener('fetch', (e) => {
  const anfrage = e.request;
  if (anfrage.method !== 'GET' || new URL(anfrage.url).origin !== self.location.origin) return;
  const istSeite = anfrage.mode === 'navigate';
  e.respondWith(
    caches.open(SPEICHER).then(async (speicher) => {
      if (istSeite) {
        try {
          const antwort = await fetch(anfrage);
          speicher.put(anfrage, antwort.clone());
          return antwort;
        } catch {
          return (await speicher.match(anfrage)) || Response.error();
        }
      }
      const vorhanden = await speicher.match(anfrage);
      if (vorhanden) return vorhanden;
      const antwort = await fetch(anfrage);
      if (antwort.ok) speicher.put(anfrage, antwort.clone());
      return antwort;
    })
  );
});
