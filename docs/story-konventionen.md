# Story-Konventionen – was der Browser-Player aus der Story liest

Stand: 13.10.2026 · erster Entwurf

Diese Datei ist die Absprache zwischen der **Story** (Ink, `story/`) und dem **Browser-Player** (inkjs, `player/`, Ausbaustufe 1 seit 19.10.2026).
Beide Seiten halten sich daran. Neues kommt zuerst hierher, dann in die Story bzw. den Player.

Die Ink-Seite (Bausteine, Variablennamen) steht in `story/format.md`. Diese Datei beschreibt, **was der Player damit macht**.

Kennzeichnung: **Festgeschrieben** = so steht es schon in der Story und gilt. **Vorschlag** = noch nicht entschieden.

---

## 1. Grundprinzip

- **Ink rechnet, der Player zeigt.** Würfel, Magie, Level-Up und Weltgedächtnis laufen vollständig in Ink (`story/funktionen.ink`). Der Player würfelt **nicht selbst**, er stellt nur dar, was Ink gewürfelt hat.
- Darum gibt es **keine `EXTERNAL`-Funktionen**. Die Story bleibt in Inky vollständig spielbar, und `npm test` prüft alles.
- Der Player liest **Text, Entscheidungen, Tags und Variablen** und ruft für Taschen und Menschen **reine Ink-Funktionen** auf (Abschnitt 7a).

## 2. Ablauf im Player (festgeschrieben)

1. Spiel starten: Name als Freitext abfragen, dann `name` setzen, **bevor** die Story losläuft (`charakter.ink` erwartet das).
2. Text mit `Continue()` holen, bis eine Entscheidung kommt. Nach jeder Zeile die Tags (`currentTags`) auswerten.
3. Entscheidungen als Knöpfe anzeigen. Nach der Wahl weiter mit Schritt 2.
   **Lesefluss (Pasco, 14.10.2026):** Nach jeder Entscheidung springt die Ansicht **nicht ans Ende**, sondern so, dass die gewählte Zeile oben im Lesebereich steht – darunter folgen Würfelprobe und neuer Text. Man liest also immer von oben nach unten weiter und muss nie zurückscrollen. Unter dem letzten Text bleibt genug Platz, damit die gewählte Zeile ganz nach oben rücken kann.
   **Neues im Tagebuch (Pasco, 14.10.2026):** Kommt etwas ins Buch (neuer Kartenort, Eintrag, Gegenstand, Mensch), zeigt der Player kurz einen Zettel „Neu im Tagebuch“ mit genau dem, was gerade neu ist. Nach etwa vier Sekunden blendet er aus und fängt keine Berührungen ab. Dauerhaft bleibt nur das rote Siegel am zugeklappten Buch mit der Zahl der ungesehenen Neuigkeiten; es verschwindet, wenn man das Buch öffnet.
4. Spielstand nach jeder Entscheidung automatisch speichern (`story.state.toJson()`), siehe Abschnitt 9.

## 2a. Startbildschirm und Charaktererstellung (Design-Entwurf 14.10.2026)

**Startbildschirm:** der Einband des Abenteuerbuchs mit dem Titel aus `# titel:`. Ein Spielstand pro Gerät. Knöpfe: **Weiterlesen** (mit Name, Perle und Perlen-Titel des Spielstands), **Neues Abenteuer** (fragt nach, wenn schon ein Spielstand da ist – er geht dabei verloren) und **Diese Perle von vorn beginnen** (Speicherpunkt bei `# perle`, Abschnitt 9). Nach `# ende:` zeigt der Einband zusätzlich „Abenteuer bestanden“.

