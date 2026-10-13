# Aktueller Stand und nächste Schritte

Diese Datei ist die Übergabe zwischen Arbeitssitzungen. Wer neu einsteigt (auch eine neue Claude-Sitzung): zuerst `CLAUDE.md`, dann diese Datei lesen.

Stand: 13.10.2026

## Fertig
- Konzept, Regeln, Magiesystem, World-Building (Runden 1–3), Hauptstory „Der Weg hinaus“ – siehe `docs/entscheidungen.md`.
- Ink-Grundgerüst (`story/variablen.ink`, `funktionen.ink`, `charakter.ink`) und automatischer Test (`npm test`).
- **Perle 1 „Die Hafenstadt“** – erster vollständiger Entwurf in `story/perle-1/`. Ein Durchlauf hat ca. 4.500 Wörter (≈ 30–45 Min. für einen 10-Jährigen, also kürzer als die geplanten 2 Std.).
- **Perle 2 „Am Fluss der Räder“** – erster vollständiger Entwurf in `story/perle-2/`. Ein Durchlauf hat ca. 3.000–3.500 Wörter. Inhalt: Räderviertel, Spuren (Kobolde/Tiefe Stiege, Tuchhalle/Gildenzugang zu den Minen, Yrsa), Feuer am Färberturm, Erwachen der Magie, Elementwahl, Mentor (Borrik/Nerelle/Yrsa/Vael), Hinweis auf je einen Weg hinaus, Abend mit Liora/Cassian, Ausblick auf den Gildentag.
- Art-Style festgelegt (`docs/art/art-style.md`), Bildliste für Perle 1 (`docs/art/bildliste.md`).
- **Perle 1 testgespielt** (Pasco + Sohn): „sehr gut“.
- **Grundkarte von Meridel** und Stadtplan von Lysmara festgelegt (`docs/worldbuilding/karte-meridel.md`, Lagevorlagen in `docs/art/karten/`, erzeugt mit `tools/karten-vorlage.py`).
- **Alle Szenenbilder von Perle 1 ausgearbeitet:** Beschreibungen in `docs/art/szenen/perle-1/README.md`, fertige Prompts für Szenen, neue Figuren, Requisiten und Ortsbilder. Aussehen der neuen Nebenfiguren und Bezugspersonen in `figuren-aussehen.md` (Vorschlag).
- `tools/erzeuge-bild.js` kann mehrere Referenzbilder (Komma-getrennt) – noch ungetestet.
- **Perle 3 „Die Gildenprobe“** – erster vollständiger Entwurf in `story/perle-3/` (13.10.2026, Cloud-Sitzung). Ein Durchlauf hat ca. 3.000–4.100 Wörter. Inhalt: drei Tage Übung (neuer kleiner Zauber je Element), Besuch bei Tickwort/Grumak/Mentor, Gildentag mit zwei von vier Prüfungen (Webstuhl und Amboss, Weite Feder, Glühende Phiole, Leise Hand), Magiergesetz, Hinweise auf die Familie Arvelle, Gildenbeitritt (oder Waage oder keine Gilde), Heimweg-Kontrolle. Zusammenfassung in `story/hauptstory-entwurf.md`.
- **Perle 5 „Unter dem Berg“** – erster vollständiger Entwurf in `story/perle-5/` (13.10.2026), ca. 3.000–3.600 Wörter pro Durchlauf.
- **Perle 7 „Der Weg hinaus“** (Finale) – erster vollständiger Entwurf in `story/perle-7/` (13.10.2026), ca. 2.000–2.900 Wörter pro Durchlauf. Abschiede, vier Wege hinaus, Dornfurt, Ithren. **Damit ist das erste Abenteuer einmal komplett durchspielbar.**
- **Perle 6 „Die Festung am Pass“** – erster vollständiger Entwurf in `story/perle-6/` (13.10.2026), ca. 2.800–3.300 Wörter pro Durchlauf. Inhalt: Vardholm, Kugelhalle, Modell des Walls, Wahrheit über die Familie Arvelle, Entscheidung (enthüllen / Freund redet / Funken befreien), Nacht des Schweigens, großer Ruf (Elementstufe 3), Morgen mit Weichen für das Finale. Zusammenfassung in `story/hauptstory-entwurf.md`.
- **Perle 4 „Die Weiden“** – erster vollständiger Entwurf in `story/perle-4/` (13.10.2026). Ein Durchlauf hat ca. 4.100–4.600 Wörter. Inhalt: Aufbruch, Wollmark, Liora/Cassian wird heimgeholt, Ginsterhof, das Graue, der Fremde, Gnolle (helfen/vermitteln/verraten), die Nacht des Schweigens, Elementstufe 2. Zusammenfassung in `story/hauptstory-entwurf.md`.
- Lokale Einrichtung beschrieben (`docs/setup.md`). Krita + Krita AI Diffusion sind installiert, der lokale Server (ComfyUI) wurde eingerichtet.
- **Bild-Pipeline läuft:** ComfyUI ist unter `http://127.0.0.1:8188` erreichbar (muss in Krita gestartet sein). `tools/erzeuge-bild.js` erzeugt Bilder aus Prompt-Dateien, optional mit Bildreferenz; ca. 3 Sekunden pro Bild. Installiert sind **FLUX.2 klein 4B** (erste Wahl für Figuren) und **SDXL mit ZavyChroma XL** – Vergleich in `docs/art/werkzeuge.md`.
- **Referenzblatt Tickwort** in `docs/art/figuren/` (mit Zangenhänden, auf Pascos Wunsch).
- **Zusammenarbeit:** Die Chat-Sitzung in der Cloud und die lokale Sitzung schreiben ins selbe Repo. Vor jedem Push erst `git pull`.

