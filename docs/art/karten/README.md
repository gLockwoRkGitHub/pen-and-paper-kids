# Karten im Spiel

**Entschieden 13.10.2026 (Pasco):** Grundkarte und Orte werden getrennt gemalt. Der Player setzt die Karte Stück für Stück zusammen.

## Wie die Karte im Player entsteht

Die Karte ist eine Seite im Tagebuch der Spielfigur. Sie wächst mit dem Abenteuer:

1. **Grundkarte** – ein gemaltes Bild je Karte (Meridel, Stadtplan Lysmara). Nur Natur bzw. Stadtgrundriss, **keine Orte, keine Wahrzeichen, keine Schrift**.
   Der Player zeigt davon nur die **Bereiche**, die schon aufgedeckt sind (weiche Ränder), der Rest bleibt leeres Papier.
2. **Ortsskizzen** – ein kleines Bild je Ort (Dorf, Festung, Leuchtturm, Wasserräder …). Der Player legt es genau an seine Stelle, sobald die Figur den Ort entdeckt.
3. **Wege** – Straßen und Pfade zeichnet der Player selbst als Tuschelinie (gestrichelt, wenn man nur davon gehört hat).
4. **Beschriftungen** – schreibt der Player in Handschrift dazu. In Bildern steht nie Text.

Was wann aufgedeckt wird, steht in `karten.json` unter `tags` (Story-Tag `# karte: …`) und `variablen` (Weltgedächtnis, z. B. `wolfspfad_bekannt`).
So stimmen die Positionen immer, auch wenn die KI eine Skizze anders malt als gedacht.

**Weißer Hintergrund:** Alle Kartenbilder werden auf **reinweißem** Hintergrund erzeugt, ohne Papierstruktur. Der Player legt sie mit der Mischfarbe „Multiplizieren“ auf das Pergament der Buchseite; Weiß verschwindet dabei, Tusche und Aquarell bleiben. Ein Freistellen ist nicht nötig.

## Dateien

| Datei | Inhalt |
|---|---|
| `karten.json` | Karten, Bereiche, Orte (Lage und Größe), Wege, was jeder Tag aufdeckt |
| `meridel-grundvorlage.png`, `lysmara-grundvorlage.png` | Linienvorlage für die Grundkarten (schwarz auf weiß, ohne Orte und Schrift) |
| `meridel-lagevorlage.png`, `lysmara-lagevorlage.png` | Lagevorlage mit allen Orten und Namen – zum Einmessen |
| `meridel-grund.prompt.txt`, `lysmara-grund.prompt.txt` | Prompts der Grundkarten |
| `skizzen/<name>.prompt.txt` | Prompts der Ortsskizzen (28 Stück) |
| `meridel-grund.png`, `lysmara-grund.png`, `skizzen/<name>.png` | die fertigen Bilder (entstehen lokal) |

Die Vorlagen erzeugt `python3 tools/karten-vorlage.py` (PNG braucht Playwright mit Chromium).

## Arbeitsschritte für die lokale Sitzung

### 1. Grundkarten
- Erzeugen mit FLUX.2 klein, Linienvorlage als Referenz, **6 Seeds**:
  `node tools/erzeuge-bild.js docs/art/karten/meridel-grund.prompt.txt docs/art/karten/entwurf/meridel-grund --anzahl 6 --breite 1536 --hoehe 1248 --referenz docs/art/karten/meridel-grundvorlage.png`
  Für Lysmara entsprechend mit `--hoehe 1152` und `lysmara-grundvorlage.png`.
- **Prüfen:** Küste links, Fluss im Bogen von oben rechts zur Küste, Gebirge als Hufeisen, **eine** Lücke rechts in der Mitte (Nyrrspalt). Keine Häuser, Straßen, Schrift, kein Rahmen, weißer Hintergrund.
- Hält sich FLUX nicht an die Anordnung: in Krita mit SDXL und der Grundvorlage als **Linienvorlage** (Control-Ebene „Line Art“) malen. Ergebnis in `docs/art/werkzeuge.md` festhalten.
- Gewähltes Bild als `meridel-grund.png` bzw. `lysmara-grund.png` speichern. Den Ordner `entwurf/` nicht committen.

