# Das Tagebuch – Entwurf

**Entwurf von Claude, 14.10.2026. Bereiche entschieden von Pasco am 14.10.2026:** Ich, Erlebtes, Karte, Taschen, Menschen. Fragen entfällt. Grundlage: Entscheidungen zum Art-Style (Tagebuch-Skizzen, Karte als Tagebuchseite), der abgenommene Charakterbogen-Entwurf (Stand 13.10.2026), die Karte aus Teilen (`docs/art/karten/README.md`), `docs/story-konventionen.md` und Pascos Idee aus dem Handy-Chat (`docs/ideen.md`). Was hier **Vorschlag** heißt, ist noch nicht entschieden.

---

## 1. Grundidee

Das Tagebuch ist **das ganze Spiel außerhalb des Lesens**. Alles, was nicht Geschichte ist, steht im Buch, das Tickwort der Spielfigur in Perle 1 schenkt: wer sie ist, was sie erlebt hat, wo sie war, was sie bei sich trägt.

- Es sieht aus wie ein **ledergebundenes Reisetagebuch** mit Messingecken, abgegriffenem Pergament und **Register-Laschen** am Rand (Tablet rechts, Handy unten), wie im abgenommenen Charakterbogen-Entwurf.
- Alles darin ist **aus Sicht der Spielfigur** geschrieben und gezeichnet: Ich-Form, Handschrift, Kohleskizzen. Es gibt **keine Zahlen außer den Werten** und keine Fortschrittsbalken.
- Das Buch **wächst mit der Geschichte**. Am Anfang sind fast alle Seiten leer. Bereiche erscheinen erst, wenn die Geschichte sie freischaltet.

## 2. Die Bereiche (Register-Laschen)

| Lasche | Inhalt | Ab wann | Status |
|---|---|---|---|
| **Ich** | Charakterbogen: Name, Volk, Hintergrund, Level (Wachssiegel), vier Werte (rote Edelsteine), „Was ich gut kann“, später Magie und Gilde | Perle 1, Tickwort | festgelegt (Entwurf abgenommen) |
| **Erlebtes** | Die Tagebucheinträge, nach Perlen geordnet, jeder mit Titel, Skizze und Text | Perle 1, „Die erste Seite“ | Vorschlag (Abschnitt 4) |
| **Karte** | Meridel und Lysmara, aus Grundkarte und Ortsskizzen zusammengesetzt; „hier bin ich“; Siegel öffnen die Einträge des Ortes | Perle 1, „Die erste Seite“ | festgelegt (13.10.2026) |
| **Taschen** | Was die Spielfigur bei sich trägt, als kleine Skizzen mit einem Satz | sobald der erste Gegenstand da ist (Kompass oder Erzmarke, Perle 1) | **entschieden 14.10.2026**, Daten in `story/tagebuch.ink` |
| **Menschen** | Wen die Spielfigur getroffen hat: Skizze und ein Satz, **ohne** Werte für Beziehungen | ab Perle 1 | **entschieden 14.10.2026**, Daten in `story/tagebuch.ink` |
| ~~**Fragen**~~ | ~~Offene Fragen und Ziele~~ | – | **entfällt** (Pasco, 14.10.2026) |

**Entschieden (Pasco, 14.10.2026):** fünf Laschen – Ich, Erlebtes, Karte, Taschen, Menschen.

## 3. Ich (Charakterbogen)

Wie im abgenommenen Entwurf. Neu ist nur der Text für **„Was ich gut kann“**: ein Satz zum Volk und ein bis zwei Sätze zum Hintergrund, in der Ich-Form, als Handschrift.

**Überarbeitet vom Technologie-Chat (14.10.2026)** und mit Perle 1–7 abgeglichen: Die Sätze verwenden die Formulierungen der Story (Intro in `perle-1/intro.ink`, Zitate der Bezugspersonen) und versprechen nur, was die Geschichte auch einlöst. Wo ein Hintergrund bei Proben hilft, deutet der Text an, **wobei** – so merkt das Kind, wann es sich lohnt.

