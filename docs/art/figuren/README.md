# Figuren-Referenzblätter

Erzeugt lokal mit `tools/erzeuge-bild.js` (ComfyUI von Krita AI Diffusion, Modell FLUX.2 klein 4B).
Die Referenzblätter sind die Vorlage, damit eine Figur in allen Szenenbildern gleich aussieht.

## Vorgehen
1. **Einzelbild** der Figur nur aus dem Text-Prompt erzeugen, mehrere Seeds, das beste auswählen.
2. **Korrekturen** am Einzelbild per Bildreferenz (`--referenz`) und einem kurzen Änderungs-Prompt („alles gleich lassen, nur … ändern“).
3. **Referenzblatt** (vier Ansichten) mit dem Einzelbild als Bildreferenz erzeugen.
   Direkt aus Text gelingt das Blatt schlechter: Details wie Tickworts drittes Bein gehen verloren.

## Tickwort (Stand 12.10.2026)
| Datei | Inhalt | Entstanden aus |
|---|---|---|
| `tickwort-einzel.png` | Einzelbild mit Zangenhänden | `tickwort-einzel.prompt.txt` (Seed 4, 1024×1024), danach `tickwort-zangen.prompt.txt` mit dem ersten Einzelbild als Referenz (Seed 3) |
| `tickwort-referenzblatt.png` | Vier Ansichten | `tickwort.prompt.txt`, Seed 5, 2048×768, Referenz `tickwort-einzel.png` |

Beispiel für das Blatt:
`node tools/erzeuge-bild.js docs/art/figuren/tickwort.prompt.txt docs/art/figuren/tickwort-referenzblatt --seed 5 --breite 2048 --hoehe 768 --referenz docs/art/figuren/tickwort-einzel.png`

Das Skript hängt `-s<seed>` an den Dateinamen; die Dateien hier wurden danach umbenannt.

**Merkmale:** Messing mit Kupfernieten, Kugelbauch mit Klappe vorn, kleiner Kuppelkopf, ein großes bernsteinfarbenes Glasauge, Schornstein mit Dampfwölkchen, zwei dünne Gliederarme mit zweizinkigen Zangen (keine Menschenhände – entschieden 12.10.2026), drei kurze Beine (eins vorn, zwei hinten).

**Bekannte Schwächen des Blatts:** Der Bauch ist etwas eiförmiger als im Einzelbild.

## Liora und Cassian (Aussehen festgelegt 12.10.2026, Alter etwa 12 Jahre)
Beide spielen dieselbe Rolle (je nach Spielfigur) und tragen deshalb dieselbe Kleidung in denselben Farben.

**Grundsatz (Pasco, 12.10.2026):** Das Referenzblatt zeigt die Figur im **Normalzustand** – ein gepflegtes Kind sehr reicher Eltern. Zerrissene Kleidung und Blätter im Haar gibt es nur, wenn in der Szene ein Missgeschick passiert ist (z. B. der Sturz aus dem Apfelbaum).

| Datei | Inhalt | Entstanden aus |
|---|---|---|
| `liora-einzel.png`, `cassian-einzel.png` | Einzelbild, Normalzustand | `liora-einzel.prompt.txt` bzw. `cassian-einzel.prompt.txt`, Seed 2, 832×1216 |
| `liora-referenzblatt.png`, `cassian-referenzblatt.png` | Vier Ansichten, Normalzustand | `freund-blatt.prompt.txt`, Seed 3, 2048×832, Referenz das jeweilige Einzelbild |
| `liora-nach-sturz.png`, `cassian-nach-sturz.png` | Variante für die Sturz-Szene: Blätter im Haar, zerrissener Ärmel, Grasflecken | erster Entwurf vom 12.10.2026 (etwas jünger gezeichnet als die Einzelbilder) |

**Aus der Story vorgegeben:** Kind im Alter der Spielfigur, feine Kleidung, breites Grinsen, Lederschuhe mit silbernen Schnallen.

**Vorschlag (nicht festgelegt):** kastanienbraune Locken (Liora schulterlang mit grüner Schleife, Cassian kurz), Sommersprossen, haselnussbraune Augen, dunkelgrüne Samtjacke mit Goldknöpfen und Goldstickerei an den Ärmelaufschlägen, weißes Leinenhemd, braune Kniehose, weiße Strümpfe.

**Bekannte Schwächen:** Auf den Referenzblättern wirken beide jünger und gedrungener als auf den Einzelbildern. Für das Alter sind die Einzelbilder maßgeblich.

## Grumak, Fesk, der Fremde (von Pasco bestätigt 12.10.2026)
Grundaussehen nach `docs/worldbuilding/figuren-aussehen.md`; die ergänzten Details sind dort als festgelegt eingetragen.