- **Browser-Player – Planung begonnen** (13.10.2026, eigener Chat): Story-Konventionen in `docs/story-konventionen.md` (erster Entwurf, Vorschläge zur Zustimmung offen). Reihenfolge: Konventionen → Charakterbogen und Level-Up → Karte und Logbuch → Bilder → Audio. Kein Vorab-Prototyp; der Sohn bekommt das Spiel, wenn es fertig ist.

## Arbeitsumgebung
- Projektordner auf Pascos PC: `E:\Projekte\pen-and-paper-kids` (Windows, NVIDIA RTX 40er-Serie).
- Der lokale Bild-Server (ComfyUI) von Krita AI Diffusion ist in `E:\Projekte\pen-and-paper-kids\Krita\ComfyUI` installiert. Der Ordner `Krita/` steht in `.gitignore` und darf **nie** ins Repo (viele GB Modelle).
- Lokale Arbeit mit Befehlen (git, npm, ComfyUI) läuft über eine **Claude-Code-Sitzung in der Desktop-App** im Projektordner.
- Bilder werden lokal erzeugt (Krita AI Diffusion / ComfyUI), nicht über Firmenkonten. Bevorzugtes Modell für eine spätere Veröffentlichung: FLUX.1 [schnell] (Apache-2.0) oder SDXL – siehe `docs/art/werkzeuge.md`.

## Nächste Schritte
0. **Lokal: alle Bilder für Perle 1** nach `docs/auftraege.md` (Schritte A–F), danach **Perle 2** (Schritte V–W), **Perle 3** (Schritte G–I) **Perle 4** (Schritte J–L) **Perle 5** (Schritte M–O) und **Perle 6** (Schritte P–R) und **Perle 7** (Schritte S–U); Beschreibungen in `docs/art/szenen/perle-<n>/README.md`. Danach prüft Claude im Chat die Übersichten.
1. **Abnahmen offen:** Der Fremde (dritter Versuch läuft mit), Nerelle (überarbeitet), Tickwort mit dem Sohn ansehen. Stand lokale Sitzung 13.10.2026: Borrik und Vael sind bestätigt. Nur lokal auf Pascos PC (nicht im Repo) liegen `grumak-*-neu.png`, `fremder-*-neu.png` und Nerelles zwei Bilder; die alten Bilder von Grumak und dem Fremden sind unverändert.
2. **Perle 2 testspielen** und Rückmeldung einarbeiten. Szenenbilder für Perle 2 sind ausgearbeitet (`docs/art/szenen/perle-2/README.md`). **Damit sind alle Bildbeschreibungen für Perle 1–7 fertig** (Gesamtauftrag oben in `docs/auftraege.md`).
3. **Perle 3 testspielen** (Pasco + Sohn). Offen zur Bestätigung: Familienname **Arvelle**, Waagmeisterin Seraphine, Meisterin Ambra, Fitzel.
3a. **Perle 4 testspielen.** Figuren bestätigt, Zweck der Kugeln festgelegt (Schutzwall, vor allem für die Oberstadt).
3b. **Perle 5 testspielen.** Herkunft des Schweigens, Neumond-Regel und Figuren sind bestätigt.
3c. **Perle 6 testspielen.** Entscheidungswege, Seraphines Einsicht, Elementstufe 3 und Strells Verstummen sind bestätigt. Bilder ausgearbeitet (`docs/art/szenen/perle-6/README.md`).
3d. **Perle 7 testspielen.** Bilder ausgearbeitet (`docs/art/szenen/perle-7/README.md`). Zur Bestätigung offen: Dornfurt, Durgash, Haldor, die Fährfrau, Fesks Kiesel, der Cliffhanger „mehrere Herzen“.
4. Perle 1 und 2 sind kürzer als geplant – nach dem Testspiel gezielt verlängern.
4a. **Tagebuch ausarbeiten** (Bereiche, Aufbau, Darstellung im Player; zusammen mit dem Technologie-Chat).
4b. **Wartet auf 4a – Tickwort erklärt die Bereiche des Tagebuchs** (Perle 1, `story/perle-1/tickwort.ink`, Stitch `buch`): in seinem Stil mit Unterpunkten, etwa „Erste Seite: wer du bist. Mittlere Seiten: was du erlebt und entschieden hast. Hintere Seiten: die Karte.“ Erst umsetzen, wenn das Tagebuch fertig ausgearbeitet ist, damit die Erklärung zu den echten Bereichen passt. Beschluss Pasco 13.10.2026, Details in `docs/entscheidungen.md`.
5. Weitere Referenzblätter: die fünf Völker (Mensch, Zwerg, Gnom, Ork, Troll) als Beispielfiguren, Kettrich, Mirk.

## Offene Fragen an Pasco
- ~~Erzählerstimme?~~ Entschieden 13.10.2026: Vertonung zurückgestellt, zunächst liest der Sohn selbst. Erzähler- und Figurenstimmen bleiben offen, bis Story und Player fertig sind.
- Native App oder für Tablets/Handys optimierte Webseite?
