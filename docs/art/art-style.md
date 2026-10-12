# Art-Style

Stand 09.10.2026 – gemeinsam mit dem Sohn entschieden.

## Grundstil
**Gemaltes Abenteuerbuch:** warme Aquarell-/Gouache-Illustration mit Tuschekonturen, wie in einem hochwertig illustrierten Jugendbuch.
Referenz: `stil-vorschlaege/1-gemaltes-abenteuerbuch.jpg`

## Drei Bildebenen

| Ebene | Wofür | Stil | Referenz |
|---|---|---|---|
| **Szene** | Bestimmte Szenen und Charaktervorstellungen (Figuren, Begleiter, Freunde, Gegenspieler) | Gemaltes Abenteuerbuch, vollflächig | `1-gemaltes-abenteuerbuch.jpg` |
| **Entdeckung** | Städte und Mechaniken, vor allem beim ersten Anblick (erstes Luftschiff, Tram usw.) | Gemaltes Bild in der Mitte, Ränder lösen sich in Skizzen, Bleistiftlinien und Farbspritzer auf | `mix-1-und-3.jpg` |
| **Tagebuch** | Skizzen, die der Spieler story-technisch **selbst gemalt** und in seinem Tagebuch festgehalten hat | Bleistift-/Tuscheskizzen auf Papier, mit Notizen | Randskizzen in `mix-1-und-3.jpg` |

## Hinweise für die Bilderzeugung
- In den Skizzen keine unleserliche Pseudo-Schrift. Notizen entweder weglassen oder später als echter Text ergänzen.
- Figuren müssen über alle Bilder hinweg wiedererkennbar bleiben (Kleidung, Farben, Merkmale festhalten).
- Ton: warm und abenteuerlich, finstere Momente erlaubt, nicht gruselig.

## Karte und Tagebuch (entschieden 09.10.2026)
- **Die Karte ist eine Tagebuchseite:** Der Spieler malt die Karte selbst und erweitert sie nach und nach. Neue Orte erscheinen als Skizze, sobald man sie entdeckt. Das verbindet Karte, Nebel des Unbekannten und Tagebuch.
- **Tagebuch-Skizzen als Belohnung:** Nach wichtigen Entscheidungen oder Begegnungen kommt eine neue Skizze ins Tagebuch – zum Nachblättern.

## Szenenbilder bauen (Vorschlag, 12.10.2026)
1. **Figuren-Referenzblatt** (Grundaussehen, siehe `docs/worldbuilding/figuren-aussehen.md`).
2. **Ortsbild** für wiederkehrende Orte (z. B. Zwirbelgasse mit der Werkstatt Pimpelgrund & Zahnrad), abgelegt unter `docs/art/orte/`. Dient als Vorlage, damit der Ort jedes Mal gleich aussieht.
3. **Szenenbild** = Szenen-Prompt + Figuren-Referenz(en) + Ortsbild als Bildreferenz (FLUX.2 klein, `--referenz`).
4. Szenenzustände (Sturz, nass, rußig …) stehen **nur** im Szenen-Prompt, nie im Referenzblatt.

## Die Spielfigur in Bildern (festgelegt 12.10.2026)
- **Alle Szenenbilder zeigen die Sicht der Spielfigur** (Ich-Perspektive).
- **Von der Spielfigur ist nichts zu sehen** – kein Gesicht, keine Hände, keine Arme, keine Füße, kein Schatten.
- Grund: Die Spielfigur sieht bei jedem Spieler anders aus (5 Völker × 2 Geschlechter × Hintergrund).
- Figuren schauen den Betrachter an oder reden mit ihm; Magie der Spielfigur wird über ihre **Wirkung** gezeigt (z. B. Flammen, die auf den Betrachter zufließen), nicht über eine Hand.
- Für Bild-Prompts: „first-person point of view, the viewer is not visible, no hands, no arms, no body parts of the viewer“.