### Volk
| Volk | Text | Bonus | Wo die Story es aufgreift |
|---|---|---|---|
| Mensch | „Ich lerne schnell und passe mich an. In jeder Stadt finde ich mich zurecht.“ | +1 nach Wahl | Intro (Lysmara ist eine Menschenstadt) |
| Zwerg | „Ich bin stark und stur wie der Fels. Was ich einmal festhalte, lasse ich nicht mehr los.“ | +1 Kraft | Intro; Borrik begrüßt dich als „Kind des Berges“ |
| Gnom | „In meinem Kopf drehen sich immer Zahnräder. Für jedes Problem fällt mir eine Idee ein, meistens sogar zwei.“ | +1 Verstand | Intro |
| Ork | „Ich bin laut und stolz, und mein Herz sitzt am rechten Fleck. Wenn ich rede, hören die Leute zu.“ | +1 Ausstrahlung | Intro; Grumak grüßt dich als einen aus den Clans |
| Troll | „Ich bin größer als die meisten und trotzdem schneller als fast alle. Niemand rechnet damit, wie flink ich bin.“ | +1 Geschick | Intro; Grumak grüßt dich als einen aus den Clans |

### Hintergrund
| Hintergrund | Text | Was die Story einlöst |
|---|---|---|
| Reisende/r | „Seit drei Sommern ziehe ich mit Maren über die Wege des Landes. Ich finde Pfade, die auf keiner Karte stehen.“ | Perle 4: Viehpfad an der Brücke; Perle 5: Maultier beruhigen; Perle 7: Ziegenpfad an der Wachhütte |
| Schausteller/in | „Ich gehöre zu den Funkelnden Narren. Ich kann jonglieren und weiß, wie man ein Publikum fesselt. Man muss nur wissen, wo es kitzelt.“ | Perle 1: Vorstellung geben (Ausstrahlung +1) |
| Straßenkind | „Ich kenne jede Abkürzung zwischen Hafen und Markt, jedes Dach und jeden Keller. Wo andere nicht durchkommen, schlüpfe ich hindurch.“ | Perle 1: über die Dächer, durch die Hinterhöfe; Perle 3: die Gewölbe, unter der Zeltwand durch (Geschick +1) |
| Botenläufer/in | „Ich laufe für das Botenhaus am Markt und kenne jeden Torwächter mit Namen. Meister Holm sagt, ich hätte Wind in den Beinen. Und niemand hält einen Boten auf.“ | Perle 1: „Eilzustellung kostet extra“, Abkürzung, Botengang über die Berge; Perle 2: Kontakte; Perle 3: als Bote ins Zelt (Ausstrahlung +1) |
| Kartografenlehrling | „Zwei Jahre habe ich bei Meisterin Ysolde gelernt. Wenn ich etwas zeichnen oder vermessen soll, weiß meine Hand, was zu tun ist.“ | Perle 1 und 3: Zeichnen und Vermessen (Verstand +1); Orwin kennt dich; Perle 2: Kontakte |
| Schiffsjunge | „Ich fahre auf der Seemöwe von Kapitänin Rhea. Ich kenne jedes Tau und jeden Knoten, und in der Takelage klettere ich wie andere auf einer Treppe.“ | Perle 1: Seemannsknoten; Perle 2: Nerelle kennt dich; Perle 7: Rhea segelt selbst, Seeweg immer offen |

**Lücke geschlossen (Story-Chat, 14.10.2026):** drei Möglichkeiten „(Reisender) …“ – Perle 4: alter Viehpfad an der Brücke vorbei; Perle 5: das Maultier an der Stromschnelle beruhigen, wie Maren es gezeigt hat; Perle 7: Ziegenpfad um die Wachhütte an der Ziegenstiege. Ursprünglicher Hinweis: Der **Reisende** hatte in allen sieben Perlen keine einzige eigene Möglichkeit, obwohl der Text (und `docs/regeln.md`) Pfade abseits der Karten verspricht. Passende Stellen wären z. B. Perle 4 (Weg über die Weiden, Gnollenschlucht finden), Perle 5 (Treidelpfad) oder Perle 7 (Wolfspfad, Ziegenstiege). Zwei bis drei Optionen „(Reisender) …“ würden reichen. Auch das **Volk** spielt nach dem Intro kaum noch eine Rolle (nur Borrik und Grumak) – das ist in Ordnung, die Texte versprechen dort nichts weiter.

Die „besonderen Möglichkeiten“ stehen nicht im Buch. Sie sind nur zur Kontrolle hier, damit der Text zu dem passt, was die Geschichte anbietet.

## 4. Erlebtes (Einträge)

