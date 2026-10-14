# Aufträge

Offene Arbeit, vor allem für die **lokale Claude-Sitzung** auf Pascos PC (Bilder, Audio, alles mit GPU).
Die Liste wird beim Start jeder Claude-Code-Sitzung automatisch angezeigt (`tools/sitzungsstart.js`).

Regeln:
- Offene Aufträge: `- [ ]`, erledigte: `- [x]` (mit Datum und Ergebnis-Datei).
- Wer einen Auftrag erledigt, hakt ihn ab, committet und pusht. Lieber oft kleine Commits (z. B. je Abschnitt) als einen riesigen.
- Rückfragen nicht raten, sondern Pasco fragen. Bei reinen Auswahlfragen (welcher Seed?) selbst nach der Prüfliste entscheiden und weiterarbeiten.

## Gesamtauftrag: alle Bilder des ersten Abenteuers (Stand 14.10.2026)

Alle Beschreibungen und Prompts für Perle 1–7 sind fertig. **Reihenfolge:**
0. **Zuerst:** Abschnitt „Zeichen des Kreises der Vier“ (R1–R6), weil spätere Bilder `ringsiegel.png` als Referenz brauchen
1. **Perle 1:** Schritte A–F sind erledigt; offen ist nur der Abschnitt „Nachbesserung Perle 1“ (Tickwort, Goblin-Werkstatt, Ratshalle)
2. **Perle 2:** Schritte V–W
3. **Perle 3:** Schritte G–I
4. **Perle 4:** Schritte J–L
5. **Perle 5:** Schritte M–O
6. **Perle 6:** Schritte P–R
7. **Perle 7:** Schritte S–U
8. **Tagebuch-Skizzen** (Taschen und Menschen): Schritte T1–T2, ganz am Ende, weil sie die Einzelbilder aller Figuren als Referenz brauchen

**Karten** (Abschnitt „Karten“, Schritte K1–K3) laufen getrennt davon: die Grundkarten möglichst früh, die Ortsskizzen gern nach der jeweiligen Perle, weil sie die Ortsbilder als Referenz nutzen können.

Je Perle erst Figuren, Requisiten und Ortsbilder, dann die Szenen (sie brauchen die anderen als Referenz). Nach jeder Perle committen, pushen und die Übersicht bauen. `npm test` meldet Bild-Tags ohne Prompt-Datei; dort steht derzeit nichts mehr.

## Zeichen des Kreises der Vier: Ringe statt Spirale (Auftrag vom 14.10.2026) – ZUERST

**Warum:** Die alte „Spirale aus vier Linien“ erinnert an ein Hakenkreuz. Pasco hat sie abgeschafft. Das Zeichen sind jetzt **vier ineinander verschlungene Ringe**: geschlossener Kreis wie ein Kleeblatt, jeder Ring nur mit seinen beiden Nachbarn verschlungen, Mitte frei. Details: `docs/worldbuilding/der-fremde.md` („Das Ringsiegel“), Regel: `docs/art/art-style.md` („Verbotene Formen“).
Die Story-Texte und alle Prompts sind schon umgestellt. Die alten Dateien `spiralsiegel*.png` sind aus dem Repo gelöscht.

**Prüfliste für jedes Bild mit dem Zeichen:** genau vier Ringe · im Kreis, nicht in einer Reihe (Audi) und nicht 3 + 2 versetzt (Olympia) · keine Drehform, kein Windrad, keine Haken · Mitte frei. Wenn das Modell es nicht sauber schafft: Zeichen weglassen und in Krita von Hand aus `requisiten/ringzeichen.png` einsetzen.

- [x] **R1 Ringsiegel:** `docs/art/requisiten/ringsiegel.png` mit `requisiten/ringsiegel.prompt.txt` und `--referenz docs/art/requisiten/ringsiegel-vorlage.png`, 1024×1024, 6 Seeds, bestes wählen. Eintrag in `requisiten/README.md` ergänzen (Seed). → **14.10.2026:** `docs/art/requisiten/ringsiegel.png` (Seed 5).
- [x] **R2 Der Fremde – Schließe:** In `figuren/fremder-einzel.png` und `figuren/fremder-referenzblatt.png` ist die Schließe eine Spirale. **Das Gesicht ist abgenommen und soll bleiben.** Deshalb bevorzugt nur die Schließe in Krita ersetzen (Inpainting oder von Hand übermalen: kleine runde Bronzeschließe aus vier verschlungenen Ringen, Vorlage `requisiten/ringzeichen.png`). Nur wenn das nicht gut aussieht: neu erzeugen mit `fremder-einzel-neu.prompt.txt` bzw. `fremder-blatt.prompt.txt` und das Ergebnis Pasco zur Abnahme zeigen. → **14.10.2026:** Nur die Schließe ersetzt (Ausschnitt aus einer Bearbeitungsfassung ins Original eingesetzt, Gesicht unverändert): `figuren/fremder-einzel.png`, `figuren/fremder-referenzblatt.png`. Beschreibung in `figuren/README.md`.
- [x] **R3 `szene-fremder-im-regen.png` (Perle 1):** Siegel auf dem Brief und Schließe zeigen die Spirale. Neu erzeugen mit dem aktualisierten Prompt (Referenzen: neues `fremder-einzel.png` aus R2, `requisiten/ringsiegel.png` aus R1) – oder Siegel und Schließe in Krita ersetzen, wenn das Bild sonst gut ist. → **14.10.2026:** `szenen/perle-1/szene-fremder-im-regen.png` neu (Seed 1).
- [x] **R4 Suchspiel Perle 1 prüfen:** `szene-zwirbelgasse.png` (Türbalken), `entdeckung-ausrufer-ratshalle.png` (Kreide am Pfeiler), `szene-klippen-leuchtturm.png` (Felsen; **im Sand ist eine Spirale, die muss auf jeden Fall weg**). Jede Spirale entfernen oder durch das Ringzeichen ersetzen (Krita reicht). Zur Sicherheit auch `figur-tickwort.png` und `uebersicht-*.png` ansehen und die Übersicht neu bauen. → **14.10.2026:** Klippen neu (Spirale weg), Zwirbelgasse und Ratshalle mit `tools/zeichen-einsetzen.py` bereinigt, Übersichten neu.
- [x] **R5 Alle übrigen fertigen Bilder durchsehen:** in `docs/art/` nach sichtbaren Spiralen suchen, die als Zeichen gemeint sein könnten (z. B. Tagebuch-Seiten, Ortsbilder). Fundstellen wie in R4 behandeln. → **14.10.2026:** Keine weiteren Fundstellen, siehe `szenen/perle-1/README.md`.
- [x] **R6 Abschluss:** committen, pushen, in diesem Abschnitt abhaken (mit Datum und Datei). → **14.10.2026:** Commit „R3–R6, Nachbesserung Perle 1, Grundkarten“.

