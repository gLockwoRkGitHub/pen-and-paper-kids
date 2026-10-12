# Werkzeuge für Bilder und Karten

Stand 12.10.2026. Ziel: Bilder **lokal und privat** erzeugen – keine Firmenkonten, keine Credits, niemand sonst sieht das Artwork.

## Empfehlung: Krita + Krita AI Diffusion
- **Krita** ist ein freies, quelloffenes Malprogramm.
- Das Plugin **Krita AI Diffusion** (GPL-3.0) erzeugt Bilder direkt in Krita und läuft **komplett lokal** (über ComfyUI im Hintergrund, wird vom Plugin eingerichtet).
- Man kann skizzieren und die KI das Bild ausarbeiten lassen, einzelne Bereiche nachbessern und **Referenzbilder** nutzen, damit Figuren gleich aussehen.
- **Hardware:** NVIDIA-Grafikkarte mit mindestens 6 GB Grafikspeicher empfohlen; Apple-Silicon-Macs (macOS 14+) werden ebenfalls unterstützt. Ohne passende Grafikkarte ist es sehr langsam.
- Quelle: https://github.com/Acly/krita-ai-diffusion

## Modelle und Lizenzen (falls das Spiel veröffentlicht wird)
| Modell | Kommerzielle Nutzung | Hinweis |
|---|---|---|
| FLUX.1 [schnell] | ja (Apache-2.0) | Sicherste Wahl für eine spätere Veröffentlichung |
| SDXL (und darauf aufbauende Modelle) | ja (Open RAIL++-M) | Riesige Auswahl an Stil-Modellen; Lizenz des jeweiligen Modells prüfen |
| FLUX.1 [dev] | nur nicht-kommerziell | Für ein veröffentlichtes Spiel vermeiden |
| Stable Diffusion 3.5 | ja, bis 1 Mio. $ Jahresumsatz | |

Lizenzen können sich ändern – vor einer Veröffentlichung noch einmal prüfen. Keine Rechtsberatung.

## Installiert und erprobt (12.10.2026)
Auf Pascos PC sind installiert: **FLUX.2 klein 4B** und **SDXL mit ZavyChroma XL v8** (dazu Stil-Referenz/IP-Adapter und Linien-Steuerung/ControlNet für SDXL). Beide lassen sich über `tools/erzeuge-bild.js` ansprechen (`--modell flux2` bzw. `--modell sdxl`).

Vergleich am Beispiel Tickwort:
- **FLUX.2 klein 4B** hält sich genau an lange Beschreibungen (ein Auge, drei Beine, Klappe) und kann ein Bild mit Bildreferenz gezielt ändern. Etwa 3–4 Sekunden pro Bild. **Erste Wahl für Figuren und alles, was wiedererkennbar bleiben muss.**
- **SDXL / ZavyChroma** braucht kurze, stichwortartige Prompts mit dem Stil am Anfang; lange Beschreibungen ergeben fotoartige Bilder. Der Aquarell-Look ist sehr schön, aber Details der Figur gehen verloren (zwei Augen, zwei Beine, erfundene Gegenstände). Etwa 7 Sekunden pro Bild. Gedacht für Karten und Skizzen mit Linienvorlage – das ist noch nicht erprobt.

Die Lizenzen von FLUX.2 klein 4B und ZavyChroma XL sind noch nicht nachgeprüft (siehe Tabelle oben für die übrigen Modelle).

## Karten
- **Azgaar's Fantasy Map Generator** (quelloffen, auch als Desktop-Version): um die Geografie von Meridel festzulegen – Küste, Fluss, Gebirge, Schlucht.
- Die eigentlichen Karten im **Tagebuch-Stil** dann in Krita: das Azgaar-Layout als Vorlage, darüber Bleistift-/Tusche-Stil (z. B. mit Linienzeichnungs-Steuerung im Plugin).

## Bereits erzeugte Bilder
Die sechs Stilvorschläge in `stil-vorschlaege/` wurden mit Gamma erzeugt und liegen auch in der Gamma-Mediathek des Firmenkontos. Sie können dort gelöscht werden.
