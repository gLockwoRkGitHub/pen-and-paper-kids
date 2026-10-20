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
- Der Fremde: Bei vielen Seeds zeichnet das Modell in den Seitenansichten ein Menschengesicht. (Überholt: Seit 13.10.2026 ist das Gesicht sichtbar, siehe unten.) Seine Stiefel sehen recht modern aus.
- Der Fremde hält den Brief mit dem (früheren) Spiralsiegel – streng genommen ein Szenenzustand (Perle 1, Nacht).

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

**Der Fremde – Entscheidung von Pasco (13.10.2026):** Seed 2 des dritten Versuchs. Das Gesicht ist unter der Kapuze **sichtbar** (schmales, freundliches Gesicht, dunkles Haar, leises Lächeln). Das weicht von der bisherigen Vorgabe „Gesicht im Schatten, nie ein ganzes Gesicht“ ab; `docs/worldbuilding/der-fremde.md` ist entsprechend ergänzt. Die Szenen-Prompts sind angepasst (14.10.2026).

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
`docs/art/requisiten/ringsiegel.png` (**noch zu erzeugen**): dunkelgrünes Wachssiegel mit vier verschlungenen Ringen. Das Zeichen ist in `ringsiegel-vorlage.png` exakt vorgezeichnet (`tools/siegel-vorlage.py`); daraus mit `ringsiegel.prompt.txt` und der Vorlage als Referenz erzeugen. Das frühere `spiralsiegel.png` ist abgeschafft (14.10.2026, zu nah am Hakenkreuz).

## Übersichten zum Auswählen
`tools/bilduebersicht.ps1` setzt mehrere Seeds zu einem nummerierten Übersichtsbild zusammen.

## Der Fremde – Schließe als Ringzeichen (R2, 14.10.2026)
Die alte Schließe war eine Spirale (abgeschafft, siehe `docs/art/art-style.md`, „Verbotene Formen“). Gesicht und Bild sind abgenommen, deshalb wurde **nur die Schließe ersetzt**, nicht das Bild neu erzeugt:
1. Bearbeitungsfassung mit FLUX.2 klein und dem Original plus `requisiten/ringzeichen.png` als Referenz („alles gleich, nur die Schließe aus vier verschlungenen Ringen“), 6 Seeds (Blatt: 4 Seeds).
2. Aus der besten Fassung (Einzelbild Seed 5, Blatt Seed 2) nur den runden Bereich der Schließe ausgeschnitten und weich überblendet ins **Original** eingesetzt (Python/PIL statt Krita). Gesicht, Haltung und alles andere sind pixelgleich mit der abgenommenen Fassung.
3. Auf dem Blatt in der Dreiviertelansicht die kleine Spiralscheibe mit Mantelgrau übermalt und eine verkleinerte Ringschließe eingesetzt. Seiten- und Rückansicht zeigen keine Schließe.

## Figuren aus Perle 2–7 (lokale Sitzung, 14.10.2026; Aussehen laut `figuren-aussehen.md`)
Einzelbild: `<name>-einzel.prompt.txt`, 832×1216, 6 Seeds, nur aus Text. Referenzblatt: `blatt-allgemein.prompt.txt`, 2048×832, 4 Seeds, Referenz das Einzelbild (Seed des Blatts steht in der Spalte).

