# Das Tagebuch – Entwurf

**Vorschlag von Claude, 14.10.2026.** Grundlage: Entscheidungen zum Art-Style (Tagebuch-Skizzen, Karte als Tagebuchseite), der abgenommene Charakterbogen-Entwurf (Stand 13.10.2026), die Karte aus Teilen (`docs/art/karten/README.md`), `docs/story-konventionen.md` und Pascos Idee aus dem Handy-Chat (`docs/ideen.md`). Was hier **Vorschlag** heißt, ist noch nicht entschieden.

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
| **Taschen** | Was die Spielfigur bei sich trägt, als kleine Skizzen mit einem Satz | sobald der erste Gegenstand da ist (Kompass oder Erzmarke, Perle 1) | **Vorschlag** |
| **Menschen** | Wen die Spielfigur getroffen hat: Skizze und ein Satz, **ohne** Werte für Beziehungen | ab Perle 1 | **Vorschlag, optional** |
| **Fragen** | Offene Fragen und Ziele in der Handschrift der Spielfigur („Wer sind die Stillen?“), abgehakt, wenn beantwortet | ab Perle 1 | **Vorschlag, optional** |

Für die Beta reichen **Ich, Erlebtes, Karte**. Taschen, Menschen und Fragen machen das Buch reicher, kosten aber Arbeit in Story und Player.

## 3. Ich (Charakterbogen)

Wie im abgenommenen Entwurf. Neu ist nur der Text für **„Was ich gut kann“**: ein Satz zum Volk und ein bis zwei Sätze zum Hintergrund, in der Ich-Form, als Handschrift.

### Volk
| Volk | Text | Bonus |
|---|---|---|
| Mensch | „Ich lerne schnell und finde mich überall zurecht. In jeder Stadt finde ich jemanden, der mir weiterhilft.“ | +1 nach Wahl |
| Zwerg | „Ich bin stark und stur wie der Fels. Was ich einmal festhalte, lasse ich nicht mehr los.“ | +1 Kraft |
| Gnom | „In meinem Kopf drehen sich immer Zahnräder. Für jedes Problem fällt mir eine Idee ein, meistens sogar zwei.“ | +1 Verstand |
| Ork | „Ich bin laut, und das ist gut so. Wenn ich rede, hören die Leute zu.“ | +1 Ausstrahlung |
| Troll | „Ich bin größer als die meisten und trotzdem schneller. Niemand rechnet damit, wie flink ich bin.“ | +1 Geschick |

### Hintergrund
| Hintergrund | Text | Besondere Möglichkeiten in der Geschichte |
|---|---|---|
| Reisende/r | „Ich bin mit Maren über viele Straßen gezogen. Ich kenne Wege, die auf keiner Karte stehen, und kann überall schlafen.“ | – |
| Schausteller/in | „Ich bin bei den Funkelnden Narren aufgewachsen. Ich kann jonglieren, Grimassen schneiden und ein ganzes Publikum zum Lachen bringen.“ | eine Vorstellung geben |
| Straßenkind | „Ich kenne jede Gasse in Lysmara, jedes Dach und jeden Keller. Mutter Kessel sagt, ich finde überall einen Weg hinein. Und wieder hinaus.“ | über die Dächer, die Gewölbe, Abkürzungen |
| Botenläufer/in | „Ich bin schnell, und ich kenne jeden Torwärter beim Namen. Meister Holm sagt, im ganzen Botenhaus läuft keiner schneller als ich.“ | Abkürzungen, Kontakte, „Eilzustellung kostet extra“ |
| Kartografenlehrling | „Ich zeichne, was andere übersehen. Meisterin Ysolde sagt, jede Karte erzählt eine Geschichte, wenn man genau hinsieht.“ | Kontakte |
| Schiffsjunge | „Ich kenne jedes Tau und jeden Knoten an Bord der Seemöwe. Kapitänin Rhea sagt, ich habe Seebeine.“ | Seemannsknoten; Kapitänin Rhea segelt im Finale selbst |

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

## 6. Taschen (Vorschlag)

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

**Fehlt in der Story:** Das Seil der Bezugsperson (Perle 7) hat noch keine Variable. Das wäre eine Zeile.

## 7. Menschen (Vorschlag, optional)

Skizze und ein Satz in Handschrift, z. B. Grisk: „Kobold. Vergisst nicht.“ Die Seite zeigt nur, **wen** man kennt, nie, wie gut man sich versteht (Ruf und Beziehungen bleiben unsichtbar, Entscheidung 13.10.2026). Der Satz kann sich aber mit der Geschichte ändern (Seraphine: erst „Die Frau in Schwarz auf der Tribüne.“, nach Perle 6 „{freund()}s Mutter.“). Das braucht pro Figur eine „getroffen“-Variable; viele gibt es schon (`freund_getroffen`, `yrsa_getroffen`, `strell_getroffen`, `jorrit_getroffen`, `talin_getroffen` …), einige fehlen.

## 8. Fragen (Vorschlag, optional)

Die Spielfigur schreibt schon jetzt Fragen in ihre Einträge („Wer sind die Stillen?“). Diese Fragen könnten auf einer eigenen Seite stehen und **abgehakt** werden, wenn die Geschichte sie beantwortet. Für Kinder ist das ein Ziel-Kompass ohne Questlog-Gefühl. Umsetzung in der Story: `# frage: stille | Wer sind die Stillen?` und später `# antwort: stille`. Etwa 8–12 Fragen im ganzen Abenteuer.

## 9. Tickworts Erklärung (Perle 1) – Entwurf, noch nicht eingebaut

Wird erst eingebaut, wenn die Bereiche entschieden sind (Beschluss 13.10.2026). Entwurf für den Fall, dass alle sechs Bereiche kommen; Teile fallen weg, wenn Pasco Bereiche streicht:

> „Drittens.“ Tickwort öffnet eine Klappe in seinem Bauch und zieht ein kleines, in Leder gebundenes Buch hervor, dazu einen Kohlestift. „Ich trage immer ein leeres Buch bei mir. Für den Fall, dass jemand etwas aufschreiben möchte.“ Er seufzt. „Niemand möchte je.“
>
> Er drückt dir beides in die Hand und tippt mit der Zange auf die Laschen am Rand.
>
> „Das Buch hat Unterpunkte. Ich liebe Unterpunkte. Erste Lasche: **Ich**. Wer du bist und was du kannst. Zweite Lasche: **Erlebtes**. Was dir passiert ist und was du entschieden hast. Dritte Lasche: **die Karte**. Wo du warst. Vierte: **Taschen**. Was du bei dir trägst. Fünfte: **Menschen**. Wen du kennst. Sechste: **Fragen**. Was du noch nicht weißt.“ Er macht eine Pause. „Die sechste wird am schnellsten voll. Das ist bei allen so.“
>
> „Schreib auf, was du erlebst. Und zeichne, wo du warst. Eine Karte, die man selbst gezeichnet hat, vergisst man nie.“

## 10. Offen zur Entscheidung (Pasco)

1. Welche Bereiche kommen ins Buch? Mindestens Ich, Erlebtes, Karte; dazu Taschen, Menschen, Fragen?
2. Die Tags `# handschrift` und `# tagebuch_ende` (Vorschlag Technologie-Chat): einverstanden? Dann baut der Story-Chat sie in alle 17 Einträge ein.
3. Passen die Texte für „Was ich gut kann“?