**Charaktererstellung** (zwischen `# charaktererstellung` und `# werte_fertig`):
- Der **Name** wird vorher im Player abgefragt (Freitext, höchstens 16 Zeichen) und in `name` geschrieben.
- Entscheidungen der Form `Titel – Beschreibung` zeigt der Player als Karte mit Überschrift und Unterzeile (Trennzeichen: Leerzeichen, Halbgeviertstrich, Leerzeichen).
- Entscheidungen der Form `Kraft (1)` erkennt er als Werte-Wahl und zeigt sie mit dem Plus aus der Frage.
- Links wächst ein **Steckbrief** mit, der neue Edelstein leuchtet golden.
- **Zurück ist erlaubt**, aber nur hier: Der Player speichert vor jeder Wahl den Ink-Zustand und stellt ihn bei „Zurück“ wieder her. Ab `# werte_fertig` gibt es kein Zurück mehr.
- **Im Player (19.10.2026):** Solange Ink hier nichts ausgibt, zeigt der Player eigene Sätze (z. B. „Zwerge sind stark wie der Fels: +1 Kraft.“). Gibt `charakter.ink` eine Zeile aus, nimmt er diese.
- **Entschieden (Pasco, 20.10.2026, umgesetzt in der lokalen Sitzung):** `charakter.ink` gibt beim Volksbonus von Zwerg, Gnom, Ork und Troll jetzt je einen Satz aus (z. B. „Zwerge sind stark wie der Fels: +1 Kraft.“). „Torwärter“ ist zu „Torwächter“ korrigiert. Für Mädchen heißt der Hintergrund jetzt **„Schiffsmädchen“** (Auswahl in `charakter.ink` und Vorteils-Label in `perle-1/stadt.ink`; die ID bleibt `schiffsjunge`). **Erledigt im Player (Technologie-Chat, 20.10.2026):** „Schiffsmädchen“ in `player/src/lib/texte.ts` und `player/src/seiten/Erstellung.svelte`; den Volksbonus-Satz nimmt der Player jetzt aus Ink (die eigenen Sätze bleiben nur als Rückfall).

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
| `tutorial` | `# tutorial: probe` | Hinweis-Symbol zur Regel einblenden; Werte: `werte`, `probe`, `tagebuch`, `magie`, `rasten`, `elementstufe` (Perle 4: Elementstufe steigt) **Player (20.10.2026):** Kasten „Tickwort sagt“ bzw. „Gut zu wissen“ nach der Zeile, bei `probe` am Würfel. | festgeschrieben |
| `charaktererstellung` | | Charaktererstellung beginnt: eigener Bildschirmstil | festgeschrieben |
| `werte_fertig` | | Charakterbogen erstmals anzeigen | festgeschrieben |
| `level_up` | | Level-Up-Darstellung, danach Charakterbogen aktualisieren | festgeschrieben |
| `erwachen` | | Magie-Bereich im Charakterbogen freischalten | festgeschrieben |
| `ausloeser` | `# ausloeser: brief` | Nur Information; der Wert steht auch in der Variable `ausloeser` | festgeschrieben |
| `probe` | `# probe` | Würfelanimation zur folgenden Probenzeile (Abschnitt 4) | festgeschrieben 13.10.2026 |
| `ende` | `# ende: erstes-abenteuer` | Abenteuer ist zu Ende: Abschlussbildschirm, Spielstand als „abgeschlossen“ markieren (steht am Schluss von Perle 7) | festgeschrieben 20.10.2026 |

Unbekannte Tags ignoriert der Player still. So kann die Story neue Tags einführen, bevor der Player sie kennt.

## 4. Würfelproben

**Festgeschrieben:** Nach jeder Probe ruft die Story `probe_zeile(...)` auf. Das erzeugt eine Textzeile wie
`(Geschick: Würfel 8 + 1 = 9 – Ja, aber …)`. Die Augen stehen zusätzlich in `letzter_augen`, die Summe in `letzter_gesamt`.

**Festgeschrieben 13.10.2026:** `probe_zeile` setzt den Tag `# probe` (in `story/funktionen.ink`). Neue Proben brauchen nichts weiter, solange sie wie bisher `probe_zeile` aufrufen. Der Player erkennt die Zeile daran und
- zeigt zwei animierte Würfel, die auf die gewürfelten Augen auslaufen,
- blendet danach Wert, Summe und Ergebnis ein (Erfolg / Ja, aber … / Misserfolg, jeweils mit eigener Farbe).

In Inky erscheint weiter die normale Textzeile. Getestet: Tags aus einer Funktion kommen bei inkjs an.

## 5. Bilder

**Festgeschrieben:** `# bild: <art>/<name>` mit den Arten `szene`, `entdeckung`, `figur`, `tagebuch`.
Der Player lädt `bilder/<art>/<name>.webp`. Fehlt das Bild, zeigt er nichts (kein Fehler, kein Platzhalter).

