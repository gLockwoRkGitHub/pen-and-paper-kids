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

## Ausbaustufen
1. **Fertig (19.10.2026):** Start, Charaktererstellung, Geschichte mit Bildern und Würfeln, Speichern/Weiterlesen, Perle von vorn, Daten fürs Tagebuch werden schon gesammelt.
2. **Als Nächstes:** das aufgeschlagene Tagebuch mit den Laschen Ich, Erlebtes, Karte, Taschen, Menschen; Level-Up-Darstellung; Hinweis-Symbole zu `# tutorial`.
3. Danach: Feinschliff mit Rückmeldung von Pasco und Sohn, Offline/https.

## Bekannte Grenzen (Stufe 1)
- Ein Spielstand passt nur zu seiner Story-Version. Ändert sich die Story, beginnt beim Weiterlesen die aktuelle Perle neu (Speicherpunkt bei `# perle`).
- Der Volksbonus-Text (Zwerg, Gnom, Ork, Troll) steht vorerst im Player, weil `charakter.ink` dazu nichts ausgibt. Gibt Ink dort eine Zeile aus, nimmt der Player diese.
- Ink würfelt nur die Summe (2W6); die Aufteilung auf zwei Würfel ist reine Anzeige.