**Woher die Einträge kommen:** aus der Story. `# tagebuch: <Titel>` beginnt einen Eintrag (Abschnitt 7 der Story-Konventionen). Derzeit gibt es 17 solcher Stellen: am Ende jeder Perle, dazu Zwischeneinträge wie „Die erste Seite“, „Grisk und die Erzmarke“, „Tickworts Kompass“, „Das Erwachen“, „Niemandes Mantel“, die Gilden und „Das Register“.

**Aufbau:** Der Technologie-Chat hat dazu parallel einen Vorschlag gemacht (`docs/story-konventionen.md`, Abschnitt 7, 14.10.2026), den dieser Entwurf übernimmt:
- **Tagebuchseite** – einmal am Ende jeder Perle (mit `# bild: tagebuch/...`): Skizze, Bildunterschrift „Du zeichnest …“, darunter die **Handschrift** der Spielfigur.
- **Erinnerung** – ein besonderer Moment mitten in einer Perle (Grisk, Kompass, Erwachen, Gildenbeitritt) zum Nachlesen.
- Markierung in der Story mit `# handschrift` (ab hier Handschrift) und `# tagebuch_ende` (Ende des Eintrags), damit „Kraftfunken: …“ und das Level-Up nicht hineinrutschen.

Ergänzend schlägt dieser Entwurf vor:
- Die Einträge stehen **nach Perlen geordnet**, jede Perle ist ein Kapitel mit ihrem Namen als Überschrift („Die Hafenstadt“, „Am Fluss der Räder“ …).
- **Entscheidungen** stehen nicht als Liste im Buch, sondern in der Handschrift („Ich habe die Funken freigelassen.“). Das passt zur Regel, dass das Weltgedächtnis nie als Daten angezeigt wird.

## 5. Karte

Wie festgelegt (13.10.2026): Grundkarte plus Ortsskizzen, Siegel für Einträge, Umschalter Meridel/Lysmara, „hier bin ich“. Keine Änderungen.

## 6. Taschen (entschieden 14.10.2026)

**Umgesetzt in `story/tagebuch.ink`:** `taschen_liste()` (alle IDs in Buchreihenfolge), `tasche_status(id)` (0 nicht da, 1 dabei, 2 abgegeben → durchgestrichen), `tasche_name(id)` und `tasche_text(id)` (Textausgabe). Der Player ruft sie mit `story.EvaluateFunction(name, [id], true)` auf und nimmt `output`. `npm test` prüft in 200 Durchläufen, dass jeder vorhandene Gegenstand Name und Text hat. Die Tabelle unten ist der ursprüngliche Entwurf; die verbindlichen Sätze stehen in der Ink-Datei.

Eine Doppelseite mit kleinen Kohleskizzen der Gegenstände, je mit einem Satz in Handschrift. Ein Gegenstand erscheint, sobald die Spielfigur ihn hat, und verschwindet, wenn sie ihn abgibt (dann durchgestrichen mit einem Satz, z. B. Herzsplitter: „Zurück im Herz des Berges.“).

| Gegenstand | Variable | Satz (Beispiel) |
|---|---|---|
| Silberlinge | `silber` | Die Anzahl, in Handschrift neben einem kleinen Beutel |
| Tickworts Kompass | `kompass` | „Er zeigt nicht nach Norden. Er zeigt nach Hause.“ |
| Erzmarke | `erzmarke` | „Von Grisk. Öffnet Türen unter dem Berg.“ |
| Quelle | `quelle` + `element` | Glutlaterne / Wasserschlauch / Erdbeutel (Wind braucht keine) |
| Der Brief | `brief_erhalten`, `brief_uebergeben` | „Für den Ersten, der mir dasselbe Zeichen zeigt.“ |
| Gildenzeichen | `gilde` | je Gilde |
| Plakette der Waage | `magie_registriert == "waage"` | „Eine Nummer. Mehr bin ich für sie nicht.“ |
| Gnollstein | `gnollstein` | „Von Ashka. Jeder Gnoll sieht: Freund.“ |
| Herzsplitter | `herzsplitter`, `herz_beruhigt` | „Er summt.“ |
| Singende Lampe | `singlampe` | „Von Mirk. Sie brennt auch im Grauen.“ |
| Goldknopf | `goldknopf_gefunden` | „Von einer grünen Samtjacke.“ |
| Tickworts Pfeife, Grumaks Ring, Fesks Päckchen | `tickwort_pfeife`, `grumak_ring`, `fesk_auftrag` | Perle 7 |

Das Seil der Bezugsperson hat jetzt die Variable `seil` (Perle 7).