**Umgesetzt 19.10.2026:** `tools/baue-bilder.js` erzeugt diese WebP-Dateien beim Bauen aus `docs/art/szenen/perle-<n>/<art>-<name>.png`; für `figur/` notfalls aus `docs/art/figuren/<name>-einzel.png`. Im Querformat steht das zuletzt gezeigte Bild links, hochkant und auf dem Handy erscheint es im Text.

**Bildvarianten – festgeschrieben 13.10.2026:** Gibt es ein Bild in mehreren Varianten (je Freund, Hintergrund oder Element), schreibt die Story die Variante **direkt in den Tag**. Ink setzt Variablen in Tags ein:

```ink
# bild: szene/freund-faellt-{freund_kurz()}
# bild: szene/bezugsperson-packt-{hintergrund}
# bild: szene/morgen-mentor-{element}
```

`freund_kurz()` steht in `funktionen.ink` und gibt `liora` oder `cassian` zurück. Perle 1–7 sind umgestellt. Der Dateiname der Prompts endet entsprechend: `szene-freund-faellt-liora.prompt.txt`.

Voraussetzung: eine aktuelle Inky-Version (Variablen in Tags gibt es seit Ink 1.1).

**Zuordnung Tag ↔ Prompt-Datei:** `szene/hafen-kran` ↔ `docs/art/szenen/perle-<n>/szene-hafen-kran.prompt.txt`; `figur/borrik` ↔ `docs/art/figuren/borrik-einzel.*`. `npm test` listet am Ende alle Bild-Tags ohne passende Prompt-Datei als **Hinweis** auf (kein Fehler, weil noch nicht alle Bilder ausgearbeitet sind). So fallen Tippfehler und vergessene Varianten auf.

## 6. Karte

**Festgeschrieben:** `# karte: <ort>` mit Ortsschlüsseln in Kleinbuchstaben und Bindestrichen (`hafen`, `klippen-von-ahrn`, `tiefe-stiege`).

**Im Player – festgeschrieben 13.10.2026:** `docs/art/karten/karten.json` legt für jeden Schlüssel fest, was er aufdeckt (Ort, Bereich der Grundkarte, Weg) und welcher Ort danach der aktuelle ist. Einige Schlüssel sind Gebiete statt Orte: `kharvan-kamm`, `orin`, `orin-oberlauf`, `weiden`, `spaltstrasse`, `meridel-ganz` (deckt im Finale alles auf). Wege können auch über Variablen des Weltgedächtnisses erscheinen (`wolfspfad_bekannt`, `tiefe_stiege_weg`, `seeweg_bekannt`). Wie die Karte gemalt und zusammengesetzt wird: `docs/art/karten/README.md`.
- Ein **neuer** `# karte:`-Schlüssel braucht einen Eintrag in `karten.json` (und meist eine Skizze). `npm test` meldet fehlende Schlüssel als Hinweis.
- Entdeckte Orte erscheinen als Skizze, der aktuelle Ort ist mit „hier bin ich“ markiert.
- Antippen eines Ortes zeigt die Tagebucheinträge, die dort entstanden sind (Abschnitt 7).
- Die Reisewahl bleibt eine normale Ink-Entscheidung. Die Karte zeigt sie nur zusätzlich an (spätere Ausbaustufe).

Die Ortsschlüssel folgen den Orten in `docs/worldbuilding/karte-meridel.md`. Ähnliche Namen sind dort bewusst verschiedene Orte: `markt` (Straßen mit Ständen) und `marktplatz` (Ratshalle, Brunnen); `orin` (Fluss), `orinbruecke` und `orin-oberlauf` (Treidelpfad). Neue Orte zuerst dort eintragen.

## 7. Tagebuch

Gesamtentwurf des Tagebuchs (Bereiche, Taschen, Menschen, Fragen): `docs/tagebuch.md` (Vorschlag 14.10.2026, Story-Chat). Die Einteilung in Tagebuchseiten und Erinnerungen hier unten gilt dort mit.

**Festgeschrieben:** `# tagebuch: <Titel>` beginnt einen Eintrag. Der Player speichert dazu Perle und aktuellen Kartenort (für die Siegel auf der Karte).