Noch nicht erzeugte Bilder (Perle 3 `szene-raum-der-vier`, Perle 4 `szene-fremder-am-grauen`, Perle 5/7 Herz des Berges, Perle 7 Fährfrau und Steg, Tagebuch-Skizzen) brauchen nichts Extra: Ihre Prompts nennen schon die Ringe und `ringzeichen.png`/`ringsiegel.png` als Referenz. Nur die Prüfliste oben gilt dort auch.

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
- Der Fremde: wie `docs/art/figuren/fremder-einzel.png` (von Pasco am 13.10.2026 gewählt: Gesicht unter der Kapuze sichtbar). In Nachtszenen darf es im Schatten liegen; Augen leuchten nicht wie Lampen.
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
- [x] **Grumak** (von Pasco angenommen, 12.10.2026): `grumak-einzel-neu.png` und `grumak-referenzblatt-neu.png` ersetzen die alten Dateien als `grumak-einzel.png` und `grumak-referenzblatt.png`. Danach `docs/art/figuren/README.md` anpassen. → 13.10.2026 erledigt.
- [x] **Der Fremde, dritter Versuch:** `docs/art/figuren/fremder-einzel-v3.prompt.txt`, 6 Seeds, 832×1216, nur aus Text. Das Ziel steht in den Kommentarzeilen: größer und schlanker, unteres Gesicht sanft beleuchtet, Augen nur kleine matte Silberfunken. Ist ein Seed besser als `fremder-einzel-neu.png`, wird er zum neuen `fremder-einzel.png`, und dazu kommt ein neues Referenzblatt (`fremder-blatt.prompt.txt`). Sonst wird `fremder-einzel-neu.png` zu `fremder-einzel.png`. Beide Kandidaten in einer Übersicht für Pasco ablegen. → 13.10.2026 erledigt: Pasco hat anhand der Übersicht `docs/art/figuren/fremder-vergleich.png` **v3, Seed 2** gewählt (Gesicht sichtbar); das ist jetzt `fremder-einzel.png`, dazu ein neues Referenzblatt.

### Schritt B – Neue Figuren (Einzelbild 832×1216 + Referenzblatt 2048×832 mit `blatt-allgemein.prompt.txt`)
- [x] **Grisk** (`grisk-einzel.prompt.txt`) → 13.10.2026 erledigt.
- [x] **Hafenmeister Brann** (`brann-einzel.prompt.txt`) → 13.10.2026 erledigt.
- [x] **Meister Orwin** (`orwin-einzel.prompt.txt`) → 13.10.2026 erledigt.
- [x] **Fink** (`fink-einzel.prompt.txt`) → 13.10.2026 erledigt.
- [x] **Söldner der Goldenen Waage** (`soeldner-waage-einzel.prompt.txt`) → 13.10.2026 erledigt.
- [x] **Stadtwache** (`stadtwache-einzel.prompt.txt`) → 13.10.2026 erledigt.
- [x] **Herold** (`herold-einzel.prompt.txt`) → 13.10.2026 erledigt.
- [x] **Gnomen-Obsthändler** (`gnom-obsthaendler-einzel.prompt.txt`) → 13.10.2026 erledigt.
- [x] **Brakka** und **Fitzel** (`brakka-einzel.prompt.txt`, `fitzel-einzel.prompt.txt`) → 13.10.2026 erledigt.
- [x] **Die sechs Bezugspersonen:** Maren, Bonifaz, Mutter Kessel, Meister Holm, Meisterin Ysolde, Kapitänin Rhea (`<name>-einzel.prompt.txt`) → 13.10.2026 erledigt.

### Schritt C – Requisiten (`docs/art/requisiten/`) und Ortsbilder (`docs/art/orte/`)
- [x] **Requisiten:** `glaskugel-blitz`, `erzmarke`, `kompass` (je 1024×1024), `dampfkarren` (1216×832) → 13.10.2026 erledigt (Dampfkarren hat vier Räder, siehe `docs/art/requisiten/README.md`).
- [x] **Ortsbilder** (1536×1024): `hafen`, `marktplatz`, `klippen-von-ahrn` → 13.10.2026 erledigt.

