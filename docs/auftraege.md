# Aufträge

Offene Arbeit, vor allem für die **lokale Claude-Sitzung** auf Pascos PC (Bilder, Audio, alles mit GPU).
Die Liste wird beim Start jeder Claude-Code-Sitzung automatisch angezeigt (`tools/sitzungsstart.js`).

Regeln:
- Offene Aufträge: `- [ ]`, erledigte: `- [x]` (mit Datum und Ergebnis-Datei).
- Wer einen Auftrag erledigt, hakt ihn ab, committet und pusht. Lieber oft kleine Commits (z. B. je Abschnitt) als einen riesigen.
- Rückfragen nicht raten, sondern Pasco fragen. Bei reinen Auswahlfragen (welcher Seed?) selbst nach der Prüfliste entscheiden und weiterarbeiten.

## Perle 1 – alle Bilder (Auftrag vom 12.10.2026)

Beschreibung jedes Bildes: `docs/art/szenen/perle-1/README.md`. Die Prompts liegen fertig als `.prompt.txt` bereit, sie müssen nicht neu geschrieben werden.
Aussehen der Figuren: `docs/worldbuilding/figuren-aussehen.md`. Lage der Orte: `docs/worldbuilding/karte-meridel.md`.

**So wird jedes Bild gemacht**
1. Erzeugen mit FLUX.2 klein, **6 Seeds** (`--anzahl 6`), Format steht in der ersten Zeile der Prompt-Datei.
2. Mit `tools/bilduebersicht.ps1` ein Übersichtsbild bauen und das beste Bild nach der **Prüfliste** wählen. Passt keins, Prompt leicht nachschärfen (Änderung als Kommentarzeile `#` in der Datei festhalten) und neu würfeln. Höchstens drei Runden, dann das beste nehmen und die Schwäche im README notieren.
3. Das gewählte Bild auf den Zielnamen umbenennen (ohne `-s<seed>`), die übrigen Seeds **nicht** committen.
4. In der README des Ordners eine Zeile ergänzen: Datei, Prompt, Seed, Größe, Referenzen, bekannte Schwächen.

**Prüfliste**
- Ich-Perspektive: **keine Hände, Arme, Füße, kein Schatten der Spielfigur**. Das ist der häufigste Fehler und ein Ausschlussgrund.
- Keine lesbaren Buchstaben, Zahlen oder Pseudo-Schrift (Schilder bleiben leer).
- Tickwort: **ein** Auge, **drei** Beine, **Zangen** statt Hände, Schornstein.
- Liora/Cassian: etwa zwölf Jahre, also nicht zu jung; gepflegte grüne Samtjacke, nur der Szenenzustand darf abweichen.
- Der Fremde: Gesicht im Schatten, Augen **schimmern** und leuchten nicht, nie ein ganzes Gesicht.
- Grumak überragt alle deutlich.
- Söldner: schwarze Mäntel, goldene Waage auf der Brust. Waffen bleiben in der Scheide.
- Kein Blut, nichts Gruseliges. Finster ist erlaubt, Horror nicht.

**Mehrere Referenzbilder:** `tools/erzeuge-bild.js` nimmt jetzt mehrere Referenzen, mit Komma getrennt (`--referenz a.png,b.png`). Das ist **noch ungetestet**: Zuerst einmal mit zwei Referenzen ausprobieren. Wenn ComfyUI einen Fehler meldet, das Skript reparieren. Leidet die Qualität bei drei Referenzen, nur die wichtigsten zwei nehmen (Reihenfolge in der Prompt-Kopfzeile = Wichtigkeit).

Beispiele:
```
node tools/erzeuge-bild.js docs/art/figuren/grisk-einzel.prompt.txt docs/art/figuren/grisk-einzel --anzahl 6 --breite 832 --hoehe 1216
node tools/erzeuge-bild.js docs/art/figuren/blatt-allgemein.prompt.txt docs/art/figuren/grisk-referenzblatt --anzahl 4 --breite 2048 --hoehe 832 --referenz docs/art/figuren/grisk-einzel.png
node tools/erzeuge-bild.js docs/art/szenen/perle-1/szene-hafen-kran.prompt.txt docs/art/szenen/perle-1/szene-hafen-kran --anzahl 6 --referenz docs/art/figuren/grisk-einzel.png,docs/art/figuren/brann-einzel.png,docs/art/orte/hafen.png
```

