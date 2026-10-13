# Story-Konventionen – was der Browser-Player aus der Story liest

Stand: 13.10.2026 · erster Entwurf

Diese Datei ist die Absprache zwischen der **Story** (Ink, `story/`) und dem **Browser-Player** (inkjs, noch nicht gebaut).
Beide Seiten halten sich daran. Neues kommt zuerst hierher, dann in die Story bzw. den Player.

Die Ink-Seite (Bausteine, Variablennamen) steht in `story/format.md`. Diese Datei beschreibt, **was der Player damit macht**.

Kennzeichnung: **Festgeschrieben** = so steht es schon in der Story und gilt. **Vorschlag** = noch nicht entschieden.

---

## 1. Grundprinzip

- **Ink rechnet, der Player zeigt.** Würfel, Magie, Level-Up und Weltgedächtnis laufen vollständig in Ink (`story/funktionen.ink`). Der Player würfelt **nicht selbst**, er stellt nur dar, was Ink gewürfelt hat.
- Darum gibt es **keine `EXTERNAL`-Funktionen**. Die Story bleibt in Inky vollständig spielbar, und `npm test` prüft alles.
- Der Player liest nur **Text, Entscheidungen, Tags und Variablen**.

## 2. Ablauf im Player (festgeschrieben)

1. Spiel starten: Name als Freitext abfragen, dann `name` setzen, **bevor** die Story losläuft (`charakter.ink` erwartet das).
2. Text mit `Continue()` holen, bis eine Entscheidung kommt. Nach jeder Zeile die Tags (`currentTags`) auswerten.
3. Entscheidungen als Knöpfe anzeigen. Nach der Wahl weiter mit Schritt 2.
4. Spielstand nach jeder Entscheidung automatisch speichern (`story.state.toJson()`), siehe Abschnitt 9.

## 3. Tags

Format immer `# name` oder `# name: wert`. Kleinschreibung, keine Umlaute im Namen.

| Tag | Beispiel | Was der Player tut | Status |
|---|---|---|---|
| `titel` | `# titel: Der Weg hinaus` | Titel des Abenteuers (Startbildschirm) | festgeschrieben |
| `perle` | `# perle: 2` | Neue Perle beginnt: Speicherpunkt setzen | festgeschrieben |
| `kapitel` | `# kapitel: Am Fluss der Räder` | Kapitelüberschrift anzeigen | festgeschrieben |
| `bild` | `# bild: szene/hafen-kran` | Bild über dem folgenden Text zeigen (Abschnitt 5) | festgeschrieben |
| `karte` | `# karte: hafen` | Ort als „besucht“ auf der Karte markieren und als aktuellen Ort setzen (Abschnitt 6) | festgeschrieben |
| `tagebuch` | `# tagebuch: Tickworts Kompass` | Neuer Tagebucheintrag mit diesem Titel (Abschnitt 7) | festgeschrieben |
| `tutorial` | `# tutorial: probe` | Hinweis-Symbol zur Regel einblenden; Werte: `werte`, `probe`, `tagebuch`, `magie`, `rasten` | festgeschrieben |
| `charaktererstellung` | | Charaktererstellung beginnt: eigener Bildschirmstil | festgeschrieben |
| `werte_fertig` | | Charakterbogen erstmals anzeigen | festgeschrieben |
| `level_up` | | Level-Up-Darstellung, danach Charakterbogen aktualisieren | festgeschrieben |
| `erwachen` | | Magie-Bereich im Charakterbogen freischalten | festgeschrieben |
| `ausloeser` | `# ausloeser: brief` | Nur Information; der Wert steht auch in der Variable `ausloeser` | festgeschrieben |
| `probe` | `# probe` | Würfelanimation zur folgenden Probenzeile (Abschnitt 4) | **Vorschlag** |

Unbekannte Tags ignoriert der Player still. So kann die Story neue Tags einführen, bevor der Player sie kennt.

## 4. Würfelproben

**Festgeschrieben:** Nach jeder Probe ruft die Story `probe_zeile(...)` auf. Das erzeugt eine Textzeile wie
`(Geschick: Würfel 8 + 1 = 9 – Ja, aber …)`. Die Augen stehen zusätzlich in `letzter_augen`, die Summe in `letzter_gesamt`.

**Vorschlag:** In `probe_zeile` ein `# probe` ergänzen (eine Zeile in `story/funktionen.ink`, an der Story ändert sich sonst nichts). Dann erkennt der Player die Zeile sicher und
- zeigt zwei animierte Würfel, die auf die gewürfelten Augen auslaufen,
- blendet danach Wert, Summe und Ergebnis ein (Erfolg / Ja, aber … / Misserfolg, jeweils mit eigener Farbe).

In Inky erscheint weiter die normale Textzeile. Getestet: Tags aus einer Funktion kommen bei inkjs an.

## 5. Bilder

**Festgeschrieben:** `# bild: <art>/<name>` mit den Arten `szene`, `entdeckung`, `figur`, `tagebuch`.
Der Player lädt `bilder/<art>/<name>.webp`. Fehlt das Bild, zeigt er nichts (kein Fehler, kein Platzhalter).