### Schritt D – Szenenbilder (`docs/art/szenen/perle-1/`, 1536×1024, Referenzen stehen in der ersten Zeile jeder Prompt-Datei)
- [x] 1 `szene-lysmara-abend` · 2 `szene-sonnenuntergang-hafen` → 13.10.2026 erledigt (Seeds und Schwächen: `docs/art/szenen/perle-1/README.md`).
- [x] 3 `szene-bezugsperson-packt-<hintergrund>` (sechs Varianten) → 13.10.2026 erledigt (Seeds und Schwächen: `docs/art/szenen/perle-1/README.md`).
- [x] 4 `szene-fremder-im-regen` · 5 `szene-eintreiber-fesk` · 6 `szene-nordkai-kisten` · 7 `szene-morgen` → 13.10.2026 erledigt (Seeds und Schwächen: `docs/art/szenen/perle-1/README.md`).
- [x] 8 `szene-zwirbelgasse` (zuerst, sie ist die Ortsreferenz für 9) · 9 `figur-tickwort` → 13.10.2026 erledigt (Seeds und Schwächen: `docs/art/szenen/perle-1/README.md`).
- [x] 10 `szene-hafen-kran` · 11 `szene-weite-feder` · 12 `szene-klippen-leuchtturm` → 13.10.2026 erledigt (Seeds und Schwächen: `docs/art/szenen/perle-1/README.md`).
- [x] 13 `szene-markt` · 14 `szene-stadtwache` · 15 `figur-grumak` → 13.10.2026 erledigt (Seeds und Schwächen: `docs/art/szenen/perle-1/README.md`).
- [x] 16 `szene-freund-faellt-liora` / `-cassian` · 17 `figur-freund-liora` / `-cassian` → 13.10.2026 erledigt (Seeds und Schwächen: `docs/art/szenen/perle-1/README.md`).
- [x] 18 `entdeckung-ausrufer-ratshalle` · 19 `szene-goblin-werkstatt` → 13.10.2026 erledigt (Seeds und Schwächen: `docs/art/szenen/perle-1/README.md`).

### Schritt E – Tagebuch und Karten (`docs/art/szenen/perle-1/`)
- [x] 20 `tagebuch-perle-1` (Referenz `docs/art/karten/lysmara-lagevorlage.png`) · 21 `karte-lysmara-erste-skizze`, `tagebuch-erzmarke`, `tagebuch-kompass`. (`karte-meridel-perle-1` **entfällt** seit 13.10.2026, die Karte entsteht jetzt nach Abschnitt „Karten“ unten.) Wenn die Anordnung mit FLUX nicht stimmt, SDXL mit Linienvorlage (ControlNet in Krita) versuchen und das Ergebnis im README festhalten. → 13.10.2026 erledigt (Seeds und Schwächen: `docs/art/szenen/perle-1/README.md`).

### Schritt F – Zum Schluss
- [x] **Übersicht für Pasco:** alle gewählten Bilder von Perle 1 in einem oder zwei Übersichtsbildern (`docs/art/szenen/perle-1/uebersicht-*.png`) und in der README die Liste mit Schwächen. Dann Pasco Bescheid geben, dass Claude im Chat die Bilder prüfen kann. → 13.10.2026 erledigt (Seeds und Schwächen: `docs/art/szenen/perle-1/README.md`).

### Nachbesserung Perle 1 (Prüfung Claude, 14.10.2026)
Gründe und Änderungen: `docs/art/szenen/perle-1/README.md`, Abschnitt „Prüfung durch Claude“. Prompts sind schon angepasst.
- [x] Neu: `figur-tickwort` (drei Beine!) · `szene-goblin-werkstatt` (Tickwort und Maschine getrennt) · `entdeckung-ausrufer-ratshalle` (kein Kreuz, Waage-Zeichen) → **14.10.2026:** Alle drei neu, siehe Abschnitt „Nachbesserung“ in `szenen/perle-1/README.md`.
- [x] Optional: `szene-nordkai-kisten` · `requisiten/dampfkarren` → **14.10.2026:** Nordkai neu (Seed 4); Dampfkarren auch in Runde 3 mit vier Rädern, bleibt.

## Perle 2 – Szenenbilder (Auftrag vom 13.10.2026, nachgeholt)

Direkt **nach Perle 1** beginnen. Beschreibung jedes Bildes: `docs/art/szenen/perle-2/README.md`. Fertige Prompts liegen daneben. Ablauf und Prüfliste wie bei Perle 1.
Neu in der Prüfliste: Liora/Cassian ist **verkleidet** (zu große Arbeiterjacke, Mütze, Samtjacke blitzt hervor, Schnallenschuhe). Beim Erwachen geht die Magie **vom Betrachter aus, ohne Hände**.

### Schritt V – Ortsbild und erste Szenen
- [x] `orte/raederviertel` (1536×1024), zuerst, es ist die Referenz für fast alle Bilder → **14.10.2026:** `orte/raederviertel.png` (Seed 2). Seeds und Schwächen in den READMEs von `figuren/`, `orte/`, `requisiten/`.
- [x] 1 `entdeckung-raederviertel` · 2 `szene-erzlaende` · 3 `szene-tuchhalle` · 4 `szene-grosse-schmiede` · 5 `szene-faerberturm-feuer` → **14.10.2026:** erledigt, Seeds und Schwächen in `docs/art/szenen/perle-2/README.md`, Übersicht `uebersicht-1.png`.