**Festgeschrieben 14.10.2026 (Pasco, Design-Entwurf „Tagebuch“ auf claude.ai):** Es gibt zwei Arten von Einträgen, der Player erkennt sie automatisch:
- **Tagebuchseite** – einmal am Ende jeder Perle, erkennbar am `# bild: tagebuch/...` direkt davor. Sie zeigt die Skizze, darunter als Bildunterschrift den Satz „Du zeichnest …“ und dann die **Handschrift** der Spielfigur. Hier stehen auch die Entscheidungen („Ich habe den Gnollen geholfen …“), deshalb braucht es keine eigene Entscheidungsliste.
- **Erinnerung** – ein besonderer Moment mitten in einer Perle (Grisk, Kompass, Erwachen, Gildenbeitritt). Sie zeigt die Stelle aus der Geschichte zum Nachlesen.

Dafür zwei Tags, beide **am Ende einer Textzeile** (inline), damit eindeutig ist, zu welcher Zeile sie gehören:
- `# handschrift` hinter „Darunter schreibst du:“ – diese Zeile gehört noch zur Erzählung, ab der nächsten ist alles Handschrift (die äußeren Anführungszeichen lässt der Player weg).
- `# tagebuch_ende` hinter der **letzten Zeile** des Eintrags – diese Zeile gehört noch dazu. Steht das Ende in einer Verzweigung, braucht **jeder Zweig** sein eigenes `# tagebuch_ende`.
- `# tagebuch: <Titel>` steht auf einer eigenen Zeile **vor** der ersten Zeile des Eintrags. Achtung: Ein Tag allein auf einer Zeile hängt sich an die **nächste** Textzeile – am Ende eines Zweigs wäre das schon die nächste Szene.

`npm test` prüft in allen Durchläufen: Jeder Eintrag endet vor der nächsten Entscheidung, jede Tagebuchseite hat ihre Handschrift.

Eingebaut am 14.10.2026 in alle 17 Einträge. Dabei verschoben: „Die erste Seite“ beginnt jetzt bei „Du schlägst die erste Seite auf.“, „Grisk und die Erzmarke“ am Anfang des Erfolgs-Zweigs (vorher hing der Tag an der nächsten Szene), „Das Erwachen“ beim Erwachen der Magie selbst (vorher erst bei Yrsas Hinweis auf den Mentor). „Grisk und die Erzmarke“ gibt es weiterhin nur bei vollem Erfolg, weil nur dann die Erzmarke verschenkt wird.

## 7a. Taschen und Menschen (Vorschlag Story-Chat, vom Technologie-Chat bestätigt 14.10.2026)

Die Daten für die Laschen **Taschen** und **Menschen** stehen als Ink-Funktionen in `story/tagebuch.ink`. Damit bleiben alle Texte in der Story (Deutsch, mit `{freund()}`, `{bp()}` usw.) und ändern sich mit dem Weltgedächtnis.

| Funktion | Rückgabe |
|---|---|
| `taschen_liste()` / `menschen_liste()` | alle IDs, kommagetrennt, in Buchreihenfolge |
| `tasche_status(id)` | 0 nicht da, 1 dabei, 2 abgegeben (durchgestrichen zeigen) |
| `tasche_bild(id)`, `mensch_bild(id)` | Dateiname der Skizze ohne Endung (Rückgabewert), z. B. `quelle-feuer`, `maren`, `liora` |
| `mensch_bekannt(id)` | true / false |
| `tasche_name(id)`, `tasche_text(id)`, `mensch_name(id)`, `mensch_text(id)` | **Textausgabe** (nicht Rückgabewert): `story.EvaluateFunction(name, [id], true).output` |

Der Player ruft die Funktionen auf, wenn die Lasche geöffnet wird. Sie verändern den Spielstand nicht. Skizzen: Den Dateinamen liefern `tasche_bild(id)` und `mensch_bild(id)` (Varianten je Element, Gilde, Hintergrund, Liora/Cassian); der Player lädt `bilder/taschen/<name>.webp` bzw. `bilder/menschen/<name>.webp`. Prompts in `docs/art/tagebuch/` (14.10.2026); bis die Bilder da sind, kann das Einzelbild der Figur bzw. das Requisit dienen. `npm test` prüft mit `tools/teste-tagebuch.js`, dass jeder vorhandene Gegenstand und jeder bekannte Mensch Name und Text hat.

