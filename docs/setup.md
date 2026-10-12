# Lokale Einrichtung

Stand 12.10.2026. Ziel: Das Projekt liegt auf Pascos Rechner, Claude kann darauf zugreifen – für Story-Tests, Bilder (Krita/ComfyUI) und später Audio (ElevenLabs).

## Was wo passiert
| Aufgabe | Wo | Braucht Pascos Rechner? |
|---|---|---|
| Story schreiben, Doku, Tests (`npm test`) | GitHub-Repo, Claude arbeitet in der Cloud | Nein |
| Story spielen (Inky) | Pascos Rechner | Ja |
| Bilder erzeugen (Krita AI Diffusion / ComfyUI, GPU) | Pascos Rechner | Ja |
| Audio erzeugen (ElevenLabs) | Skript mit API-Schlüssel, läuft lokal | Ja (Schlüssel bleibt lokal) |

## Schritte
1. **Git** installieren: https://git-scm.com
2. **Node.js (LTS)** installieren: https://nodejs.org
3. **Projektordner anlegen und Repo holen**, z. B.:
   ```
   cd C:\Projekte
   git clone https://github.com/gLockwoRkGitHub/pen-and-paper-kids.git
   cd pen-and-paper-kids
   npm install
   npm test
   ```
4. **Inky** installieren (zum Spielen): https://github.com/inkle/inky/releases – dann `story/main.ink` öffnen.
5. **Krita** installieren: https://krita.org – dann das Plugin **Krita AI Diffusion** (https://github.com/Acly/krita-ai-diffusion) hinzufügen und im Plugin einen **lokalen Server** einrichten lassen (installiert ComfyUI und die Modelle). Als Modell **FLUX.1 [schnell]** oder ein SDXL-Modell wählen (Lizenzen: `docs/art/werkzeuge.md`).
6. **Claude-Desktop-App** öffnen, diesen Chat aufrufen und **„Mit diesem Computer verknüpfen“** wählen. Den Projektordner (`C:\Projekte\pen-and-paper-kids`) als Ordner freigeben.
7. Optional **Computer-Steuerung** erlauben, damit Claude Krita/Inky bedienen und Screenshots ansehen kann.

## Sicherheit
- API-Schlüssel (z. B. ElevenLabs) **nie ins Repo**. Sie kommen in eine lokale Datei `.env`, die in `.gitignore` steht.
- Erzeugte Bilder und Audio bleiben lokal, bis sie bewusst ins Repo übernommen werden.