### Schritt W – Erwachen und Abend
- [x] 6 `szene-erwachen-<wasser|feuer|wind|erde>-<liora|cassian>` (acht Bilder) → **14.10.2026:** erledigt, Seeds und Schwächen in `docs/art/szenen/perle-2/README.md`, Übersicht `uebersicht-1.png`.
- [x] 7 `szene-schmiedekeller` · 8 `szene-bruecke-abend-<liora|cassian>` · 9 `tagebuch-perle-2` → **14.10.2026:** erledigt, Seeds und Schwächen in `docs/art/szenen/perle-2/README.md`, Übersicht `uebersicht-1.png`.
- [x] **Übersicht für Pasco** (`docs/art/szenen/perle-2/uebersicht-*.png`) und Liste der Schwächen im README. → **14.10.2026:** erledigt, Seeds und Schwächen in `docs/art/szenen/perle-2/README.md`, Übersicht `uebersicht-1.png`.

## Perle 3 – Figuren und Szenenbilder (Auftrag vom 13.10.2026)

Erst **nach** den Bildern von Perle 1 (Schritte A–F) beginnen, denn viele Figuren und Ortsbilder von dort werden hier als Referenz gebraucht.
Beschreibung jedes Bildes: `docs/art/szenen/perle-3/README.md`. Fertige Prompts liegen daneben. Ablauf und Prüfliste wie bei Perle 1.

### Schritt G – Neue Figuren (Einzelbild 832×1216 + Referenzblatt 2048×832 mit `blatt-allgemein.prompt.txt`)
- [x] **Meister Kettrich** und **Mirk** (`kettrich-einzel.prompt.txt`, `mirk-einzel.prompt.txt`) – stammen aus Perle 2, hatten noch kein Bild → **14.10.2026:** Kettrich (Runde 3, Bildbearbeitung) und Mirk. Seeds und Schwächen in den READMEs von `figuren/`, `orte/`, `requisiten/`.
- [x] **Seraphine Arvelle** und **der Vater** (`seraphine-arvelle-einzel.prompt.txt`, `vater-arvelle-einzel.prompt.txt`) – Prüfen: Seraphine wirkt elegant und freundlich-kühl, keine Märchenhexe → **14.10.2026:** beide. Seeds und Schwächen in den READMEs von `figuren/`, `orte/`, `requisiten/`.
- [x] **Meisterin Ambra** (`ambra-einzel.prompt.txt`) – Prüfen: wirklich **keine Augenbrauen** → **14.10.2026:** keine Augenbrauen erst in Runde 3 (Bildbearbeitung). Seeds und Schwächen in den READMEs von `figuren/`, `orte/`, `requisiten/`.
- [x] **Hulda**, **der Gnomenjunge**, **Schreiber der Waage** (`hulda-`, `gnomenjunge-`, `schreiber-waage-einzel.prompt.txt`) – Prüfen: Hulda ist ein Mädchen ohne Bart → **14.10.2026:** alle drei, Hulda ohne Bart. Seeds und Schwächen in den READMEs von `figuren/`, `orte/`, `requisiten/`.

### Schritt H – Requisiten und Ortsbilder
- [x] **Gildenzeichen** (`requisiten/gildenzeichen.prompt.txt`, 1536×1024): fünf Gegenstände nebeneinander → **14.10.2026:** `requisiten/gildenzeichen.png`. Seeds und Schwächen in den READMEs von `figuren/`, `orte/`, `requisiten/`.
- [x] **Ortsbilder** (1536×1024): `orte/tuchhalle`, `orte/gewoelbe`, `orte/phiole-hof` → **14.10.2026:** alle drei. Seeds und Schwächen in den READMEs von `figuren/`, `orte/`, `requisiten/`.

### Schritt I – Szenenbilder (`docs/art/szenen/perle-3/`, 1536×1024)
- [x] 1 `szene-morgen-mentor-<element>` (vier Varianten: erde, wasser, feuer, wind) → **14.10.2026:** erledigt, siehe `docs/art/szenen/perle-3/README.md`.
- [x] 2 `szene-tickwort-werkstatt` · 3 `entdeckung-gildentag` → **14.10.2026:** erledigt, siehe `docs/art/szenen/perle-3/README.md`.
- [x] 4 `szene-tuchhalle-pruefung` · 5 `szene-gewoelbe-pruefung` · 6 `szene-raum-der-vier` (genau vier verschlungene Ringe, Vorlage `requisiten/ringzeichen.png`) → **14.10.2026:** erledigt, siehe `docs/art/szenen/perle-3/README.md`.
- [x] 7 `szene-phiole-pruefung` · 8 `szene-zelt-der-waage` (Goldknopf gut sichtbar) · 9 `szene-zelt-register` → **14.10.2026:** erledigt, siehe `docs/art/szenen/perle-3/README.md`.
- [x] 10 `entdeckung-magiergesetz-liora` / `-cassian` (das Kind steht **hinter** den Eltern, Blick gesenkt) → **14.10.2026:** erledigt, siehe `docs/art/szenen/perle-3/README.md`.
- [x] 11 `szene-brunnen-abend-liora` / `-cassian` · 12 `szene-gildenlaternen` → **14.10.2026:** erledigt, siehe `docs/art/szenen/perle-3/README.md`.
- [x] 13 `szene-beitritt-webstuhl`, `-feder`, `-phiole`, `-hand` → **14.10.2026:** erledigt, siehe `docs/art/szenen/perle-3/README.md`.
- [x] 14 `szene-brunnen-nacht-liora` / `-cassian` · 15 `szene-heimweg-nacht` · 16 `tagebuch-perle-3` → **14.10.2026:** erledigt, siehe `docs/art/szenen/perle-3/README.md`.
- [x] **Übersicht für Pasco** (`docs/art/szenen/perle-3/uebersicht-*.png`) und Liste der Schwächen im README. → **14.10.2026:** erledigt, siehe `docs/art/szenen/perle-3/README.md`.