### Schritt A – Grumak und der Fremde
- [ ] **Grumak** (von Pasco angenommen, 12.10.2026): `grumak-einzel-neu.png` und `grumak-referenzblatt-neu.png` ersetzen die alten Dateien als `grumak-einzel.png` und `grumak-referenzblatt.png`. Danach `docs/art/figuren/README.md` anpassen.
- [ ] **Der Fremde, dritter Versuch:** `docs/art/figuren/fremder-einzel-v3.prompt.txt`, 6 Seeds, 832×1216, nur aus Text. Das Ziel steht in den Kommentarzeilen: größer und schlanker, unteres Gesicht sanft beleuchtet, Augen nur kleine matte Silberfunken. Ist ein Seed besser als `fremder-einzel-neu.png`, wird er zum neuen `fremder-einzel.png`, und dazu kommt ein neues Referenzblatt (`fremder-blatt.prompt.txt`). Sonst wird `fremder-einzel-neu.png` zu `fremder-einzel.png`. Beide Kandidaten in einer Übersicht für Pasco ablegen.

### Schritt B – Neue Figuren (Einzelbild 832×1216 + Referenzblatt 2048×832 mit `blatt-allgemein.prompt.txt`)
- [ ] **Grisk** (`grisk-einzel.prompt.txt`)
- [ ] **Hafenmeister Brann** (`brann-einzel.prompt.txt`)
- [ ] **Meister Orwin** (`orwin-einzel.prompt.txt`)
- [ ] **Fink** (`fink-einzel.prompt.txt`)
- [ ] **Söldner der Goldenen Waage** (`soeldner-waage-einzel.prompt.txt`)
- [ ] **Stadtwache** (`stadtwache-einzel.prompt.txt`)
- [ ] **Herold** (`herold-einzel.prompt.txt`)
- [ ] **Gnomen-Obsthändler** (`gnom-obsthaendler-einzel.prompt.txt`)
- [ ] **Brakka** und **Fitzel** (`brakka-einzel.prompt.txt`, `fitzel-einzel.prompt.txt`)
- [ ] **Die sechs Bezugspersonen:** Maren, Bonifaz, Mutter Kessel, Meister Holm, Meisterin Ysolde, Kapitänin Rhea (`<name>-einzel.prompt.txt`)

### Schritt C – Requisiten (`docs/art/requisiten/`) und Ortsbilder (`docs/art/orte/`)
- [ ] **Requisiten:** `glaskugel-blitz`, `erzmarke`, `kompass` (je 1024×1024), `dampfkarren` (1216×832)
- [ ] **Ortsbilder** (1536×1024): `hafen`, `marktplatz`, `klippen-von-ahrn`

### Schritt D – Szenenbilder (`docs/art/szenen/perle-1/`, 1536×1024, Referenzen stehen in der ersten Zeile jeder Prompt-Datei)
- [ ] 1 `szene-lysmara-abend` · 2 `szene-sonnenuntergang-hafen`
- [ ] 3 `szene-bezugsperson-packt-<hintergrund>` (sechs Varianten)
- [ ] 4 `szene-fremder-im-regen` · 5 `szene-eintreiber-fesk` · 6 `szene-nordkai-kisten` · 7 `szene-morgen`
- [ ] 8 `szene-zwirbelgasse` (zuerst, sie ist die Ortsreferenz für 9) · 9 `figur-tickwort`
- [ ] 10 `szene-hafen-kran` · 11 `szene-weite-feder` · 12 `szene-klippen-leuchtturm`
- [ ] 13 `szene-markt` · 14 `szene-stadtwache` · 15 `figur-grumak`
- [ ] 16 `szene-freund-faellt-liora` / `-cassian` · 17 `figur-freund-liora` / `-cassian`
- [ ] 18 `entdeckung-ausrufer-ratshalle` · 19 `szene-goblin-werkstatt`

