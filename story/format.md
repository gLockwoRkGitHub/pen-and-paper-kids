# Story-Format

**Vorschlag von Claude, 12.10.2026 – noch nicht entschieden.**

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
  main.ink             – Einstieg, bindet alle Perlen ein
  variablen.ink        – Werte, Weltgedächtnis, Neigungspunkte
  funktionen.ink       – Würfelprobe, Zauberprobe usw.
  perle-1/
    intro.ink
    start-fragen.ink
    ...
  perle-2/
  ...
  beispiel/
    kai-im-regen.ink   – Beispielszene
```

## Konventionen
- **Weltgedächtnis** als Variablen mit sprechenden Namen: `kobold_gerettet`, `ruf_goldene_waage`.
- **Neigungspunkte:** `neigung_erde`, `neigung_wasser`, `neigung_feuer`, `neigung_wind`.
- **Würfelprobe:** `wuerfeln(wert)` = 2W6 + Wert. Ab 10 Erfolg, 7–9 „Ja, aber …“, darunter Misserfolg.
- **Tagebuch-Einträge und Bilder** werden mit Tags markiert, z. B. `# tagebuch: Der Kobold im Hafen` oder `# bild: szene/hafen-nacht`. Die App liest die Tags später aus.

## Beispiel
Siehe `beispiel/kai-im-regen.ink` – eine kurze Szene mit Entscheidung, Würfelprobe, Weltgedächtnis und Element-Neigung. Getestet: kompiliert fehlerfrei.