## Perle 4 – Figuren und Szenenbilder (Auftrag vom 13.10.2026)

Erst **nach** Perle 1 und 3 beginnen. Beschreibung jedes Bildes: `docs/art/szenen/perle-4/README.md`. Fertige Prompts liegen daneben. Ablauf und Prüfliste wie bei Perle 1.
Neu in der Prüfliste: **Das Graue** ist farblos und still, ohne Nebel, ohne Gesichter, ohne Monster. **Gnolle** sind mager und müde, keine gefletschten Zähne.

### Schritt J – Neue Figuren (Einzelbild 832×1216 + Referenzblatt 2048×832 mit `blatt-allgemein.prompt.txt`)
- [x] **Merla**, **Hauptmann Strell**, **Jorrit** (`merla-`, `strell-`, `jorrit-einzel.prompt.txt`) → **14.10.2026:** alle drei. Seeds und Schwächen in den READMEs von `figuren/`, `orte/`, `requisiten/`.
- [x] **Ashka**, **Wuk**, **Gnoll allgemein** (`ashka-`, `wuk-`, `gnoll-einzel.prompt.txt`) – Prüfen: hyänenartig, gefleckt, nicht bedrohlich; Wuk ist erkennbar ein Gnoll, kein Hundewelpe → **14.10.2026:** alle drei; Wuk in Runde 2, wirkt weiter tierhaft (siehe README). Seeds und Schwächen in den READMEs von `figuren/`, `orte/`, `requisiten/`.

### Schritt K – Ortsbilder (1536×1024)
- [x] `orte/wollmark`, `orte/ginsterhof`, `orte/das-graue`, `orte/gnollenschlucht` → **14.10.2026:** alle vier. Seeds und Schwächen in den READMEs von `figuren/`, `orte/`, `requisiten/`.

### Schritt L – Szenenbilder (`docs/art/szenen/perle-4/`, 1536×1024)
- [x] 1 `szene-landtor-morgen` · 2 `figur-freund-verkleidet-liora` / `-cassian` · 3 `entdeckung-weiden` → **14.10.2026:** erledigt, siehe `docs/art/szenen/perle-4/README.md`.
- [x] 4 `szene-lamm-auf-der-strasse-liora` / `-cassian` · 5 `entdeckung-wollmark` · 6 `figur-strell` → **14.10.2026:** erledigt, siehe `docs/art/szenen/perle-4/README.md`.
- [x] 7 `szene-gasthaus-krummer-stab-liora` / `-cassian` · 8 `szene-freund-abgeholt-liora` / `-cassian` (Strell verbeugt sich) → **14.10.2026:** erledigt, siehe `docs/art/szenen/perle-4/README.md`.
- [x] 9 `szene-ginsterhof` · 10 `szene-das-graue` · 11 `szene-fremder-am-grauen` → **14.10.2026:** erledigt, siehe `docs/art/szenen/perle-4/README.md`.
- [x] 12 `szene-gnollenlager` · 13 `figur-ashka` · 14 `szene-nacht-das-schweigen` → **14.10.2026:** erledigt, siehe `docs/art/szenen/perle-4/README.md`.
- [x] 15 `szene-ruf-erde`, `-wasser`, `-feuer`, `-wind` · 16 `szene-morgen-danach` → **14.10.2026:** erledigt, siehe `docs/art/szenen/perle-4/README.md`.
- [x] 17 `tagebuch-perle-4` · ~~18 `karte-meridel-perle-4`~~ **entfällt** (Karte jetzt nach Abschnitt „Karten“) → **14.10.2026:** erledigt, siehe `docs/art/szenen/perle-4/README.md`.
- [x] **Übersicht für Pasco** (`docs/art/szenen/perle-4/uebersicht-*.png`) und Liste der Schwächen im README. → **14.10.2026:** erledigt, siehe `docs/art/szenen/perle-4/README.md`.

## Perle 5 – Figuren und Szenenbilder (Auftrag vom 13.10.2026)

Erst **nach** Perle 1, 3 und 4 beginnen. Beschreibung jedes Bildes: `docs/art/szenen/perle-5/README.md`. Fertige Prompts liegen daneben. Ablauf und Prüfliste wie bei Perle 1.
Neu in der Prüfliste: **Unter der Erde trotzdem warm und lesbar**, keine schwarzen Flächen. **Zwergenzeichen** nur als Ornamente, keine Buchstaben. Im Herz des Berges: **genau vier** verschlungene Ringe im Boden und **vier** Lichter im Kristall.