| Figur | Seed Einzelbild | Seed Blatt | Entscheidung / bekannte Schwächen |
|---|---|---|---|
| `kettrich` | Runde 3 | 2 | Runde 1 und 2 (12 Seeds): immer eine normale Brille. Runde 3: Seed 1 mit `kettrich-brille.prompt.txt` als Bildbearbeitung („drei Gläser übereinander“), Seed 4 gewählt: pro Auge drei kleine Linsen senkrecht übereinander. **Auf dem Blatt nur eine normale runde Brille** – in Szenen das Einzelbild als Referenz nehmen |
| `mirk` | 2 | 2 | Gesprungene Brille kaum zu sehen |
| `seraphine-arvelle` | 5 | 3 | Elegant, freundlich-kühl, keine Märchenhexe |
| `vater-arvelle` | 1 | 3 | Auf dem Blatt ist der Mantel dunkelgrün statt schwarz |
| `ambra` | Runde 3 | 1 | Runde 1 und 2: immer Augenbrauen. Runde 3: Seed 3 mit `ambra-augenbrauen.prompt.txt` als Bildbearbeitung, Seed 3 gewählt (lacht mit geschlossenen Augen, keine Augenbrauen). Die anderen Seeds der Runde 3 hatten kein Gesicht mehr |
| `hulda` | 3 | 2 | Mädchen ohne Bart |
| `gnomenjunge` | 4 | 3 | – |
| `schreiber-waage` | 3 | 3 | – |
| `merla` | 4 | 4 | Hält einen Spaten (Requisit) |
| `strell` | 2 | 1 | Schwert in der Scheide |
| `jorrit` | 1 | 4 | Ziege daneben |
| `ashka` | 1 | 2 | Wirkt eher wolfs- als hyänenartig, aber gefleckt und ruhig. Eingerissenes Ohr kaum zu sehen |
| `wuk` | 11 (Runde 2) | 2 | Runde 1 sah aus wie ein Tierjunges; Prompt nachgeschärft (aufrecht, Hände mit Fingern, Kiesel). Wirkt weiter sehr tierhaft (Hyänenjunges auf zwei Beinen) |
| `gnoll` | 1 | 3 | Speer in der Hand |
| `dorn` | 3 | 1 | – |
| `talin` | 3 | 2 | – |
| `koboldkind` | 4 | 1 | – |
| `pell` | 3 | 3 | – |
| `ratsherr` | 3 | 3 | – |
| `durgash` | 3 | 1 | Nur in diesem Seed ist ein Hauer sichtbar abgebrochen |
| `haldor` | 3 | 3 | – |
| `faehrfrau` | 4 | 3 | Auf dem Ruderblatt vier Ringe im Kreis, nicht ganz sauber verschlungen (Mitte nicht ganz frei) |

## Zeichen der Leisen Hand (19.10.2026)
Auf Finks Mütze sah das Zeichen in `fink-einzel.png` und `fink-referenzblatt.png` wie ein ausgestreckter Mittelfinger aus. Ersetzt mit `tools/zeichen-einsetzen.py --zeichen docs/art/requisiten/leise-hand-zeichen.png --grund <Farbe>` (neuer Aufnäher mit Gesicht und Zeigefinger über den Lippen). Auf dem Referenzblatt in Seiten- und Dreiviertelansicht übermalt (dort nur von der Seite zu sehen). Die Prompts beschreiben das Zeichen jetzt genauer.

**Überarbeitet (19.10.2026, Pasco):** Der eingesetzte Aufnäher wirkte wie per Copy & Paste aufgeklebt. Neu: Das Modell malt den Aufnäher selbst im Bildstil (`figuren/fink-abzeichen.prompt.txt`, Referenzen: Originalbild + `requisiten/leise-hand-zeichen.png`); weil es dabei teils auch Fink veränderte, wurde mit `tools/bereich-mischen.py` nur die Mützenpartie ins Original übernommen. `tools/zeichen-einsetzen.py` ist für Aufnäher nicht mehr zu verwenden (nur für flache Zeichen wie Kreide oder Schnitzerei).

## Übernommene Kandidaten aus der Bildprüfung (Pasco, 20.10.2026)
Kettrich, Durgash, Orwin, Merla, Fink, Gnoll, Ashka, Ysolde, Pell, Mirk und die Fährfrau: Die Kandidaten (Bildbearbeitung des Originals) sind jetzt `<name>-einzel.png`. Strell bleibt wie er war. Referenzblätter neu erzeugt (`blatt-allgemein.prompt.txt`, 4 Seeds): Kettrich 2, Durgash 1, Orwin 2, Merla 2, Fink 1, Gnoll 1, Ashka 1, Ysolde 1, Pell 1, Mirk 2, Fährfrau 2. Schwäche: Die Fährfrau hält auf dem Blatt keinen Stab (in allen Seeds); Kettrich trägt auf dem Blatt eine runde Brille ohne Lupe.
