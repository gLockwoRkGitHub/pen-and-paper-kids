# Browser-Player „Der Weg hinaus“

Spielt die Ink-Geschichte aus `story/` im Browser – optimiert für Tablet (quer und hochkant) und Handy.
Tech-Stack (entschieden 14.10.2026, `docs/entscheidungen.md`): Vite, Svelte 5 + TypeScript, inkjs, eigenes CSS, Spielstand im Browser (IndexedDB).
Was der Player aus der Story liest, regelt `docs/story-konventionen.md`.

## Starten

**Bereitstellung:** Cloudflare Pages mit Zugangsschutz (Cloudflare Access), gebaut von GitHub Actions – Einrichtung `docs/anleitung-cloudflare.md`. Notlösung im Heimnetz: `docs/anleitung-tablet.md`.

| Wo | Befehl | Wofür |
|---|---|---|
| Pascos PC, Heim-WLAN | Doppelklick auf `spielen.cmd` (oder `npm run spielen`) | Baut alles und startet den Server. Die Adresse „Auf dem Tablet“ im Browser des Tablets öffnen. Fenster offen lassen. |
| Entwicklung | `npm run player` | Entwicklungsserver mit sofortigem Neuladen (Port 5173) |
| Prüfen | `npm run player:bauen`, dann `npm run player:pruefen` | Typprüfung und Durchlauf im Browser mit Bildschirmfotos (Tablet quer/hochkant, Handy) in `test-results/player/` |

Beim ersten Start fragt Windows eventuell nach der Firewall: **Private Netzwerke** erlauben.
Offline-Spielen und „Zum Startbildschirm hinzufügen“ als echte App gehen erst mit https (später). Im Heim-WLAN über http läuft alles andere normal.

## Was beim Bauen passiert
1. `tools/baue-story.js` kompiliert `story/main.ink` nach `player/src/generated/story.json` und merkt sich eine Prüfsumme (Story-Version).
2. `tools/baue-bilder.js` wandelt die fertigen PNGs aus `docs/art/` in WebP nach `player/public/bilder/<art>/<name>.webp` um (nur neue/geänderte).
3. Vite baut alles nach `player/dist/`.

Diese drei Ordner werden **nicht** committet (`.gitignore`), sie entstehen bei jedem Bauen neu.

## Aufbau
| Datei | Inhalt |
|---|---|
| `src/lib/spiel.svelte.ts` | Story-Motor: Continue, Tags, Entscheidungen, Tagebuch-Daten, Speichern/Laden, Speicherpunkt je Perle |
| `src/lib/text.ts` | Schreibweisen der Story lesen: Entscheidungs-Abzeichen, Probenzeile, „Titel – Beschreibung“ |
| `src/lib/speicher.ts` | Ein Spielstand pro Gerät (IndexedDB) |
| `src/seiten/Start.svelte` | Einband: Weiterlesen, Neues Abenteuer, Perle von vorn |
| `src/seiten/Erstellung.svelte` | Charaktererstellung mit Steckbrief und Zurück |
| `src/seiten/Geschichte.svelte` | Leseseite: Bild links/Text rechts (quer) bzw. Bilder im Text (hochkant, Handy), Entscheidungen, Lesefluss, „Neu im Tagebuch“, zugeklapptes Buch |
| `src/seiten/Wuerfel.svelte` | Würfelanimation zur Probe, Tickworts Tipp |
| `src/seiten/Tagebuch.svelte` | Das aufgeschlagene Buch: Ledereinband, Laschen (Tablet rechts, Handy unten), Lesebändchen zurück zur Geschichte |
| `src/seiten/buch/*.svelte` | Die Laschen Ich, Erlebtes, Karte, Taschen, Menschen (`Sammlung.svelte` = gemeinsamer Aufbau von Taschen/Menschen) |
| `src/lib/texte.ts` | Feste Buchtexte: „Was ich gut kann“, Gilden-, Volks- und Hintergrundnamen, Elemente, Hinweise zu `# tutorial` |

## Ausbaustufen
1. **Fertig (19.10.2026):** Start, Charaktererstellung, Geschichte mit Bildern und Würfeln, Speichern/Weiterlesen, Perle von vorn.
2. **Fertig (20.10.2026):** das aufgeschlagene Tagebuch mit den Laschen **Ich** (Charakterbogen mit Level-Siegel, „Was ich gut kann“, Gilde, Werte, Magie mit Kraftfunken und Quelle), **Erlebtes** (Tagebuchseiten mit Skizze und Handschrift, Erinnerungen, Blättern, „auf der Karte“), **Karte** (Grundkarte nur in aufgedeckten Bereichen, Ortsskizzen, Wege, Namen, „hier bin ich“, Siegel je Ort mit Einträgen, Meridel/Lysmara, Zoom), **Taschen** und **Menschen** (Skizzen und Texte aus `story/tagebuch.ink`); Punkt an Laschen mit Neuem; Level-Up-Siegel in der Geschichte; Hinweise zu `# tutorial`.
3. Danach: Feinschliff mit Rückmeldung von Pasco und Sohn.

## Bekannte Grenzen
- Ein Spielstand passt nur zu seiner Story-Version. Ändert sich die Story, beginnt beim Weiterlesen die aktuelle Perle neu (Speicherpunkt bei `# perle`).
- Ink würfelt nur die Summe (2W6); die Aufteilung auf zwei Würfel ist reine Anzeige.
- Der „Was ich gut kann“-Text, Gilden-, Volks- und Hintergrundnamen stehen im Player (`src/lib/texte.ts`, Quelle `docs/tagebuch.md`). Ändert der Story-Chat sie, hier nachziehen.
- Karte: In dichten Gegenden (Lysmara-Ost) überlappen sich Ortsnamen etwas. Bei Bedarf in `karten.json` die Lage feinjustieren.
- Hinweise zu `# tutorial: werte` und `tagebuch` sagen „Tickwort sagt“, die späteren „Gut zu wissen“ (Tickwort ist ab Perle 2 nicht mehr dabei).