**Problem:** Einige Tags sind allgemein, die Bilder gibt es aber in Varianten. Beispiel: `# bild: szene/freund-faellt`, die Prompts heißen `szene-freund-faellt-liora` und `szene-freund-faellt-cassian`. Der Player weiß nicht, welches Bild gemeint ist.

**Vorschlag:** Die Story schreibt die Variante direkt in den Tag. Ink kann Variablen in Tags einsetzen (getestet):

```ink
# bild: szene/freund-faellt-{freund_kurz()}
# bild: szene/bezugsperson-packt-{hintergrund}
# bild: szene/morgen-mentor-{element}
```

Dafür eine kleine Hilfsfunktion `freund_kurz()` in `funktionen.ink`, die `liora` oder `cassian` zurückgibt.
Betroffen sind derzeit (allgemeiner Tag, Bilder in Varianten): `freund-faellt`, `freund-abgeholt`, `bezugsperson-packt`, `wiedersehen`, `brunnen-abend`, `brunnen-nacht`, `hinter-dem-stall`, `gasthaus-krummer-stab`, `lamm-auf-der-strasse`, `morgen-mentor`, `erwachen-*`, `entdeckung/magiergesetz`, `entdeckung/vorfuehrung`, `figur/freund`, `figur/freund-verkleidet`.

Voraussetzung: eine aktuelle Inky-Version (Variablen in Tags gibt es seit Ink 1.1).

**Zuordnung Tag ↔ Prompt-Datei:** `szene/hafen-kran` ↔ `docs/art/szenen/perle-<n>/szene-hafen-kran.prompt.txt`; `figur/borrik` ↔ `docs/art/figuren/borrik-einzel.*`. Ein Prüfskript dafür kann später in `npm test` (Vorschlag).

## 6. Karte

**Festgeschrieben:** `# karte: <ort>` mit Ortsschlüsseln in Kleinbuchstaben und Bindestrichen (`hafen`, `klippen-von-ahrn`, `tiefe-stiege`).

**Im Player (Vorschlag):** Eine Datei `karten.json` ordnet jeden Ortsschlüssel einer Karte (Stadtplan Lysmara oder Meridel) und einer Position zu. Das ist Player-Sache, die Story muss davon nichts wissen.
- Besuchte Orte werden markiert, der aktuelle Ort hervorgehoben.
- Antippen eines Ortes zeigt die Tagebucheinträge, die dort entstanden sind (Abschnitt 7).
- Die Reisewahl bleibt eine normale Ink-Entscheidung. Die Karte zeigt sie nur zusätzlich an (spätere Ausbaustufe).

**Zu klären:** `markt` (einmal, Perle 1) und `marktplatz` (viermal) – derselbe Ort? Ebenso `orin` / `orinbruecke` / `orin-oberlauf`.

## 7. Tagebuch

**Vorschlag:** `# tagebuch: <Titel>` beginnt einen Eintrag. Zum Eintrag gehört der Text ab dieser Zeile **bis zur nächsten Entscheidung**. Der Player speichert dazu Perle und aktuellen Kartenort. Ein `# bild: tagebuch/...` direkt davor wird das Bild des Eintrags.

## 8. Entscheidungen und Charakterbogen

**Festgeschrieben** (so steht es bereits in den Perlen):
- `[… (Geschick)]` am Ende: Hinweis, welcher Wert gewürfelt wird → Player zeigt ihn als kleines Abzeichen.
- `[(Schiffsjunge) …]` am Anfang: Möglichkeit durch Hintergrund, Volk, Gilde oder Element → Player hebt sie hervor.

**Charakterbogen** liest diese Variablen: `name`, `volk`, `hintergrund`, `level`, `kraft`, `geschick`, `verstand`, `ausstrahlung`, `element`, `elementstufe`, `kraftfunken`, `quelle`, `gilde`, `silber`, `erzmarke`, `kompass`.

**Nie anzeigen:** `neigung_*` (unsichtbare Neigung), `pkt_*`, `letzter_*` und alle Weltgedächtnis-Fakten.
**Zu klären:** Ruf und Beziehungen (`ruf_*`, `beziehung_*`) gar nicht, als Symbol (z. B. Gesichter) oder als Zahl zeigen?

## 9. Speichern

- Automatisch nach jeder Entscheidung, im Browser (IndexedDB).
- Zusätzlich ein Speicherpunkt bei jedem `# perle`. So kann man eine Perle neu beginnen.
- Der Spielstand ist der Ink-Zustand. Der Player speichert daneben nur seine eigenen Daten (Tagebuch, besuchte Orte).
- **Wichtig für später:** Ein gespeicherter Stand passt nur zur Story-Version, mit der er entstanden ist. Ändern sich Perlen, die schon gespielt wurden, kann ein alter Stand brechen. Für die Beta reicht: Perle neu beginnen.

## 10. Zurückgestellt: Vertonung

Entscheidung 13.10.2026: Zunächst **liest der Sohn selbst**. Erzählerstimme und Stimmen der Figuren bleiben offen, bis Story und Player abgeschlossen sind. Dann werden Zeilen-IDs ggf. nachträglich ergänzt.

Reserviert, damit sie nicht anders verwendet werden: `# sprecher: <figur>` und `# id: <perle>_<nummer>`.