### Schritt M – Neue Figuren und Requisiten
- [x] **Gildenaufseher Dorn**, **Talin**, **Koboldkind** (`dorn-`, `talin-`, `koboldkind-einzel.prompt.txt`; Einzelbild 832×1216 + Referenzblatt) → **14.10.2026:** alle drei. Seeds und Schwächen in den READMEs von `figuren/`, `orte/`, `requisiten/`.
- [x] **Requisiten** (1024×1024): `stimmerz`, `herzsplitter`, `singlampe` → **14.10.2026:** alle drei. Seeds und Schwächen in den READMEs von `figuren/`, `orte/`, `requisiten/`.

### Schritt N – Ortsbilder (1536×1024)
- [x] `orte/minentor`, `orte/glimmhalde`, `orte/tiefe-stiege`, `orte/herz-des-berges` → **14.10.2026:** alle vier (Minentor Runde 3, Glimmhalde und Herz Runde 2). Seeds und Schwächen in den READMEs von `figuren/`, `orte/`, `requisiten/`.

### Schritt O – Szenenbilder (`docs/art/szenen/perle-5/`, 1536×1024)
- [x] 1 `szene-brief-in-wollmark` · 2 `entdeckung-orin-treidelpfad` · 3 `entdeckung-minentor` · 4 `entdeckung-glimmhalde` → **14.10.2026:** erledigt, siehe `docs/art/szenen/perle-5/README.md`.
- [x] 5 `szene-neumond-glimmhalde` · 6 `szene-tiefe-stiege` · 7 `szene-talin` · 8 `szene-der-schlund` → **14.10.2026:** erledigt, siehe `docs/art/szenen/perle-5/README.md`.
- [x] 9 `szene-vermisste-kobolde` · 10 `szene-wiedersehen-<hintergrund>` (sechs Varianten) → **14.10.2026:** erledigt, siehe `docs/art/szenen/perle-5/README.md`.
- [x] 11 `szene-herz-des-berges` · 12 `szene-flucht-tiefe-stiege` · 13 `szene-glimmhalde-fest` · 14 `tagebuch-perle-5` → **14.10.2026:** erledigt, siehe `docs/art/szenen/perle-5/README.md`.
- [x] **Übersicht für Pasco** (`docs/art/szenen/perle-5/uebersicht-*.png`) und Liste der Schwächen im README. → **14.10.2026:** erledigt, siehe `docs/art/szenen/perle-5/README.md`.

## Perle 6 – Figuren und Szenenbilder (Auftrag vom 13.10.2026)

Erst **nach** Perle 1, 3, 4 und 5 beginnen. Beschreibung jedes Bildes: `docs/art/szenen/perle-6/README.md`. Fertige Prompts liegen daneben. Ablauf und Prüfliste wie bei Perle 1.
Neu in der Prüfliste: **genau vier Farben** (braun, blau, rot, weiß) bei Kugeln, Funken, Kuppel und Ruf. **Das Schweigen ohne Nebel**, nur fehlende Farbe. **Spiegel mit Riss** ab Bild 11. Bei der Vorführung **fehlt ein Goldknopf** am Ärmel von Liora/Cassian.

### Schritt P – Neue Figuren und Requisiten
- [x] **Magister Pell**, **ältester Ratsherr** (`pell-`, `ratsherr-einzel.prompt.txt`; Einzelbild 832×1216 + Referenzblatt) → **14.10.2026:** beide. Seeds und Schwächen in den READMEs von `figuren/`, `orte/`, `requisiten/`.
- [x] **Requisiten** (1024×1024): `plakette-waage`, `kugel-im-korb` → **14.10.2026:** beide (Kugel-im-Korb Runde 2). Seeds und Schwächen in den READMEs von `figuren/`, `orte/`, `requisiten/`.

### Schritt Q – Ortsbilder (1536×1024)
- [x] `orte/vardholm`, `orte/vardholm-hof`, `orte/kugelhalle` → **14.10.2026:** alle drei. Seeds und Schwächen in den READMEs von `figuren/`, `orte/`, `requisiten/`.

### Schritt R – Szenenbilder (`docs/art/szenen/perle-6/`, 1536×1024)
- [x] 1 `entdeckung-spaltstrasse-vardholm` · 2 `szene-yrsas-karren` · 3 `szene-mauer-vardholm` · 4 `entdeckung-vardholm-hof` → **14.10.2026:** erledigt, siehe `docs/art/szenen/perle-6/README.md`.
- [x] 5 `szene-kugelhalle` · 6 `szene-modell-des-walls` · 7 `entdeckung-vorfuehrung-<liora|cassian>` · 8 `szene-hinter-dem-stall-<liora|cassian>` → **14.10.2026:** erledigt, siehe `docs/art/szenen/perle-6/README.md`.
- [x] 9 `szene-festmahl-vardholm` · 10 `szene-funken-frei` · 11 `szene-schweigen-im-spalt` → **14.10.2026:** erledigt, siehe `docs/art/szenen/perle-6/README.md`.
- [x] 12 `szene-ruf-gross-<erde|wasser|feuer|wind>` · 13 `entdeckung-vardholm-morgen` · 14 `tagebuch-perle-6` → **14.10.2026:** erledigt, siehe `docs/art/szenen/perle-6/README.md`.
- [x] **Übersicht für Pasco** (`docs/art/szenen/perle-6/uebersicht-*.png`) und Liste der Schwächen im README. → **14.10.2026:** erledigt, siehe `docs/art/szenen/perle-6/README.md`.

## Perle 7 – Figuren und Szenenbilder (Auftrag vom 13.10.2026)

