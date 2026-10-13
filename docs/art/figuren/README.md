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

## Die vier Mentoren (alle vier von Pasco bestätigt; Nerelle am 13.10.2026)
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

## Grumak und der Fremde – aktuelle Fassung (13.10.2026)
Die Fassungen vom 13.10.2026 haben die ersten Bilder ersetzt (beide von Pasco angenommen).

| Datei | Entstanden aus |
|---|---|
| `grumak-einzel.png` | `grumak-einzel-neu.prompt.txt`, Seed 2, 1024×1216, nur aus Text. Die blasse Bleistiftfigur daneben ist ein Größenvergleich mit einem Menschen. |
| `grumak-referenzblatt.png` | `grumak-blatt.prompt.txt`, Seed 1, 2048×832, Referenz `grumak-einzel.png` |
| `fremder-einzel.png` | `fremder-einzel-v3.prompt.txt`, Seed 2, 832×1216, nur aus Text. **Von Pasco gewählt (13.10.2026).** Die blasse Bleistiftfigur daneben ist ein Größenvergleich. |
| `fremder-referenzblatt.png` | `fremder-blatt.prompt.txt`, Seed 2, 2048×832, Referenz `fremder-einzel.png` |
| `fremder-vergleich.png` | Übersicht: links die Fassung vom 12.10. (schwarzes Gesicht), daneben die sechs Seeds des dritten Versuchs |

**Der Fremde – Entscheidung von Pasco (13.10.2026):** Seed 2 des dritten Versuchs. Das Gesicht ist unter der Kapuze **sichtbar** (schmales, freundliches Gesicht, dunkles Haar, leises Lächeln). Das weicht von der bisherigen Vorgabe „Gesicht im Schatten, nie ein ganzes Gesicht“ ab; `docs/worldbuilding/der-fremde.md` ist entsprechend ergänzt. Die Szenen-Prompts beschreiben noch das Gesicht im Schatten.

**Bekannte Schwächen:**
- Grumaks graue Strähnen sind kaum zu sehen; mit dem alten Bild als Referenz ließ er sich nicht vergrößern, deshalb neu aus Text.
- Der Fremde: Die Augen sind normale helle Augen, kein silbriger Schimmer. Der Stab reicht nur bis zur Hüfte statt bis zur Schulter. Auf dem Referenzblatt wirkt er jünger und weniger groß als auf dem Einzelbild.
## Figuren aus Perle 1, Schritt B (13.10.2026, Aussehen ist Vorschlag)
Einzelbild: `<name>-einzel.prompt.txt`, 832×1216, nur aus Text. Referenzblatt: `blatt-allgemein.prompt.txt`, 2048×832, Referenz das Einzelbild.

| Figur | Seed Einzelbild | Seed Blatt | Bekannte Schwächen |
|---|---|---|---|
| `grisk` | 2 | 2 | – |
| `brann` | 1 | 1 | Glatze; Statur eher stämmig als „breit wie eine Tür“ |
| `orwin` | 4 | 2 | Auf dem Blatt fehlt die zweite Brille auf der Stirn |
| `fink` | 4 | 3 | Jacke und Hose wirken recht modern; auf der Mütze ein kleines Zeichen, das nicht als Hand zu erkennen ist |
| `soeldner-waage` | 2 | 1 | Schwert in der Scheide; Waage gut erkennbar |
| `stadtwache` | 1 | 4 | Speer nur in der Vorderansicht des Blatts |
| `herold` | 2 | 1 | – |
| `gnom-obsthaendler` | 3 | 1 | Sehr gartenzwergig; hält einen Apfel (Requisit) |
| `brakka` | 3 | 3 | Schraubenschlüssel nur im Einzelbild |
| `fitzel` | 3 | 2 | – |
| `maren` | 3 | 2 | – |
| `bonifaz` | 4 | 1 | Bauch kleiner als „wie ein Fass“ |
| `mutter-kessel` | 1 | 2 | – |
| `holm` | 2 (zweite Runde) | 2 | Erste Runde sah nach Bomberjacke und Turnschuhen aus; Prompt nachgeschärft |
| `ysolde` | 3 | 2 | Federn im Haar sehen auf dem Blatt wie Ohren aus |
| `rhea` | 2 | 1 | – |

## Requisiten
`docs/art/requisiten/spiralsiegel.png`: dunkelgrünes Wachssiegel mit der Spirale aus vier Linien. Die Linien sind in `spiralsiegel-vorlage.png` exakt vorgezeichnet (nur aus Text zählt das Modell sie nicht zuverlässig); daraus mit `spiralsiegel.prompt.txt` und der Vorlage als Referenz erzeugt, Seed 6, 1024×1024.

## Übersichten zum Auswählen
`tools/bilduebersicht.ps1` setzt mehrere Seeds zu einem nummerierten Übersichtsbild zusammen.
