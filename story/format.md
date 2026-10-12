# Story-Format

**Festgelegt 12.10.2026: Ink.**

## Empfehlung: Ink
[Ink](https://www.inklestudios.com/ink/) ist eine freie, quelloffene Skriptsprache von inkle, gebaut genau für verzweigte, textbasierte Geschichten.

**Warum Ink:**
- **Gut lesbar:** Eine Ink-Datei liest sich fast wie ein Buch. Pasco kann direkt mitschreiben.
- **Hat alles, was wir brauchen:** Entscheidungen, Variablen (Weltgedächtnis, Werte, Neigungspunkte), Bedingungen, Zufall (Würfel).
- **Sofort spielbar:** Mit dem kostenlosen Editor **Inky** lässt sich jede Szene direkt durchspielen – ohne App. Inky kann eine Geschichte auch als Webseite exportieren. So kann der Sohn schon testen, bevor es eine App gibt.
- **Hält App vs. Webseite offen:** Ink läuft im Browser (inkjs) und lässt sich auch in native Apps einbinden.

## Aufbau im Repo
```
story/
  format.md            – diese Datei
  hauptstory-entwurf.md
  main.ink             – Einstieg, bindet alle Dateien ein (in Inky öffnen)
  variablen.ink        – Werte, Magie, Neigungen, Weltgedächtnis
  funktionen.ink       – probe(), zauber(), rasten(), Level-Up usw.
  charakter.ink        – Charaktererstellung
  perle-1/
    perle-1.ink        – Perle 1 (weitere Dateien je Szene möglich)
  perle-2/ …
  beispiel/
    kai-im-regen.ink   – eigenständige Beispielszene
tools/
  teste-story.js       – automatischer Test (npm test)
```

## Bausteine
| Baustein | Verwendung |
|---|---|
| `probe(wert)` | 2W6 + Wert → `ERFOLG`, `JA_ABER` oder `MISSERFOLG` |
| `zauber(umgebung)` | Zauberprobe; `umgebung` 1 = stark, 0 = vorhanden, -1 = fehlt. Kostet einen Kraftfunken, verbraucht ggf. die Quelle. Gibt `KEINE_KRAFT` zurück, wenn es nicht geht. |
| `kann_zaubern(umgebung)` | Für Bedingungen bei Entscheidungen, z. B. `+ {kann_zaubern(1)} [Zaubern]` |
| `rasten()` | Kraftfunken auffüllen |
| `staerkste_neigung()` | Element mit den meisten Neigungspunkten (für das Erwachen in Perle 2) |
| `steigern(wert)` | Wert +1, höchstens 3 |
| `aendern(ruf_x, um)` | Ruf/Beziehung ändern, bleibt zwischen -3 und +3 |
| `-> level_up ->` | Level-Up am Ende jeder Perle |

## Testen
- **Spielen:** `story/main.ink` im kostenlosen Editor [Inky](https://github.com/inkle/inky/releases) öffnen.
- **Automatisch prüfen:** `npm install`, dann `npm test`. Spielt die Geschichte 500-mal zufällig durch und meldet Fehler, Sackgassen und Werte außerhalb des erlaubten Bereichs.
- **Einen Durchlauf lesen:** `node tools/zeige-durchlauf.js 3` gibt einen kompletten zufälligen Durchlauf (Zahl = Startwert) als Text aus – gut zum Korrekturlesen.
- **Hilfsfunktionen prüfen:** `node tools/pruefe-funktionen.js`

## Konventionen
- **Weltgedächtnis** als Variablen mit sprechenden Namen: `kobold_gerettet`, `ruf_goldene_waage`.
- **Neigungspunkte:** `neigung_erde`, `neigung_wasser`, `neigung_feuer`, `neigung_wind`.
- **Würfelprobe:** `probe(wert)` = 2W6 + Wert. Ab 10 Erfolg, 7–9 „Ja, aber …“, darunter Misserfolg.
- **Tagebuch-Einträge und Bilder** werden mit Tags markiert, z. B. `# tagebuch: Der Kobold im Hafen` oder `# bild: szene/hafen-nacht`. Die App liest die Tags später aus.

## Beispiel
Siehe `beispiel/kai-im-regen.ink` – eine kurze, eigenständige Szene mit Entscheidung, Würfelprobe, Weltgedächtnis und Element-Neigung.