Erst **nach** Perle 1 und 3–6 beginnen. Beschreibung jedes Bildes: `docs/art/szenen/perle-7/README.md`. Fertige Prompts liegen daneben. Ablauf und Prüfliste wie bei Perle 1.
Neu in der Prüfliste: **Geschenke** sehen aus wie in `requisiten/abschiedsgeschenke.png`. **Jenseits der Berge braun-golden**, graue Flecken ohne Nebel. In der Bucht ist der Kapitän **nur Silhouette**. Durgash hat **einen abgebrochenen Hauer**.

### Schritt S – Neue Figuren, Ortsbild, Requisiten
- [x] **Durgash**, **Haldor**, **Fährfrau** (`durgash-`, `haldor-`, `faehrfrau-einzel.prompt.txt`; Einzelbild 832×1216 + Referenzblatt) → **14.10.2026:** alle drei. Seeds und Schwächen in den READMEs von `figuren/`, `orte/`, `requisiten/`.
- [x] `orte/dornfurt` (1536×1024) · `requisiten/abschiedsgeschenke` (1536×1024) → **14.10.2026:** beide. Seeds und Schwächen in den READMEs von `figuren/`, `orte/`, `requisiten/`.

### Schritt T – Szenenbilder Teil 1 (`docs/art/szenen/perle-7/`, 1536×1024)
- [ ] 1 `szene-abschied-vardholm-kommt-<liora|cassian>` · `szene-abschied-vardholm-bleibt-<liora|cassian>` · 2 `szene-heimkehr-lysmara`
- [ ] 3 `szene-abschied-borrik`, `-nerelle`, `-yrsa`, `-vael` · 4 `szene-abschied-tickwort` · 5 `szene-abschied-grumak`
- [ ] 6 `szene-vier-wege` · 7 `szene-tor-offen` · 8 `entdeckung-aufstieg-suedarm` · 9 `szene-wolfspfad`
- [ ] 10 `szene-ziegenstiege-fackeln` · 11 `szene-am-grat` · 12 `szene-herz-wiedersehen` · 13 `szene-zwergentor-ost`

### Schritt U – Szenenbilder Teil 2
- [ ] 14 `szene-schwarzwasserbucht` · 15 `szene-sturm-am-kap` · 16 `entdeckung-jenseits-der-berge` · 17 `szene-leeres-dorf`
- [ ] 18 `entdeckung-dornfurt` · 19 `szene-zum-halben-hauer` · 20 `szene-silbermark-stube` · 21 `szene-faehrfrau`
- [ ] 22 `szene-fremder-am-steg` · 23 `tagebuch-perle-7`
- [ ] **Übersicht für Pasco** (`docs/art/szenen/perle-7/uebersicht-*.png`) und Liste der Schwächen im README.

## Karten – Grundkarten und Ortsskizzen (Auftrag vom 13.10.2026)

Neues Verfahren, von Pasco entschieden: **Grundkarte und Orte getrennt**. Alles Nötige steht in `docs/art/karten/README.md`, die Lage der Orte in `docs/art/karten/karten.json`.
Alle Kartenbilder auf **reinweißem Hintergrund**, ohne Papierstruktur und ohne Schrift.

### Schritt K1 – Grundkarten
- [x] `docs/art/karten/meridel-grund` (1536×1248, Referenz `meridel-grundvorlage.png`) – nur Küste, Meer, Fluss, Gebirge → **14.10.2026:** `karten/meridel-grund.png` (Seed 1).
- [x] `docs/art/karten/lysmara-grund` (1536×1152, Referenz `lysmara-grundvorlage.png`) – Stadtgrundriss ohne Wahrzeichen → **14.10.2026:** `karten/lysmara-grund.png` (Seed 8, zweite Runde).

### Schritt K2 – Einmessen
- [x] Prüfbilder `pruefung-meridel.png` und `pruefung-lysmara.png` (Grundkarte + Lagevorlage mit 50 % Deckkraft), danach `x`/`y`, Wege und Bereiche in `karten.json` an die gemalte Karte anpassen und `"eingemessen"` eintragen. Pasco Bescheid geben, Claude prüft im Chat. → **14.10.2026:** Prüfbilder angelegt, deckungsgleich, `eingemessen` in `karten.json` eingetragen. **Claude im Chat kann prüfen.**

### Schritt K3 – Ortsskizzen (`docs/art/karten/skizzen/`, je 4 Seeds)
- [x] Meridel: `lysmara`, `klippen-von-ahrn`, `weiden`, `wollmark`, `ginsterhof`, `das-graue`, `gnollenlager` → **14.10.2026:** erledigt (`karten/skizzen/*.png`, Zusammenbau-Bilder `pruefung-*-komplett.png`). **Claude im Chat kann prüfen.**
- [x] Meridel: `kobold-minen`, `tiefe-stiege`, `glimmhalde`, `herz-des-berges`, `vardholm`, `schwarzwasserbucht`, `dornfurt` → **14.10.2026:** erledigt (`karten/skizzen/*.png`, Zusammenbau-Bilder `pruefung-*-komplett.png`). **Claude im Chat kann prüfen.**
- [x] Lysmara: `stadt-hafen`, `stadt-phiole`, `stadt-markt`, `stadt-marktplatz`, `stadt-gewoelbe`, `stadt-wachhaus`, `stadt-oberstadt` → **14.10.2026:** erledigt (`karten/skizzen/*.png`, Zusammenbau-Bilder `pruefung-*-komplett.png`). **Claude im Chat kann prüfen.**
- [x] Lysmara: `stadt-weite-feder`, `stadt-raederviertel`, `stadt-grosse-schmiede`, `stadt-tuchhalle`, `stadt-erzlaende`, `stadt-steinmetzhof`, `stadt-orinbruecke` → **14.10.2026:** erledigt (`karten/skizzen/*.png`, Zusammenbau-Bilder `pruefung-*-komplett.png`). **Claude im Chat kann prüfen.**
- [x] Zusammenbau-Bilder `pruefung-meridel-komplett.png` und `pruefung-lysmara-komplett.png`, dann Pasco Bescheid geben. → **14.10.2026:** erledigt (`karten/skizzen/*.png`, Zusammenbau-Bilder `pruefung-*-komplett.png`). **Claude im Chat kann prüfen.**

