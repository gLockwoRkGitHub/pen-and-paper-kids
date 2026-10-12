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
5. **Krita mit KI-Plugin** (Bilder lokal erzeugen):
   - **Was ist der „lokale Server“?** Das Plugin ist nur die Bedienoberfläche in Krita. Die eigentliche Bilderzeugung macht ein Hintergrundprogramm namens **ComfyUI**, das die Grafikkarte nutzt. „Lokal“ heißt: Es läuft auf deinem eigenen Rechner, nicht im Internet. Das Plugin installiert und startet es selbst („Local Managed Server“) – man muss ComfyUI nicht selbst einrichten.
   - **Krita** (5.2 oder neuer) von https://krita.org installieren – **nicht** die Version aus dem Microsoft Store oder Steam.
   - **Plugin herunterladen:** die neueste ZIP-Datei von https://github.com/Acly/krita-ai-diffusion/releases (für Krita 5.x die neueste Version 1.x).
   - **Plugin einbinden:** In Krita `Werkzeuge ▸ Skripte ▸ Python-Plugin aus Datei importieren …` (engl. *Tools ▸ Scripts ▸ Import Python Plugin from File…*), ZIP auswählen, mit „Ja“ aktivieren, **Krita neu starten**.
   - **Plugin-Fenster öffnen:** Neues Bild anlegen, dann `Einstellungen ▸ Dockers ▸ AI Image Generation` anhaken.
   - **Server einrichten:** Im Plugin-Fenster auf **Configure** klicken → **Local Managed Server** wählen.
     - **Installationsort:** ein Laufwerk mit viel Platz – mindestens 10 GB, eher **50 GB oder mehr**.
     - **Backend:** **CUDA** (für NVIDIA).
     - **Workloads:** auswählen, welche Modellfamilien installiert werden – eine mit **FLUX** und/oder **SDXL**. Mehr Workloads = mehr Download.
     - **Install** klicken und warten. Danach den Server mit **Launch** starten.
   - Voraussetzung: NVIDIA ab RTX 2060 und **aktueller Grafikkartentreiber**.
   - Anleitung des Herstellers: https://docs.interstice.cloud/installation/
6. **Claude-Desktop-App** öffnen, diesen Chat aufrufen und **„Mit diesem Computer verknüpfen“** wählen. Den Projektordner (`C:\Projekte\pen-and-paper-kids`) als Ordner freigeben.
7. Optional **Computer-Steuerung** erlauben, damit Claude Krita/Inky bedienen und Screenshots ansehen kann.

## Sicherheit
- API-Schlüssel (z. B. ElevenLabs) **nie ins Repo**. Sie kommen in eine lokale Datei `.env`, die in `.gitignore` steht.
- Erzeugte Bilder und Audio bleiben lokal, bis sie bewusst ins Repo übernommen werden.