### 2. Einmessen (wichtig)
Die Koordinaten in `karten.json` stammen aus der Lagevorlage. Die gemalte Grundkarte weicht davon ab.
- Ein **Prüfbild** bauen: Grundkarte auf die Größe der Lagevorlage skalieren (Meridel 1280×1040, Lysmara 1200×900), Lagevorlage mit 50 % Deckkraft darüberlegen → `docs/art/karten/pruefung-meridel.png` bzw. `pruefung-lysmara.png`.
- Wo Küste, Flussmündung, Nyrrspalt oder Gebirgsfuß deutlich abweichen: in `karten.json` die `x`/`y` der betroffenen Orte, die Punkte der Wege und die Bereichsflächen so verschieben, dass sie auf der **gemalten** Karte stimmen (Beispiel: Lysmara muss an der gemalten Flussmündung liegen, Vardholm in der gemalten Lücke).
- In `karten.json` bei der Karte `"eingemessen": "<Datum>"` ergänzen.
- Prüfbild committen; Pasco bzw. Claude im Chat schauen es sich an.

### 3. Ortsskizzen
- Erst nach dem Einmessen, weil die Größen (`breite` in `karten.json`) zur Grundkarte passen müssen.
- Je Skizze **4 Seeds**, Format steht in der ersten Zeile der Prompt-Datei, z. B.:
  `node tools/erzeuge-bild.js docs/art/karten/skizzen/wollmark.prompt.txt docs/art/karten/entwurf/wollmark --anzahl 4 --breite 1024 --hoehe 1024`
- Die Referenz in der ersten Zeile ist **optional** (nur Wiedererkennung, z. B. das Ortsbild von Wollmark). Wenn sie den Bildaufbau übernimmt (ganze Landschaft statt kleines Symbol), ohne Referenz erzeugen.
- **Prüfen:** ein einzelnes kleines Symbol mittig, viel Weiß drumherum, keine Landschaft bis zum Rand, keine Schrift, kein Schatten auf dem Hintergrund, im selben Zeichenstil wie die Grundkarte.
- Gewähltes Bild als `skizzen/<name>.png` speichern (Name wie die Prompt-Datei).
- Zum Schluss ein **Zusammenbau-Bild** je Karte: Grundkarte, alle Skizzen an ihrer Stelle in ihrer `breite` (Mitte = `x`,`y`), Wege als Linien → `pruefung-meridel-komplett.png`, `pruefung-lysmara-komplett.png`. Daran sieht man, ob Größen und Lage stimmen.

## Bezug zur Story
- Jeder `# karte: …`-Schlüssel der Story steht unter `tags` in `karten.json`. `npm test` meldet Schlüssel, die fehlen.
- Neue Orte: zuerst in `docs/worldbuilding/karte-meridel.md`, dann Eintrag in `karten.json` (Ort, Tag, ggf. Bereich/Weg) und eine Prompt-Datei in `skizzen/`.
- Die früheren ganzen Kartenbilder je Perle (`karte-meridel-perle-1`, `karte-meridel-perle-4`) **entfallen**. Tagebuchbilder mit Kartenmotiv (z. B. `tagebuch/perle-1`, „Die erste Seite“) bleiben, sie sind Bilder im Tagebuch, nicht die Karte.

## Grundkarten (lokale Sitzung, 14.10.2026)
| Datei | Seed | Bemerkung |
|---|---|---|
| `meridel-grund.png` | 1 | Folgt der Grundvorlage genau (Prüfbild `pruefung-meridel.png`). Schwäche: ein zusätzlicher kleiner Bach kommt oben aus dem Kamm in den Orin; die Bergdreiecke der Vorlage sind noch als Umriss zu sehen |
| `lysmara-grund.png` | 8 (zweite Runde) | Runde 1: Fluss lief rechts aus dem Bild statt unten entlang ins Meer; Prompt nachgeschärft. Prüfbild `pruefung-lysmara.png` deckt sich mit der Lagevorlage |

**Einmessen (K2):** Beide Grundkarten wurden mit der Vorlage als Bildreferenz erzeugt und liegen deckungsgleich auf der Lagevorlage (siehe Prüfbilder). Die Koordinaten in `karten.json` mussten deshalb nicht verschoben werden; `"eingemessen": "14.10.2026"` ist eingetragen. Claude im Chat sollte die Prüfbilder noch einmal ansehen.
