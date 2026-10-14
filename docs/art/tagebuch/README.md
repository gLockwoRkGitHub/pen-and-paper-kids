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
| `menschen/` | 30 (22 Figuren, davon Bezugsperson in 6, Mentor in 4, Liora/Cassian in 2 Varianten; Yrsa nur einmal) |