### Schritt E – Tagebuch und Karten (`docs/art/szenen/perle-1/`)
- [ ] 20 `tagebuch-perle-1` (Referenz `docs/art/karten/lysmara-lagevorlage.png`) · 21 `karte-lysmara-erste-skizze`, `tagebuch-erzmarke`, `tagebuch-kompass`, `karte-meridel-perle-1` (Referenz `docs/art/karten/meridel-lagevorlage.png`). Wenn die Anordnung mit FLUX nicht stimmt, SDXL mit Linienvorlage (ControlNet in Krita) versuchen und das Ergebnis im README festhalten.

### Schritt F – Zum Schluss
- [ ] **Übersicht für Pasco:** alle gewählten Bilder von Perle 1 in einem oder zwei Übersichtsbildern (`docs/art/szenen/perle-1/uebersicht-*.png`) und in der README die Liste mit Schwächen. Dann Pasco Bescheid geben, dass Claude im Chat die Bilder prüfen kann.

## Perle 3 – Figuren und Szenenbilder (Auftrag vom 13.10.2026)

Erst **nach** den Bildern von Perle 1 (Schritte A–F) beginnen, denn viele Figuren und Ortsbilder von dort werden hier als Referenz gebraucht.
Beschreibung jedes Bildes: `docs/art/szenen/perle-3/README.md`. Fertige Prompts liegen daneben. Ablauf und Prüfliste wie bei Perle 1.

### Schritt G – Neue Figuren (Einzelbild 832×1216 + Referenzblatt 2048×832 mit `blatt-allgemein.prompt.txt`)
- [ ] **Meister Kettrich** und **Mirk** (`kettrich-einzel.prompt.txt`, `mirk-einzel.prompt.txt`) – stammen aus Perle 2, hatten noch kein Bild
- [ ] **Seraphine Arvelle** und **der Vater** (`seraphine-arvelle-einzel.prompt.txt`, `vater-arvelle-einzel.prompt.txt`) – Prüfen: Seraphine wirkt elegant und freundlich-kühl, keine Märchenhexe
- [ ] **Meisterin Ambra** (`ambra-einzel.prompt.txt`) – Prüfen: wirklich **keine Augenbrauen**
- [ ] **Hulda**, **der Gnomenjunge**, **Schreiber der Waage** (`hulda-`, `gnomenjunge-`, `schreiber-waage-einzel.prompt.txt`) – Prüfen: Hulda ist ein Mädchen ohne Bart

### Schritt H – Requisiten und Ortsbilder
- [ ] **Gildenzeichen** (`requisiten/gildenzeichen.prompt.txt`, 1536×1024): fünf Gegenstände nebeneinander
- [ ] **Ortsbilder** (1536×1024): `orte/tuchhalle`, `orte/gewoelbe`, `orte/phiole-hof`

### Schritt I – Szenenbilder (`docs/art/szenen/perle-3/`, 1536×1024)
- [ ] 1 `szene-morgen-mentor-<element>` (vier Varianten: erde, wasser, feuer, wind)
- [ ] 2 `szene-tickwort-werkstatt` · 3 `entdeckung-gildentag`
- [ ] 4 `szene-tuchhalle-pruefung` · 5 `szene-gewoelbe-pruefung` · 6 `szene-raum-der-vier` (Spirale mit genau vier Linien, Vorlage `requisiten/spiralsiegel-vorlage.png`)
- [ ] 7 `szene-phiole-pruefung` · 8 `szene-zelt-der-waage` (Goldknopf gut sichtbar) · 9 `szene-zelt-register`
- [ ] 10 `entdeckung-magiergesetz-liora` / `-cassian` (das Kind steht **hinter** den Eltern, Blick gesenkt)
- [ ] 11 `szene-brunnen-abend-liora` / `-cassian` · 12 `szene-gildenlaternen`
- [ ] 13 `szene-beitritt-webstuhl`, `-feder`, `-phiole`, `-hand`
- [ ] 14 `szene-brunnen-nacht-liora` / `-cassian` · 15 `szene-heimweg-nacht` · 16 `tagebuch-perle-3`
- [ ] **Übersicht für Pasco** (`docs/art/szenen/perle-3/uebersicht-*.png`) und Liste der Schwächen im README.

## Perle 4 – Figuren und Szenenbilder (Auftrag vom 13.10.2026)

