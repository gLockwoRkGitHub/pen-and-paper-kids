# Aktueller Stand und nächste Schritte

Diese Datei ist die Übergabe zwischen Arbeitssitzungen. Wer neu einsteigt (auch eine neue Claude-Sitzung): zuerst `CLAUDE.md`, dann diese Datei lesen.

Stand: 12.10.2026 (nachts, Sitzungsende)

**Morgen weiter im Chat:** Pasco startet vorher lokal die Bilder für Perle 1 (`docs/auftraege.md`). Danach Bilder prüfen, dann Perle 2 testspielen bzw. Perle 3.

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
- Lokale Einrichtung beschrieben (`docs/setup.md`). Krita + Krita AI Diffusion sind installiert, der lokale Server (ComfyUI) wurde eingerichtet.
- **Bild-Pipeline läuft:** ComfyUI ist unter `http://127.0.0.1:8188` erreichbar (muss in Krita gestartet sein). `tools/erzeuge-bild.js` erzeugt Bilder aus Prompt-Dateien, optional mit Bildreferenz; ca. 3 Sekunden pro Bild. Installiert sind **FLUX.2 klein 4B** (erste Wahl für Figuren) und **SDXL mit ZavyChroma XL** – Vergleich in `docs/art/werkzeuge.md`.
- **Referenzblatt Tickwort** in `docs/art/figuren/` (mit Zangenhänden, auf Pascos Wunsch).
- **Zusammenarbeit:** Die Chat-Sitzung in der Cloud und die lokale Sitzung schreiben ins selbe Repo. Vor jedem Push erst `git pull`.

## Arbeitsumgebung
- Projektordner auf Pascos PC: `E:\Projekte\pen-and-paper-kids` (Windows, NVIDIA RTX 40er-Serie).
- Der lokale Bild-Server (ComfyUI) von Krita AI Diffusion ist in `E:\Projekte\pen-and-paper-kids\Krita\ComfyUI` installiert. Der Ordner `Krita/` steht in `.gitignore` und darf **nie** ins Repo (viele GB Modelle).
- Lokale Arbeit mit Befehlen (git, npm, ComfyUI) läuft über eine **Claude-Code-Sitzung in der Desktop-App** im Projektordner.
- Bilder werden lokal erzeugt (Krita AI Diffusion / ComfyUI), nicht über Firmenkonten. Bevorzugtes Modell für eine spätere Veröffentlichung: FLUX.1 [schnell] (Apache-2.0) oder SDXL – siehe `docs/art/werkzeuge.md`.

## Nächste Schritte
0. **Lokal: alle Bilder für Perle 1** nach `docs/auftraege.md` (Schritte A–F). Danach prüft Claude im Chat die Übersicht.
1. **Abnahmen offen:** Der Fremde (dritter Versuch läuft mit), Nerelle (überarbeitet), Tickwort mit dem Sohn ansehen.
2. **Perle 2 testspielen** und Rückmeldung einarbeiten; danach Szenenbilder für Perle 2 genauso ausarbeiten wie für Perle 1.
3. **Perle 3 „Die Gildenprobe“** schreiben: Gildentag, Prüfungen mehrerer Gilden, Gildenbeitritt (~35 % der Story), erste Hinweise, dass Liora/Cassians Eltern die Goldene Waage führen, Magiergesetz im Stadtrat.
4. Perle 1 und 2 sind kürzer als geplant – nach dem Testspiel gezielt verlängern.
5. Weitere Referenzblätter: die fünf Völker (Mensch, Zwerg, Gnom, Ork, Troll) als Beispielfiguren, Kettrich, Mirk.

## Offene Fragen an Pasco
- Soll es bei der ElevenLabs-Vertonung zusätzlich eine **Erzählerstimme** geben (deckt die Vorlesefunktion ab)?
- Native App oder für Tablets/Handys optimierte Webseite?
