# Pen & Paper Kids

Ein storygetriebenes Pen-&-Paper-Abenteuer für Kinder ab 10 Jahren – zum Lesen, Entscheiden und Würfeln auf Handy oder Tablet.

## Die Idee in Kürze

- **Einzelspieler-Abenteuer** mit einer langen, zusammenhängenden Geschichte.
- **Die Figur wächst:** wenige Werte, die mit jedem Level-Up besser werden.
- **Die Welt erinnert sich** an gute und schlechte Taten – und reagiert darauf.
- **Völker und Hintergründe** statt klassischer Klassen (z. B. Reisender, Schausteller, Bettelmönch, Schankwirt).
- **Fantasie-Karten** zum Weiterreisen und zum Nachlesen erlebter Abenteuer.
- **Ernster Ton erlaubt**, auch mal finster – aber ohne endgültigen Tod.

## Stand

Konzeptphase. Die erste Version ist ein Beta-Spiel für den eigenen Sohn; wenn es ankommt, wird es veröffentlicht.
Es wird eine für Tablets und Handys optimierte Webseite (Browser-Player in `player/`, bereitgestellt über Cloudflare mit Anmeldung, Anleitung: `docs/anleitung-cloudflare.md`).

## Aufbau des Repos

| Pfad | Inhalt |
|---|---|
| `CLAUDE.md` | Kontext und Arbeitsregeln für Claude |
| `docs/setup.md` | Lokale Einrichtung auf Pascos Rechner |
| `docs/entscheidungen.md` | Festgelegte Grundsatzentscheidungen |
| `docs/ideen.md` | Ideen-Liste (noch nicht entschieden) |
| `docs/regeln.md` | Werte, Würfel, Level-Ups, Völker, Hintergründe |
| `docs/magie.md` | Magiesystem |
| `docs/story-konventionen.md` | Absprache Story ↔ Browser-Player (Tags, Variablen, Bilder, Karte) |
| `docs/weltgedaechtnis.md` | Wie sich die Welt an Entscheidungen erinnert |
| `docs/worldbuilding/` | Welt, Orte, Fraktionen, Figuren |
| `docs/worldbuild-ideas.md` | World-Building-Ideen für später |
| `docs/art/` | Art-Style, Stilvorschläge, Bildliste, Werkzeuge |
| `story/` | Die Kapitel des Abenteuers (Ink) |
| `player/` | Browser-Player (Vite, Svelte, inkjs) – siehe `player/README.md` |
| `tools/` | Tests (`npm test`, `npm run player:pruefen`) und Bau-Skripte für Story, Bilder und Karten |