Erst **nach** Perle 1 und 3 beginnen. Beschreibung jedes Bildes: `docs/art/szenen/perle-4/README.md`. Fertige Prompts liegen daneben. Ablauf und Prüfliste wie bei Perle 1.
Neu in der Prüfliste: **Das Graue** ist farblos und still, ohne Nebel, ohne Gesichter, ohne Monster. **Gnolle** sind mager und müde, keine gefletschten Zähne.

### Schritt J – Neue Figuren (Einzelbild 832×1216 + Referenzblatt 2048×832 mit `blatt-allgemein.prompt.txt`)
- [ ] **Merla**, **Hauptmann Strell**, **Jorrit** (`merla-`, `strell-`, `jorrit-einzel.prompt.txt`)
- [ ] **Ashka**, **Wuk**, **Gnoll allgemein** (`ashka-`, `wuk-`, `gnoll-einzel.prompt.txt`) – Prüfen: hyänenartig, gefleckt, nicht bedrohlich; Wuk ist erkennbar ein Gnoll, kein Hundewelpe

### Schritt K – Ortsbilder (1536×1024)
- [ ] `orte/wollmark`, `orte/ginsterhof`, `orte/das-graue`, `orte/gnollenschlucht`

### Schritt L – Szenenbilder (`docs/art/szenen/perle-4/`, 1536×1024)
- [ ] 1 `szene-landtor-morgen` · 2 `figur-freund-verkleidet-liora` / `-cassian` · 3 `entdeckung-weiden`
- [ ] 4 `szene-lamm-auf-der-strasse-liora` / `-cassian` · 5 `entdeckung-wollmark` · 6 `figur-strell`
- [ ] 7 `szene-gasthaus-krummer-stab-liora` / `-cassian` · 8 `szene-freund-abgeholt-liora` / `-cassian` (Strell verbeugt sich)
- [ ] 9 `szene-ginsterhof` · 10 `szene-das-graue` · 11 `szene-fremder-am-grauen`
- [ ] 12 `szene-gnollenlager` · 13 `figur-ashka` · 14 `szene-nacht-das-schweigen`
- [ ] 15 `szene-ruf-erde`, `-wasser`, `-feuer`, `-wind` · 16 `szene-morgen-danach`
- [ ] 17 `tagebuch-perle-4` · 18 `karte-meridel-perle-4`
- [ ] **Übersicht für Pasco** (`docs/art/szenen/perle-4/uebersicht-*.png`) und Liste der Schwächen im README.

## Perle 5 – Figuren und Szenenbilder (Auftrag vom 13.10.2026)

Erst **nach** Perle 1, 3 und 4 beginnen. Beschreibung jedes Bildes: `docs/art/szenen/perle-5/README.md`. Fertige Prompts liegen daneben. Ablauf und Prüfliste wie bei Perle 1.
Neu in der Prüfliste: **Unter der Erde trotzdem warm und lesbar**, keine schwarzen Flächen. **Zwergenzeichen** nur als Ornamente, keine Buchstaben. Im Herz des Berges: **genau vier** Linien in der Spirale und **vier** Lichter im Kristall.

### Schritt M – Neue Figuren und Requisiten
- [ ] **Gildenaufseher Dorn**, **Talin**, **Koboldkind** (`dorn-`, `talin-`, `koboldkind-einzel.prompt.txt`; Einzelbild 832×1216 + Referenzblatt)
- [ ] **Requisiten** (1024×1024): `stimmerz`, `herzsplitter`, `singlampe`

### Schritt N – Ortsbilder (1536×1024)
- [ ] `orte/minentor`, `orte/glimmhalde`, `orte/tiefe-stiege`, `orte/herz-des-berges`

### Schritt O – Szenenbilder (`docs/art/szenen/perle-5/`, 1536×1024)
- [ ] 1 `szene-brief-in-wollmark` · 2 `entdeckung-orin-treidelpfad` · 3 `entdeckung-minentor` · 4 `entdeckung-glimmhalde`
- [ ] 5 `szene-neumond-glimmhalde` · 6 `szene-tiefe-stiege` · 7 `szene-talin` · 8 `szene-der-schlund`
- [ ] 9 `szene-vermisste-kobolde` · 10 `szene-wiedersehen-<hintergrund>` (sechs Varianten)
- [ ] 11 `szene-herz-des-berges` · 12 `szene-flucht-tiefe-stiege` · 13 `szene-glimmhalde-fest` · 14 `tagebuch-perle-5`
- [ ] **Übersicht für Pasco** (`docs/art/szenen/perle-5/uebersicht-*.png`) und Liste der Schwächen im README.