| Datei | Entstanden aus |
|---|---|
| `grumak-einzel.png` | `grumak-einzel.prompt.txt`, Seed 6, 832×1216 |
| `fesk-einzel.png` | `fesk-einzel.prompt.txt`, Seed 7, 832×1216 |
| `fremder-einzel.png` | `fremder-einzel.prompt.txt`, Seed 8, 832×1216 |
| `grumak-referenzblatt.png`, `fesk-referenzblatt.png`, `fremder-referenzblatt.png` | `blatt-allgemein.prompt.txt`, 2048×832, Referenz das jeweilige Einzelbild (Seeds 3, 4, 4) |

**Bekannte Schwächen:**
- Grumak wirkt stämmig, aber nicht „groß wie ein Schrank“ – die Größe zeigt sich erst neben anderen Figuren im Szenenbild.
- Der Fremde: Bei vielen Seeds zeichnet das Modell in den Seitenansichten ein Menschengesicht. Beim Erzeugen von Szenen darauf achten, dass das Gesicht im Schatten bleibt. Seine Stiefel sehen recht modern aus.
- Der Fremde hält den Brief mit dem Spiralsiegel – streng genommen ein Szenenzustand (Perle 1, Nacht).

## Die vier Mentoren (Yrsa, Borrik und Vael bestätigt 12.10.2026; Nerelle überarbeitet, Abnahme offen)
Grundaussehen nach `docs/worldbuilding/figuren-aussehen.md`; ergänzte Details stehen dort als Vorschlag.

| Datei | Entstanden aus |
|---|---|
| `yrsa-einzel.png` | `yrsa-einzel.prompt.txt`, Seed 6, 832×1216 |
| `borrik-einzel.png` | `borrik-einzel.prompt.txt`, Seed 3, 832×1216 |
| `nerelle-einzel.png` | `nerelle-einzel.prompt.txt`, Seed 6, danach Haarfarbe per Bildreferenz auf Silbergrün geändert (Seed 1) |
| `vael-einzel.png` | `vael-einzel.prompt.txt`, Seed 1, 832×1216 |
| `<name>-referenzblatt.png` | `blatt-allgemein.prompt.txt`, 2048×832, Referenz das jeweilige Einzelbild (Seeds: Yrsa 3, Borrik 6, Nerelle 4, Vael 2) |

**Bekannte Schwächen:**
- Nerelle: Das Referenzblatt wurde nachträglich umgefärbt (`nerelle-blatt-haar.prompt.txt` mit dem Blatt selbst als Referenz, Seed 1), weil das Modell das Haar auf Blättern immer silbergrau malt. Das Grün ist jetzt sichtbar, aber blass.
- Yrsa blickt sehr grimmig; laut Story ist sie streng, aber nicht unfreundlich.
- Borrik: Sein Stab sieht nach Holz aus, nicht nach Stein. Der Bart steckt nicht sichtbar im Gürtel.
- Vael: Die Mütze fehlt bewusst (Szenenzustand).

## Neue Fassungen zur Abnahme (13.10.2026, Aufträge aus `docs/auftraege.md`)
Die bisherigen Bilder von Grumak und dem Fremden bleiben liegen, bis Pasco den neuen zugestimmt hat. Die neuen Dateien enden auf `-neu` und sind noch **nicht im Repo**.

| Datei | Entstanden aus |
|---|---|
| `grumak-einzel-neu.png` | `grumak-einzel-neu.prompt.txt`, Seed 2, 1024×1216, nur aus Text. Die blasse Bleistiftfigur daneben ist ein Größenvergleich mit einem Menschen. |
| `grumak-referenzblatt-neu.png` | `grumak-blatt.prompt.txt`, Seed 1, 2048×832, Referenz `grumak-einzel-neu.png` |
| `fremder-einzel-neu.png` | `fremder-einzel-neu.prompt.txt`, Seed 4, 832×1216; danach beide Augen als Schimmer ergänzt (`fremder-augen.prompt.txt`, Seed 4) |
| `fremder-referenzblatt-neu.png` | `fremder-blatt.prompt.txt`, Seed 8, 2048×832, Referenz `fremder-einzel-neu.png` |

**Erfahrungen:**
- Grumak ließ sich mit dem alten Bild als Referenz nicht vergrößern (die Referenz hält den Körperbau fest). Geholfen hat ein neues Bild aus Text mit einer Vergleichsfigur im Prompt.
- Grumaks graue Strähnen sind kaum zu sehen.
- Der Fremde: Auf dem Referenzblatt ist das Gesicht fast ganz schwarz, und er wirkt weniger groß und schlank. Für Gesicht und Gestalt ist das Einzelbild maßgeblich.

## Requisiten
`docs/art/requisiten/spiralsiegel.png`: dunkelgrünes Wachssiegel mit der Spirale aus vier Linien. Die Linien sind in `spiralsiegel-vorlage.png` exakt vorgezeichnet (nur aus Text zählt das Modell sie nicht zuverlässig); daraus mit `spiralsiegel.prompt.txt` und der Vorlage als Referenz erzeugt, Seed 6, 1024×1024.

## Übersichten zum Auswählen
`tools/bilduebersicht.ps1` setzt mehrere Seeds zu einem nummerierten Übersichtsbild zusammen.
