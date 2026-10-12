# Aktueller Stand und nächste Schritte

Diese Datei ist die Übergabe zwischen Arbeitssitzungen. Wer neu einsteigt (auch eine neue Claude-Sitzung): zuerst `CLAUDE.md`, dann diese Datei lesen.

Stand: 12.10.2026 (abends)

## Fertig
- Konzept, Regeln, Magiesystem, World-Building (Runden 1–3), Hauptstory „Der Weg hinaus“ – siehe `docs/entscheidungen.md`.
- Ink-Grundgerüst (`story/variablen.ink`, `funktionen.ink`, `charakter.ink`) und automatischer Test (`npm test`).
- **Perle 1 „Die Hafenstadt“** – erster vollständiger Entwurf in `story/perle-1/`. Ein Durchlauf hat ca. 4.500 Wörter (≈ 30–45 Min. für einen 10-Jährigen, also kürzer als die geplanten 2 Std.).
- **Perle 2 „Am Fluss der Räder“** – erster vollständiger Entwurf in `story/perle-2/`. Ein Durchlauf hat ca. 3.000–3.500 Wörter. Inhalt: Räderviertel, Spuren (Kobolde/Tiefe Stiege, Tuchhalle/Gildenzugang zu den Minen, Yrsa), Feuer am Färberturm, Erwachen der Magie, Elementwahl, Mentor (Borrik/Nerelle/Yrsa/Vael), Hinweis auf je einen Weg hinaus, Abend mit Liora/Cassian, Ausblick auf den Gildentag.
- Art-Style festgelegt (`docs/art/art-style.md`), Bildliste für Perle 1 (`docs/art/bildliste.md`).
- Lokale Einrichtung beschrieben (`docs/setup.md`). Krita + Krita AI Diffusion sind installiert, der lokale Server (ComfyUI) wurde eingerichtet.

## Arbeitsumgebung
- Projektordner auf Pascos PC: `E:\Projekte\pen-and-paper-kids` (Windows, NVIDIA RTX 40er-Serie).
- Der lokale Bild-Server (ComfyUI) von Krita AI Diffusion ist in `E:\Projekte\pen-and-paper-kids\Krita\ComfyUI` installiert. Der Ordner `Krita/` steht in `.gitignore` und darf **nie** ins Repo (viele GB Modelle).
- Lokale Arbeit mit Befehlen (git, npm, ComfyUI) läuft über eine **Claude-Code-Sitzung in der Desktop-App** im Projektordner.
- Bilder werden lokal erzeugt (Krita AI Diffusion / ComfyUI), nicht über Firmenkonten. Bevorzugtes Modell für eine spätere Veröffentlichung: FLUX.1 [schnell] (Apache-2.0) oder SDXL – siehe `docs/art/werkzeuge.md`.

## Nächste Schritte
1. **ComfyUI ansprechen:** Prüfen, ob der lokale Server von Krita AI Diffusion erreichbar ist (ComfyUI läuft standardmäßig unter `http://127.0.0.1:8188`; der tatsächliche Port steht im Plugin unter *Configure*). Wenn ja: ein kleines Skript in `tools/`, das Bilder aus Prompts erzeugt und unter `docs/art/` ablegt.
2. **Figuren-Referenzblätter** im festgelegten Stil erzeugen – zuerst **Tickwort**, dann Liora, Cassian, die fünf Völker, Grumak, Fesk, der Fremde.
3. **Grundkarte von Meridel** festlegen (Lage von Lysmara, Orin, Weiden, Kharvan-Kamm, Nyrrspalt, Klippen von Ahrn).
4. **Perle 1 testspielen** (Pasco + Sohn in Inky) und Rückmeldung einarbeiten; danach ggf. verlängern.
5. **Perle 3 „Die Gildenprobe“** schreiben: Gildentag, Prüfungen mehrerer Gilden, Gildenbeitritt (~35 % der Story), erste Hinweise, dass Liora/Cassians Eltern die Goldene Waage führen, Magiergesetz im Stadtrat.
6. Perle 1 und 2 sind kürzer als geplant – nach dem Testspiel gezielt verlängern.

## Offene Fragen an Pasco
- Soll es bei der ElevenLabs-Vertonung zusätzlich eine **Erzählerstimme** geben (deckt die Vorlesefunktion ab)?
- Native App oder für Tablets/Handys optimierte Webseite?
