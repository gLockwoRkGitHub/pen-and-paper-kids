# Tagebuch-Skizzen: Taschen und Menschen

Ausgearbeitet von Claude am 14.10.2026. Kleine Skizzen für die Laschen **Taschen** und **Menschen** im Tagebuch (`docs/tagebuch.md`, `docs/story-konventionen.md` Abschnitt 7a).

- **Welche Skizze gezeigt wird**, bestimmen die Ink-Funktionen `tasche_bild(id)` und `mensch_bild(id)` in `story/tagebuch.ink`. Varianten: die Quelle je Element (`quelle-erde`, `-wasser`, `-feuer`; Wind braucht keine), das Gildenzeichen je Gilde, die Bezugsperson je Hintergrund (`maren`, `bonifaz`, `mutter-kessel`, `holm`, `ysolde`, `rhea`), der Mentor je Element (`borrik`, `nerelle`, `yrsa`, `vael`), Liora/Cassian.
- **Dateien:** Prompt `docs/art/tagebuch/<taschen|menschen>/<name>.prompt.txt`, Bild daneben als `<name>.png`. Der Player lädt später `bilder/taschen/<name>.webp` bzw. `bilder/menschen/<name>.webp`.
- `npm test` prüft, dass es zu jeder Skizze, die im Spiel vorkommen kann, eine Prompt-Datei gibt.

**Stil:** wie die Tagebuchseiten, aber **ohne Buch**: eine einzelne Kohle- und Wasserfarbenskizze auf cremefarbenem Papier mit viel leerem Rand, damit der Player sie auf jede Seite legen kann. Menschen als Brustbild. Keine Schrift.

**Erzeugen:** 1024 × 1024, je 4 Seeds, Referenz = Einzelbild der Figur bzw. Requisit (steht in der ersten Zeile). Prüfen: Wiedererkennbar? Kein Buchrand, kein Tisch? Keine Schrift? Tickwort: ein Auge. Wuk: Gnoll, kein Hund.

| Ordner | Anzahl |
|---|---|
| `taschen/` | 20 (15 Gegenstände, davon Quelle in 3 und Gildenzeichen in 4 Varianten) |
| `menschen/` | 34 (26 Figuren, davon Bezugsperson in 6, Mentor in 4, Liora/Cassian in 2 Varianten; Yrsa nur einmal; Ole, Pip, Jaro, Brina ohne Einzelbild) |

## Erzeugte Skizzen (lokale Sitzung, 14.10.2026)
Alle 54 Skizzen mit `tools/erzeuge-szene.ps1`, je 4 Seeds, Referenzen aus der Kopfzeile. Übersichten: `uebersicht-taschen.png`, `uebersicht-menschen.png`.
Gewählt ist Seed 1, außer: `herzsplitter` 3 (einziger mit vier Farben), `quelle-wasser` 1, `silber` 2, `paeckchen` 3, `gildenzeichen-leise_hand` 1, Menschen `tickwort` 3, `vael` 4 (Flaumhaar), `fesk` 2, `fink` 2, `grisk` 1, `ysolde` 2, `jaro` 2, `kettrich` 2.

**Bekannte Schwächen:** `brief` – Ringsiegel sauber, vier Ringe. `faehrfrau` – Ringe auf dem Ruder. `fremder` – Gesicht sichtbar (wie gewählt). `kettrich` – am 19.10.2026 mit `menschen/kettrich-brille.prompt.txt` nachbearbeitet (Seed 1): jetzt gestapelte Gläser wie im Einzelbild. `yrsa` – Rußflecken im Gesicht. `gildenzeichen-leise_hand` – **zweimal nachgebessert (19.10.2026):** Die N7-Fassung sah aus wie eine Unterlippe mit Mittelfinger (von Pasco bemerkt) und wurde ersetzt. Jetzt mit exakt gezeichneter Vorlage `requisiten/leise-hand-vorlage.png` (`tools/leise-hand-vorlage.py`: Gesicht von vorn, Zeigefinger über den Lippen, Daumen und Faust sichtbar). Runde 1 eindeutig, aber Foto-Look; Runde 2 enthielt wieder eine falsche Hand; Runde 3 (Aquarell-Bearbeitung) sah noch wie ein echter Stoffflicken aus (Pasco). **Runde 4, gewählt:** `gildenzeichen-leise_hand-stil.prompt.txt` mit zwei Referenzen – Vorlage für das Zeichen, `taschen/goldknopf.png` für den Zeichenstil –, Seed 4: einfache Bleistiftskizze wie die übrigen Tagebuchbilder. **Regel:** Dieses Zeichen nie nur aus Text erzeugen, immer mit der Vorlage. `jaro` neu (N8, Seed 12) mit hellem Papierrand. Einige Skizzen haben einen leicht gelblichen Papierrand statt nur Creme.

**Fink (19.10.2026):** Aufnäher auf der Mütze in `menschen/fink.png` durch das Zeichen der Leisen Hand ersetzt (vorher Mittelfinger-artig).

**Überarbeitet (19.10.2026, Pasco):** Der eingesetzte Aufnäher wirkte wie per Copy & Paste aufgeklebt. Neu: Das Modell malt den Aufnäher selbst im Bildstil (`figuren/fink-abzeichen.prompt.txt`, Referenzen: Originalbild + `requisiten/leise-hand-zeichen.png`); weil es dabei teils auch Fink veränderte, wurde mit `tools/bereich-mischen.py` nur die Mützenpartie ins Original übernommen. `tools/zeichen-einsetzen.py` ist für Aufnäher nicht mehr zu verwenden (nur für flache Zeichen wie Kreide oder Schnitzerei).

**Neue Skizzen nach den übernommenen Figuren-Kandidaten (20.10.2026):** `menschen/` kettrich (Seed 3, Lupe seitlich, zwei Augen), durgash (2, Hauer), fink (2, Psst-Zeichen auf der Mütze), ashka (1, runde Ohren), ysolde (1; trägt in allen Seeds eine Brille), pell (2, ein Bleistift), mirk (3), faehrfrau (2, Stab mit Ringzeichen).