**Bestätigt (Technologie-Chat, 14.10.2026):** `EvaluateFunction` ist der richtige Weg – die Texte bleiben in der Story, ändern sich mit dem Weltgedächtnis und laufen durch denselben Test. Geprüft: In 25 kompletten Durchläufen mit Aufrufen an jeder Entscheidung und mitten im Text bleiben Text, Variablen und Besuchszähler genau gleich wie ohne Aufrufe. Dafür gelten zwei Regeln:
- **Die Funktionen sind rein:** keine Zuweisungen an Variablen (außer `temp`), kein `RANDOM`, keine Umleitungen (`->`) und keine Entscheidungen. `npm test` (`tools/teste-tagebuch.js`) prüft das; ein Aufruf darf keine Variable verändern.
- **Der Player ruft sie nur auf, wenn die Geschichte steht** – an einer Entscheidung oder zwischen zwei `Continue()`, nie während `ContinueAsync` läuft. Das ist ohnehin der Fall, weil man die Lasche nur öffnen kann, während man liest.

## 7b. Die Laschen im Player (festgelegt 14.10.2026)

Die Namen müssen zu Tickworts Erklärung in Perle 1 (`story/perle-1/tickwort.ink`, Stitch `buch`) passen. Reihenfolge von oben nach unten:

| Lasche | Inhalt | sichtbar ab |
|---|---|---|
| **Ich** | Charakterbogen | Tickwort schenkt das Buch (`# tutorial: tagebuch`) |
| **Erlebtes** | Tagebuchseiten und Erinnerungen (Abschnitt 7) | dito |
| **Karte** | Meridel und Lysmara (Abschnitt 6) | dito |
| **Taschen** | `taschen_liste()` … (Abschnitt 7a) | dito |
| **Menschen** | `menschen_liste()` … (Abschnitt 7a) | dito |

**Umgesetzt im Player (20.10.2026):** alle fünf Laschen. Beim Öffnen zeigt das Buch die Lasche mit Neuem, Laschen mit Ungesehenem tragen einen roten Punkt. Die Karte deckt zusätzlich alles auf, was `karten.json` unter `start` und `variablen` nennt.

Die **Geschichte** selbst ist keine Lasche – sie steht nicht im Buch. Zurück zur Geschichte geht es über das **Lesebändchen** oben am Buch (oder das Buch schließen). Vor dem Geschenk gibt es kein Buch: Der Player zeigt nur die Geschichte.

## 8. Entscheidungen und Charakterbogen

**Festgeschrieben** (so steht es bereits in den Perlen):
- `[… (Geschick)]` am Ende: Hinweis, welcher Wert gewürfelt wird → Player zeigt ihn als kleines Abzeichen.
- `[(Schiffsjunge) …]` am Anfang: Möglichkeit durch Hintergrund, Volk, Gilde oder Element → Player hebt sie hervor.

**Charakterbogen** liest diese Variablen: `name`, `volk`, `hintergrund`, `level`, `kraft`, `geschick`, `verstand`, `ausstrahlung`, `element`, `elementstufe`, `kraftfunken`, `quelle`, `gilde`, `silber`, `erzmarke`, `kompass`.

**Nie anzeigen:** `neigung_*` (unsichtbare Neigung), `pkt_*`, `letzter_*`, alle Weltgedächtnis-Fakten und – **entschieden 13.10.2026** – auch Ruf und Beziehungen (`ruf_*`, `beziehung_*`). Die Welt zeigt sie nur durch ihr Verhalten in der Geschichte.

## 9. Speichern

- Automatisch nach jeder Entscheidung, im Browser (IndexedDB).
- Zusätzlich ein Speicherpunkt bei jedem `# perle`. So kann man eine Perle neu beginnen.
- Der Spielstand ist der Ink-Zustand. Der Player speichert daneben nur seine eigenen Daten (Tagebuch, besuchte Orte).
- **Wichtig für später:** Ein gespeicherter Stand passt nur zur Story-Version, mit der er entstanden ist. Ändern sich Perlen, die schon gespielt wurden, kann ein alter Stand brechen. Für die Beta reicht: Perle neu beginnen.

## 10. Zurückgestellt: Vertonung

Entscheidung 13.10.2026: Zunächst **liest der Sohn selbst**. Erzählerstimme und Stimmen der Figuren bleiben offen, bis Story und Player abgeschlossen sind. Dann werden Zeilen-IDs ggf. nachträglich ergänzt.

Reserviert, damit sie nicht anders verwendet werden: `# sprecher: <figur>` und `# id: <perle>_<nummer>`.