## Tagebuch-Skizzen – Taschen und Menschen (Auftrag vom 14.10.2026)

Erst **nach Perle 7**, weil die Skizzen die Einzelbilder und Requisiten aller Perlen als Referenz nutzen. Beschreibung und Prüfliste: `docs/art/tagebuch/README.md`. Prompts liegen fertig in `docs/art/tagebuch/taschen/` und `docs/art/tagebuch/menschen/`, Größe und Referenz in der ersten Zeile (`tools/erzeuge-szene.ps1` geht). Je **4 Seeds**, Ergebnis als `<name>.png` neben den Prompt.
Neu in der Prüfliste: **kein Buch, kein Tisch, kein Rand**, nur die Skizze auf cremefarbenem Papier mit viel Platz drumherum. Menschen als Brustbild, gut wiedererkennbar.

### Schritt T1 – Taschen (20 Skizzen)
- [ ] `silber`, `kompass`, `erzmarke`, `quelle-erde`, `quelle-wasser`, `quelle-feuer`, `brief`
- [ ] `gildenzeichen-webstuhl_amboss`, `gildenzeichen-weite_feder`, `gildenzeichen-phiole`, `gildenzeichen-leise_hand`, `plakette`, `gnollstein`
- [ ] `herzsplitter`, `singlampe`, `goldknopf`, `seil`, `pfeife`, `ring`, `paeckchen`

### Schritt T2 – Menschen (34 Skizzen)
- [ ] Bezugspersonen: `maren`, `bonifaz`, `mutter-kessel`, `holm`, `ysolde`, `rhea`
- [ ] `tickwort`, `liora`, `cassian`, `fremder`, `grisk`, `fesk`, `fink`, `grumak`
- [ ] Mentoren: `borrik`, `nerelle`, `yrsa`, `vael`
- [ ] `kettrich`, `mirk`, `seraphine`, `pell`, `strell`, `jorrit`, `ashka`, `wuk`, `talin`, `durgash`, `faehrfrau`, `haldor`
- [ ] Nebenfiguren ohne Einzelbild (nur aus Text): `ole`, `pip`, `jaro`, `brina`
- [ ] **Übersicht für Pasco** (`docs/art/tagebuch/uebersicht-*.png`) und Liste der Schwächen im README.

## Auf Abruf (kein fester Auftrag)
Diese Prompts liegen bereit und werden nur erzeugt, wenn Pasco danach fragt.
- (auf Abruf) **Beispielfiguren der fünf Völker** (Kinder um die zwölf, je Junge und Mädchen): `docs/art/figuren/volk-<mensch|zwerg|gnom|ork|troll>-<m|w>-einzel.prompt.txt`, 832×1216, nur aus Text; danach `voelker-vergleich.prompt.txt` (1536×1024) mit drei Einzelbildern als Referenz. Prüfen: Zwergenkinder ohne Bart, Trolle schlaksig und nicht massig, Orks freundlich.

## Erledigt
- [x] **Grumak neu erzeugen** (Einzelbild + Referenzblatt). Er ist „groß wie ein Schrank“: deutlich größer und massiger als ein Mensch, breite Schultern, deutliche untere Hauer, graue Strähnen, goldene Ringe in beiden Ohren – Gesicht und Kleidung wie bisher (freundlich, müde, Händlertunika). Verbindlich: `docs/worldbuilding/figuren-aussehen.md`. Am besten mit dem bisherigen Einzelbild als Referenz und Änderungs-Prompt („gleiche Figur, Kleidung und Gesicht, aber viel größer und massiger …“). Ohne Nüsse in der Hand (Requisit gehört in die Szene). → 13.10.2026: `docs/art/figuren/grumak-einzel-neu.png`, `grumak-referenzblatt-neu.png` (lokal, warten auf Abnahme).
- [x] **Der Fremde neu erzeugen** (Einzelbild + Referenzblatt) nach `docs/worldbuilding/der-fremde.md`: groß und schlank, Reisemantel statt Mönchsgewand, Kinn und Mund im Schatten schwach sichtbar, silbrig **schimmernde** (nicht leuchtende) Augen, Bronzeschließe als Spirale aus vier Linien, Treibholzstab, Bergstaub an den Stiefeln. **Ohne Brief** im Referenzblatt (Brief = Szenenzustand). → 13.10.2026: `docs/art/figuren/fremder-einzel-neu.png`, `fremder-referenzblatt-neu.png` (lokal, warten auf Abnahme).
- [x] **Spiralsiegel** als eigenes kleines Bild: dunkelgrünes Wachs, Spirale aus **vier** ineinander gewundenen Linien (`docs/art/requisiten/spiralsiegel.png`). → 13.10.2026: im Repo, dazu `spiralsiegel-vorlage.png`.