## Perle 6 – Figuren und Szenenbilder (Auftrag vom 13.10.2026)

Erst **nach** Perle 1, 3, 4 und 5 beginnen. Beschreibung jedes Bildes: `docs/art/szenen/perle-6/README.md`. Fertige Prompts liegen daneben. Ablauf und Prüfliste wie bei Perle 1.
Neu in der Prüfliste: **genau vier Farben** (braun, blau, rot, weiß) bei Kugeln, Funken, Kuppel und Ruf. **Das Schweigen ohne Nebel**, nur fehlende Farbe. **Spiegel mit Riss** ab Bild 11. Bei der Vorführung **fehlt ein Goldknopf** am Ärmel von Liora/Cassian.

### Schritt P – Neue Figuren und Requisiten
- [ ] **Magister Pell**, **ältester Ratsherr** (`pell-`, `ratsherr-einzel.prompt.txt`; Einzelbild 832×1216 + Referenzblatt)
- [ ] **Requisiten** (1024×1024): `plakette-waage`, `kugel-im-korb`

### Schritt Q – Ortsbilder (1536×1024)
- [ ] `orte/vardholm`, `orte/vardholm-hof`, `orte/kugelhalle`

### Schritt R – Szenenbilder (`docs/art/szenen/perle-6/`, 1536×1024)
- [ ] 1 `entdeckung-spaltstrasse-vardholm` · 2 `szene-yrsas-karren` · 3 `szene-mauer-vardholm` · 4 `entdeckung-vardholm-hof`
- [ ] 5 `szene-kugelhalle` · 6 `szene-modell-des-walls` · 7 `entdeckung-vorfuehrung-<liora|cassian>` · 8 `szene-hinter-dem-stall-<liora|cassian>`
- [ ] 9 `szene-festmahl-vardholm` · 10 `szene-funken-frei` · 11 `szene-schweigen-im-spalt`
- [ ] 12 `szene-ruf-gross-<erde|wasser|feuer|wind>` · 13 `entdeckung-vardholm-morgen` · 14 `tagebuch-perle-6`
- [ ] **Übersicht für Pasco** (`docs/art/szenen/perle-6/uebersicht-*.png`) und Liste der Schwächen im README.

## Erledigt
- [x] **Grumak neu erzeugen** (Einzelbild + Referenzblatt). Er ist „groß wie ein Schrank“: deutlich größer und massiger als ein Mensch, breite Schultern, deutliche untere Hauer, graue Strähnen, goldene Ringe in beiden Ohren – Gesicht und Kleidung wie bisher (freundlich, müde, Händlertunika). Verbindlich: `docs/worldbuilding/figuren-aussehen.md`. Am besten mit dem bisherigen Einzelbild als Referenz und Änderungs-Prompt („gleiche Figur, Kleidung und Gesicht, aber viel größer und massiger …“). Ohne Nüsse in der Hand (Requisit gehört in die Szene). → 13.10.2026: `docs/art/figuren/grumak-einzel-neu.png`, `grumak-referenzblatt-neu.png` (lokal, warten auf Abnahme).
- [x] **Der Fremde neu erzeugen** (Einzelbild + Referenzblatt) nach `docs/worldbuilding/der-fremde.md`: groß und schlank, Reisemantel statt Mönchsgewand, Kinn und Mund im Schatten schwach sichtbar, silbrig **schimmernde** (nicht leuchtende) Augen, Bronzeschließe als Spirale aus vier Linien, Treibholzstab, Bergstaub an den Stiefeln. **Ohne Brief** im Referenzblatt (Brief = Szenenzustand). → 13.10.2026: `docs/art/figuren/fremder-einzel-neu.png`, `fremder-referenzblatt-neu.png` (lokal, warten auf Abnahme).
- [x] **Spiralsiegel** als eigenes kleines Bild: dunkelgrünes Wachs, Spirale aus **vier** ineinander gewundenen Linien (`docs/art/requisiten/spiralsiegel.png`). → 13.10.2026: im Repo, dazu `spiralsiegel-vorlage.png`.
