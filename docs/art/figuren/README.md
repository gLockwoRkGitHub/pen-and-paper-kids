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

## Übersichten zum Auswählen
`tools/bilduebersicht.ps1` setzt mehrere Seeds zu einem nummerierten Übersichtsbild zusammen.