**Skizzen:** Prompts für alle Gegenstände in `docs/art/tagebuch/taschen/` (14.10.2026), Auftrag T1.

## 7. Menschen (entschieden 14.10.2026)

**Umgesetzt in `story/tagebuch.ink`:** `menschen_liste()`, `mensch_bekannt(id)`, `mensch_name(id)`, `mensch_text(id)` – 26 Figuren (seit 14.10.2026 auch Ole, Pip, Jaro, Brina aus der Verlängerung), die Texte ändern sich mit der Geschichte (z. B. Seraphine, Strell, der Fremde → Ithren). Ob man jemanden kennt, ergibt sich aus vorhandenen Variablen und daraus, ob eine Szene gespielt wurde; neue Variablen waren nicht nötig. Tickwort trägt sich in Perle 1 selbst als Ersten ein.

Skizze und ein Satz in Handschrift, z. B. Grisk: „Kobold. Vergisst nicht.“ Die Seite zeigt nur, **wen** man kennt, nie, wie gut man sich versteht (Ruf und Beziehungen bleiben unsichtbar, Entscheidung 13.10.2026). Der Satz kann sich aber mit der Geschichte ändern (Seraphine: erst „Die Frau in Schwarz auf der Tribüne.“, nach Perle 6 „{freund()}s Mutter.“). Das braucht pro Figur eine „getroffen“-Variable; viele gibt es schon (`freund_getroffen`, `yrsa_getroffen`, `strell_getroffen`, `jorrit_getroffen`, `talin_getroffen` …), einige fehlen.

**Skizzen:** Prompts für alle Figuren in `docs/art/tagebuch/menschen/` (14.10.2026), Auftrag T2.

## 8. ~~Fragen~~ (entfällt, Pasco 14.10.2026)

Die Spielfigur schreibt schon jetzt Fragen in ihre Einträge („Wer sind die Stillen?“). Diese Fragen könnten auf einer eigenen Seite stehen und **abgehakt** werden, wenn die Geschichte sie beantwortet. Für Kinder ist das ein Ziel-Kompass ohne Questlog-Gefühl. Umsetzung in der Story: `# frage: stille | Wer sind die Stillen?` und später `# antwort: stille`. Etwa 8–12 Fragen im ganzen Abenteuer.

## 9. Tickworts Erklärung (Perle 1) – eingebaut 14.10.2026

In `story/perle-1/tickwort.ink`, Stitch `buch`, mit den fünf Laschen (als Unterpunkte „drei a“ bis „drei e“, weil das Buch Tickworts dritter Punkt ist). Er hat sich selbst schon als Ersten unter „Menschen“ eingetragen. Ursprünglicher Entwurf mit sechs Laschen:

> „Drittens.“ Tickwort öffnet eine Klappe in seinem Bauch und zieht ein kleines, in Leder gebundenes Buch hervor, dazu einen Kohlestift. „Ich trage immer ein leeres Buch bei mir. Für den Fall, dass jemand etwas aufschreiben möchte.“ Er seufzt. „Niemand möchte je.“
>
> Er drückt dir beides in die Hand und tippt mit der Zange auf die Laschen am Rand.
>
> „Das Buch hat Unterpunkte. Ich liebe Unterpunkte. Erste Lasche: **Ich**. Wer du bist und was du kannst. Zweite Lasche: **Erlebtes**. Was dir passiert ist und was du entschieden hast. Dritte Lasche: **die Karte**. Wo du warst. Vierte: **Taschen**. Was du bei dir trägst. Fünfte: **Menschen**. Wen du kennst. Sechste: **Fragen**. Was du noch nicht weißt.“ Er macht eine Pause. „Die sechste wird am schnellsten voll. Das ist bei allen so.“
>
> „Schreib auf, was du erlebst. Und zeichne, wo du warst. Eine Karte, die man selbst gezeichnet hat, vergisst man nie.“

## 10. Offen zur Entscheidung (Pasco)

1. ~~Welche Bereiche?~~ **Entschieden 14.10.2026:** Ich, Erlebtes, Karte, Taschen, Menschen.
2. ~~Die Tags `# handschrift` und `# tagebuch_ende`~~ – **entschieden und eingebaut 14.10.2026** (Pasco; vom Technologie-Chat in alle 17 Einträge gesetzt, siehe `story-konventionen.md` Abschnitt 7).
3. ~~Texte „Was ich gut kann“~~ **bestätigt 14.10.2026** (Pasco).
