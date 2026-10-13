# Szenenbilder Perle 1 – Die Hafenstadt

Ausgearbeitet von Claude am 12.10.2026, nachdem Pasco und sein Sohn Perle 1 durchgespielt haben.
Die lokale Sitzung arbeitet die Bilder in der Reihenfolge aus `docs/auftraege.md` ab.

## Was für alle Bilder gilt
- **Ich-Perspektive** aus Augenhöhe eines etwa zwölfjährigen Kindes. Von der Spielfigur ist **nichts** zu sehen: keine Hände, Arme, Füße, kein Schatten, kein Spiegelbild (`docs/art/art-style.md`).
- **Figuren** sehen aus wie in `docs/worldbuilding/figuren-aussehen.md`. Bei jedem Bild steht, welche Referenzbilder mitgegeben werden. Szenenzustände (nass, Blätter im Haar …) stehen nur im Szenen-Prompt.
- **Orte** liegen so, wie es `docs/worldbuilding/karte-meridel.md` festlegt: Das Meer ist im Westen, die Berge im Osten, und die Sonne geht über dem Meer unter.
- **Keine lesbare Schrift** im Bild. Schilder, Aushänge und Bücher bleiben leer oder unleserlich verwischt. Echte Texte kommen später aus der App.
- **Format:** 1536 × 1024 (quer), FLUX.2 klein, je Bild 4–6 Seeds, das beste auswählen.
- **Ebenen:** *Szene* = vollflächig gemalt. *Entdeckung* = gemalte Mitte, die Ränder lösen sich in Bleistiftskizze und Farbspritzer auf. *Tagebuch* = Kohle-/Bleistiftskizze auf Papier, wie vom Kind selbst gezeichnet.
- **Die Spirale** (Zeichen des Fremden, `docs/art/requisiten/spiralsiegel.png`) ist in drei Bildern als kleines Suchspiel versteckt (unten mit 🔍 markiert). Wenn das Modell sie nicht sauber hinbekommt, lieber weglassen und später in Krita von Hand einsetzen.
- **Varianten** hängen am Tag mit Bindestrich: `szene/bezugsperson-packt` → `szene-bezugsperson-packt-<hintergrund>.png`, `figur/freund` → `figur-freund-liora.png` / `-cassian.png`. Die App wählt später die passende Variante.
- **Dateinamen:** Tag mit `-` statt `/`, z. B. `szene/hafen-kran` → `docs/art/szenen/perle-1/szene-hafen-kran.png`. Die Prompts liegen daneben als `.prompt.txt`.

---

## 1. `szene/lysmara-abend` – Lysmara zwischen Bergen und Meer
**Ebene:** Entdeckung · **Moment:** allererstes Bild des Spiels, noch vor der ersten Entscheidung.
**Aussage:** „Lysmara liegt zwischen den Bergen und dem Meer wie eine Perle in einer Muschel.“ Die ganze Welt der ersten Perle auf einen Blick und das Gefühl, dass hinter der Bergwand etwas wartet.
**Blick:** von einem hohen Dach in der Oberstadt nach Süden über die Stadt. Links (Osten) die graue Wand des Kharvan-Kamms mit **einer einzigen Kerbe**, dem Nyrrspalt. Rechts (Westen) das Meer, die Sonne steht tief über dem Wasser. Dazwischen Dächer, Rauchfahnen, die runde Hafenbucht mit Masten und Dampfkran, der Orin mit großen Wasserrädern am Stadtrand, dahinter grüne Weiden.
**Licht:** goldener Abend, warme Fenster, die Berge kühl und blaugrau.
**Referenzen:** keine (später kann `docs/art/karten/lysmara-lagevorlage.png` helfen, wenn die Anordnung nicht stimmt).

## 2. `szene/sonnenuntergang-hafen` – Der Abend am Hafen
**Ebene:** Szene · **Moment:** „Die Sonne versinkt hinter dem Meer und färbt die Segel im Hafen orange. Die Glocken der Ratshalle schlagen zur siebten Stunde.“ Direkt danach wählt der Spieler den Ort des Abends (Kai, Feuer, Dächer, Gewölbe), deshalb zeigt das Bild keinen davon allein, sondern die Stimmung.
**Blick:** vom Nordkai über das Hafenbecken nach Südwesten. Rechts das offene Meer mit der Sonne halb im Wasser, in der Mitte Segelschiffe mit orange leuchtenden Segeln und Möwen. Links der Bogen der Stadt am Südkai, darüber in der Ferne der Turm der Ratshalle, in dem eine Glocke schwingt.
**Licht:** tiefe orange Sonne, lange Spiegelung auf dem Wasser, erste Laternen.
**Referenzen:** Ortsbild Hafen (`docs/art/orte/hafen.png`).

## 3. `szene/bezugsperson-packt` – Die Bezugsperson packt hastig (6 Varianten)
**Ebene:** Szene · **Moment:** Die Spielfigur kommt nach Hause. Die Bezugsperson stopft einen Mantel, einen Kanten Brot und ein zusammengerolltes Seil in eine Tasche und zuckt zusammen, als sie die Spielfigur sieht. Sie versucht zu lächeln, und es misslingt.
**Aussage:** Etwas stimmt nicht. Ein vertrauter Mensch hat Angst.
**Blick:** von der Tür in den Raum. Die Bezugsperson steht halb zum Betrachter gedreht an einem Tisch oder einer Truhe, die Tasche offen, und blickt erschrocken und bemüht lächelnd zum Betrachter. Draußen am Fenster der erste Regen.
**Licht:** eine Öllampe oder Kerze, warme Mitte, dunkle Ecken.
| Variante | Figur (Referenz) | Ort |
|---|---|---|
| `-reisender` | Maren | enge Kammer im Gasthaus Zum Rostigen Anker: Holzbalken, schmales Bett, ihr großer Kraxenrucksack in der Ecke |
| `-schausteller` | Bonifaz | im bunt bemalten Wohnwagen der Funkelnden Narren: Kostüme an Haken, Jonglierkeulen, kleine runde Fenster |
| `-strassenkind` | Mutter Kessel | Garküche am Fischmarkt nach Feierabend: großer Kupferkessel auf dem erloschenen Herd, Schüsseln, Kräuterbündel |
| `-botenlaeufer` | Meister Holm | Schlafkammer über dem Botenhaus: Postsäcke, Fächer mit Briefen, ein Haken mit Botentaschen |
| `-kartografenlehrling` | Meisterin Ysolde | Werkstatt der Weiten Feder: Kartenrollen, Tintenfässer, ein halb fertiges Küstenblatt auf dem Tisch |
| `-schiffsjunge` | Kapitänin Rhea | Kapitänskajüte der Seemöwe: niedrige Decke, Seekarten, Messinglaterne, Heckfenster mit Hafenlichtern |

## 4. `szene/fremder-im-regen` – Der Fremde unter dem Torbogen
**Ebene:** Szene · **Moment:** Die Spielfigur sucht unter dem Torbogen des Alten Zollhauses Schutz vor dem Regen. Im Schatten steht der Fremde und hält ihr einen Brief hin. „Du siehst aus wie jemand, der Wege kennt.“
**Aussage:** Geheimnis, nicht Bedrohung. Er ist ruhig und beinahe freundlich, und trotzdem stellen sich einem die Nackenhaare auf.
**Blick:** unter einem großen, alten Steinbogen. Der Fremde steht zwei Schritte entfernt im Schatten und streckt die Hand im grauen Handschuh mit dem Brief zum Betrachter aus. **Das dunkelgrüne Spiralsiegel** ist deutlich zu sehen und fängt das Licht. Hinter ihm dunkle nasse Gasse, Regenschnüre im Laternenlicht.
**Figur:** wie im Grundaussehen, dazu als Szenenzustand: **Mantel nass vom Regen**, der Brief in der Hand. Gesicht im Schatten der Kapuze, nur Kinn und Mund schwach zu sehen, die Augen **schimmern** silbrig wie Mondlicht auf Wasser und leuchten nicht.
**Licht:** eine einzelne Laterne am Torbogen, kaltes Blaugrau, Regen glänzt.
**Referenzen:** `fremder-einzel` (die abgenommene Fassung), `requisiten/spiralsiegel.png`.

## 5. `szene/eintreiber-fesk` – Fesk vor der Tür
**Ebene:** Szene · **Moment:** Die Spielfigur kommt durchnässt zurück, vor der Tür wartet Fesk. Er schlägt sein dickes Buch auf: „Vierzig Silbermark.“
**Aussage:** kühle, höfliche Gefahr. Er ist nicht böse, aber unerbittlich.
**Blick:** leicht von unten, denn Fesk ist ein Erwachsener und steht eine Stufe höher vor einer dunklen Holztür. Er hält das dicke Buch offen in der einen Hand und den Federkiel in der anderen und mustert den Betrachter über seine lange Nase hinweg. Auf dem Kragen glänzt die kleine Silbermünze des Silbermark-Kontors.
**Szenenzustand:** Regentropfen auf seinem Mantel, er steht aber unter dem Vordach und ist kaum nass.
**Licht:** Laterne über der Tür, kühles Silber, Nacht.
**Referenzen:** `fesk-einzel`.

## 6. `szene/nordkai-kisten` – Die Kisten am Nordkai
**Ebene:** Szene · **Moment:** Nachts, der Regen lässt nach. Söldner der Goldenen Waage laden Kisten auf Karren. Einem rutscht eine Kiste aus der Hand, der Deckel springt auf, und eine Glaskugel mit einem gefangenen Blitz rollt über das nasse Pflaster.
**Aussage:** Hier passiert etwas, das niemand sehen soll.
**Blick:** aus einem Versteck zwischen Fässern, dicht über dem Boden. Im Vordergrund rollt die **Glaskugel** (so groß wie ein Apfel, darin ein zuckender weißblauer Blitz) über das glänzende Pflaster auf den Betrachter zu. Dahinter ein Lagerhaus, schwankende Laternen, zwei Pferdekarren mit Kisten, die Pferde schon in Richtung der fernen Berge angespannt. Vier oder fünf Söldner in langen schwarzen Mänteln mit der goldenen Waage auf der Brustplatte, einer greift erschrocken nach der Kugel, ein anderer zischt ihn an.
**Licht:** Laternen in warmem Gelb, das kalte Blau des Blitzes spiegelt sich in den Pfützen.
**Referenzen:** `soeldner-waage-einzel`, `requisiten/glaskugel-blitz.png`.

## 7. `szene/morgen` – Die Möwe am Fenster
**Ebene:** Szene · **Moment:** „Du wachst auf, weil draußen eine Möwe kreischt, als ginge es um ihr Leben.“ Gleich danach zeigt sich, welcher Auslöser die Spielfigur auf die Reise schickt.
**Aussage:** ein neuer Tag, scheinbar friedlich, mit einem Rest Unruhe.
**Blick:** vom Kissen aus zum kleinen Fenster. Auf dem Fensterbrett eine Möwe mit weit aufgerissenem Schnabel. Draußen Dächer und ein Streifen Meer im Morgenlicht, Regentropfen trocknen auf der Scheibe. Im Raum nur eine Decke im Vordergrund (ohne Körper darunter erkennbar) und ein einfacher Hocker. Der Raum ist neutral gehalten, weil er je nach Hintergrund ein anderer ist.
**Licht:** frisches, kühles Morgenlicht, ein Sonnenstrahl auf dem Fensterbrett.
**Referenzen:** keine.

## 8. `szene/zwirbelgasse` – Die Gasse der Gnomenwerkstätten
**Ebene:** Entdeckung · **Moment:** der kürzeste Weg zum Markt. „Hier riecht es nach Öl und heißem Metall, und aus jedem Fenster tickt, rattert oder pfeift es.“
**Aussage:** Willkommen bei den Gnomen. Alles ist präzise, ordentlich und voller Maschinen.
**Blick:** die enge, leicht ansteigende Gasse hinauf. Zu beiden Seiten schmale Werkstätten mit Schaufenstern voller Zahnräder, Uhren und kleiner Automaten, aus Rohren pufft Dampf, über der Gasse hängen Leitungen und kleine Seilbahnen für Werkzeuge. Ein, zwei Gnome bei der Arbeit. Rechts vorn die Werkstatt **Pimpelgrund & Zahnrad** mit runder grüner Tür und leerem Schild.
**🔍 Spirale:** klein in einen Holzbalken über einer Tür eingeritzt.
**Licht:** Vormittag, Sonnenstreifen fallen schräg in die Gasse, Dampf leuchtet darin.
**Referenzen:** keine. Das Bild dient danach als Ortsbild für Bild 9.

## 9. `figur/tickwort` – Tickwort fliegt raus
**Ebene:** Szene · **Moment:** „Etwas fliegt in hohem Bogen auf die Gasse, kullert über das Pflaster und bleibt direkt vor deinen Füßen liegen.“ Tickwort liegt auf dem Rücken oder halb auf der Seite und stößt ein empörtes Dampfwölkchen aus.
**Aussage:** der erste Auftritt des Begleiters. Er soll komisch und liebenswert sein, ein bisschen würdevoll trotz allem.
**Blick:** schräg nach unten aufs Pflaster (die Füße des Betrachters sind nicht im Bild). Tickwort liegt mitten im Bild, sein großes Glasauge stellt sich surrend auf den Betrachter scharf, eine Zange hebt er empört Richtung Tür. Im Hintergrund die runde grüne Tür von Pimpelgrund & Zahnrad, die gerade zuknallt, eine kleine Staubwolke.
**Referenzen:** `tickwort-einzel`, Ortsbild `szene-zwirbelgasse`.

## 10. `szene/hafen-kran` – Grisk im Netz
**Ebene:** Szene · **Moment:** Ein Seil am Dampfkran reißt. Das Netz schwingt herum, und der Kobold Grisk baumelt darin hoch über dem Hafenbecken. „Grisk schwimmt wie Stein!“ Am Kai lachen Hafenarbeiter.
**Aussage:** Jemand braucht Hilfe, und alle anderen lachen. Was tust du?
**Blick:** vom Kai aus leicht nach oben. Der dampfende Messingkran mit Ausleger, ein gerissenes Seil peitscht durch die Luft. Im schwingenden Netz zwischen Erzsäcken hängt **Grisk** kopfüber oder seitlich, klammert sich fest, die Grubenlampe baumelt. Darunter das grüne Hafenbecken und ein flacher Lastkahn mit Säcken. Links am Kai **Hafenmeister Brann**, so breit wie eine Tür, mit erhobener Faust, und dahinter zwei, drei lachende Hafenarbeiter.
**Licht:** heller Vormittag, Möwen, Dampf vom Kran.
**Referenzen:** `grisk-einzel`, `brann-einzel`, Ortsbild `hafen`.

## 11. `szene/weite-feder` – Meister Orwin am Kartentisch
**Ebene:** Szene · **Moment:** Im schmalen, hohen Haus der Weiten Feder blickt Meister Orwin von einem riesigen Kartentisch auf. „Wir zeichnen, was ist. Nicht, was bezahlt wird.“
**Aussage:** ein Ort voller Wissen, staubig, gemütlich und ein bisschen chaotisch.
**Blick:** von der Tür in einen hohen, schmalen Raum. In der Mitte ein riesiger Kartentisch voller Karten, Zirkel, Lineale, Tintenfässer. Dahinter **Orwin**, der über den Tisch zum Betrachter aufschaut, eine Brille auf der Nase, die zweite auf der Stirn, die Finger tintenblau. An den Wänden Regale bis unter die Decke mit Kartenrollen, eine Leiter, ein großes Fenster, durch das man ein Fernrohr auf dem Dach sieht. Die Karten im Bild sind nur Linien, ohne Schrift.
**Licht:** staubiges Sonnenlicht aus dem hohen Fenster, dazu eine Öllampe.
**Referenzen:** `orwin-einzel`.

## 12. `szene/klippen-leuchtturm` – Die Klippen von Ahrn
**Ebene:** Szene · **Moment:** Oben auf den Klippen pfeift der Wind so heftig, dass Tickwort sich festklammert. „Ich wiege elf Pfund! Bei dieser Windstärke ist das eine sehr ernste Angelegenheit!“ Unten donnert das Meer, auf der äußersten Klippe steht der alte Leuchtturm, weiß und schief wie ein abgebrochener Zahn.
**Aussage:** Weite, Wind, Freiheit, und ein Turm, in dem jemand wohnt, der keinen Besuch will.
**Blick:** vom Klippenpfad nach Norden die Küste entlang. Rechts das grasige Hochland mit Ginster, links der Abgrund und die weiße Brandung. Hinten auf der äußersten Klippe der **schiefe weiße Leuchtturm**, im höchsten Fenster eine winzige, kaum erkennbare Gestalt. Vorn rechts klammert sich **Tickwort** mit beiden Zangen an einen Grasbüschel, das Glasauge weit aufgerissen, sein Dampfwölkchen wird waagerecht weggeweht.
**🔍 Spirale:** klein in einen moosigen Felsen am Wegrand geritzt.
**Licht:** heller, windiger Tag, schnelle Wolken, Gischt in der Luft.
**Referenzen:** `tickwort-einzel`, Ortsbild `klippen-von-ahrn`.
**Hinweis:** Die neue Mauer und der halbe Wachturm der Waage gehören **nicht** in dieses Bild. Sie sieht man nur bei einer guten Skizze, und das kommt im Text.

## 13. `szene/markt` – Der Markt von Lysmara und Fink
**Ebene:** Szene · **Moment:** „Der Markt von Lysmara ist ein einziges buntes Durcheinander.“ An einer Ecke lehnt ein Junge mit tief ins Gesicht gezogener Mütze.
**Aussage:** Leben, Farbe, Lärm, und in all dem jemand, der beobachtet.
**Blick:** mitten im Gedränge zwischen den Ständen. Stoffballen in allen Farben, Fischkörbe, Käfige mit Hühnern, ein Tisch mit Gnomen-Spielzeug, das von selbst hüpft (kleine Blechfrösche, ein Aufzieh-Vogel). Händler aller Völker (Menschen, Zwerge, Gnome, ein Troll mit Gewürzsäcken). Rechts im Mittelgrund lehnt **Fink** an einer Hausecke, die Mütze mit dem Zeichen der Leisen Hand tief im Gesicht, und schaut direkt zum Betrachter.
**Licht:** Mittag, bunte Sonnensegel werfen farbige Schatten.
**Referenzen:** `fink-einzel`.

## 14. `szene/stadtwache` – Kontrolle!
**Ebene:** Szene · **Moment:** Auf halbem Weg zum Brunnen versperren zwei Stadtwachen die Gasse. „Kontrolle! Taschen auf!“
**Aussage:** Du trägst ein Päckchen der Diebesgilde, und jetzt wird es eng.
**Blick:** eine schmale Gasse mit Wäscheleinen. Zwei Wachen in meergrünen Waffenröcken mit dem Stadtwappen (Perle in Muschel) stehen nebeneinander und versperren den Weg, die langen Stäbe gekreuzt. Eine streckt fordernd die offene Hand zum Betrachter aus, die andere schaut misstrauisch und hat ein Notizbuch am Gürtel. Am unteren Bildrand rechts schaut **Tickwort** besorgt zu ihnen hoch.
**Licht:** Nachmittag, die Gasse halb im Schatten.
**Referenzen:** `stadtwache-einzel`, `tickwort-einzel`.

## 15. `figur/grumak` – Grumaks Gewürzstand am Brunnen
**Ebene:** Szene · **Moment:** „Grumaks Stand ist nicht zu übersehen.“ Ein rot-goldenes Sonnensegel, Säcke mit Zimt, Pfeffer und Safran, viele davon nur noch halb voll. Grumak, groß wie ein Schrank, röstet Nüsse über einer Kohlenpfanne. Die Luft riecht so stark, dass Tickwort niest.
**Aussage:** ein gutmütiger Riese mit Sorgen, der mehr weiß, als er sagt.
**Blick:** Der Betrachter steht vor dem Stand und schaut **weit nach oben** zu Grumak, denn er überragt alles. Er beugt sich ein wenig vor, eine Augenbraue gehoben, in einer riesigen Hand eine Pfanne mit gerösteten Nüssen über der glühenden Kohlenpfanne. Vor ihm offene Säcke mit leuchtend roten, gelben und braunen Gewürzen, **viele halb leer**. Im Hintergrund der Marktbrunnen.
**Licht:** warmes Licht unter dem rot-goldenen Segel, Glut von unten.
**Referenzen:** `grumak-einzel` (die abgenommene neue Fassung), Ortsbild `marktplatz`.

## 16. `szene/freund-faellt` – Jemand fällt vom Himmel (Varianten Liora / Cassian)
**Ebene:** Szene · **Moment:** Am Rand der Oberstadt knackt über dir ein Ast. Liora bzw. Cassian fällt aus einem Apfelbaum über eine hohe Gartenmauer mitten in den Obstkarren eines Gnomen-Händlers, der gerade vorbeituckert. Äpfel spritzen in alle Richtungen.
**Aussage:** Chaos, Komik, der Beginn einer Freundschaft.
**Blick:** in der Apfelgasse, nach oben zur hohen hellen Gartenmauer, über die ein Apfelbaum ragt. Das Kind ist **mitten im Fall**, Arme und Beine ausgebreitet, ein Ast bricht. Darunter der kleine **Dampfkarren** des Gnoms voller roter Äpfel, der Gnom reißt erschrocken die Arme hoch. Äpfel fliegen auf den Betrachter zu.
**Szenenzustand:** Blätter fliegen mit, ein Ärmel reißt gerade am Ast. Sonst ist die Kleidung sauber und teuer, wie im Grundaussehen.
**Licht:** heller Nachmittag, Rosen an der Mauer.
**Referenzen:** `liora-einzel` bzw. `cassian-einzel`, `gnom-obsthaendler-einzel`, `requisiten/dampfkarren.png`.

## 17. `figur/freund` – „Hallo. Schöner Tag, oder?“ (Varianten Liora / Cassian)
**Ebene:** Szene · **Moment:** Aus dem Apfelhaufen taucht ein Kopf auf: Blätter im Haar, ein zerrissener Ärmel aus feinstem Stoff, ein breites Grinsen.
**Aussage:** Das ist die Figur, die die ganze Geschichte begleiten wird. Sympathisch, frech und furchtlos.
**Blick:** auf Augenhöhe, ganz nah. Kopf und Schultern ragen aus dem Haufen roter Äpfel im Karren, ein Arm stützt sich auf den Karrenrand. **Breites Grinsen**, Blick direkt zum Betrachter.
**Szenenzustand:** Blätter und ein Zweig im Haar, der Ärmel der grünen Samtjacke am Ellbogen eingerissen, ein Grasfleck. Gesicht, Haar und Kleidung sonst genau wie im Grundaussehen, also gepflegt und teuer.
**Licht:** warmes Nachmittagslicht, Blätter schweben noch.
**Referenzen:** `liora-einzel` bzw. `cassian-einzel`. Die alten Bilder `*-nach-sturz.png` **nicht** als Referenz nehmen, dort wirken die Kinder zu jung.

## 18. `entdeckung/ausrufer-ratshalle` – Der Nyrrspalt wird geschlossen
**Ebene:** Entdeckung · **Moment:** Alle Glocken läuten. Auf den Stufen der Ratshalle steht ein Herold im roten Mantel, um ihn im Halbkreis Söldner der Goldenen Waage. „Auf Beschluss des Rates ist der Nyrrspalt ab sofort geschlossen.“
**Aussage:** der Wendepunkt der Perle. Die Tür nach draußen fällt zu.
**Blick:** aus der Menge auf dem Marktplatz zu den breiten Stufen der Ratshalle hinauf. Oben der **Herold**, der ein Pergament entrollt, um ihn ein Halbkreis von sechs bis acht **Söldnern** in schwarzen Mänteln mit goldener Waage. Vorn die Rücken und Köpfe der Menge (Menschen, Zwerge, Gnome, ein großer Ork), erhobene Fäuste, besorgte Gesichter im Profil. Über der Ratshalle der Glockenturm, Tauben fliegen auf. Am rechten Bildrand, klein, unter einem Torbogen im Schatten eine graue Kapuzengestalt.
**🔍 Spirale:** mit Kreide auf den Pfeiler dieses Torbogens gemalt.
**Licht:** später Nachmittag, schräges goldenes Licht, die Söldner wie dunkle Scherenschnitte.
**Referenzen:** Ortsbild `marktplatz`, `herold-einzel`, `soeldner-waage-einzel`.

## 19. `szene/goblin-werkstatt` – Tickwort findet sein Zuhause
**Ebene:** Szene · **Moment:** Bei Knallfunke & Söhne quillt grüner Rauch aus der Tür. Zwei Goblins streiten vor einer qualmenden Maschine, die aussieht wie Kessel, Spinne und Teekanne zugleich. Dann erklärt Tickwort, und die beiden sitzen vor ihm wie Kinder, die ein Märchen hören.
**Aussage:** Abschied, der sich richtig anfühlt.
**Blick:** von der Werkstatttür hinein. Mitten im Raum die **Teekannen-Spinnen-Maschine** auf acht Messingbeinen, aus allen Ritzen quillt grüner Rauch. **Tickwort** steht davor auf einer umgedrehten Kiste, eine Zange erhoben wie ein Lehrer. **Brakka** und **Fitzel** sitzen vor ihm auf dem Boden, mit offenem Mund und leuchtenden Augen. Ringsum Werkbänke voller halbfertiger Maschinen, ein angekokeltes Bücherregal, Zahnräder an der Wand.
**Licht:** grünlicher Rauch, orange Glut aus der Esse, gemütlich und chaotisch.
**Referenzen:** `tickwort-einzel`, `brakka-einzel`, `fitzel-einzel`.

## 20. `tagebuch/perle-1` – Die Tagebuchseite „Die Hafenstadt“
**Ebene:** Tagebuch · **Moment:** Spät in der Nacht zeichnet die Spielfigur Lysmara noch einmal, diesmal genauer, und ganz am Rand den Kharvan-Kamm mit dem Nyrrspalt.
**Inhalt:** Eine aufgeschlagene Doppelseite, gezeichnet mit Kohlestift und ein wenig Wasserfarbe. Zu sehen sind die Küstenlinie mit der runden Hafenbucht, der Dampfkran, die Zwirbelgasse als enge Häuserzeile mit Zahnrad, Knallfunke & Söhne mit Rauchwolke, der Marktbrunnen mit Grumaks Sonnensegel, die Klippen mit dem schiefen Leuchtturm im Norden und am rechten Rand die Zacken des Kharvan-Kamms mit einem schmalen Strich, dem Nyrrspalt. Dazu kleine Randskizzen: Tickworts Gesicht, ein Apfel, eine Möwe.
**Wichtig:** keine Buchstaben oder Wörter (Text kommt aus der App), die Lage wie in `lysmara-lagevorlage.png` (Meer links/Westen).
**Referenzen:** `docs/art/karten/lysmara-lagevorlage.png` (nur für die Anordnung).

## 21. Tagebuch-Skizzen und Karten
| Datei | Wann | Inhalt |
|---|---|---|
| `karte-lysmara-erste-skizze` | `# tagebuch: Die erste Seite` / `# karte: lysmara` | Die allererste Seite: eine ungeübte Kohleskizze, eine Küstenlinie, ein Hafen, ein paar Dächer. „Es ist keine schöne Karte. Aber es ist deine.“ |
| `tagebuch-erzmarke` | `# tagebuch: Grisk und die Erzmarke` | Bleistiftskizze der kleinen dunklen Erzmarke mit eingeritztem Zeichen, daneben ein kleiner Grisk-Kopf mit Grubenlampe |
| `tagebuch-kompass` | `# tagebuch: Tickworts Kompass` | Skizze des aufgeklappten Messingkompasses, die Nadel zeigt zur Seite, ein Dampfring daneben |
| ~~`karte-meridel-perle-1`~~ **entfällt (13.10.2026)** – die Karte setzt der Player aus Grundkarte und Ortsskizzen zusammen, siehe `docs/art/karten/README.md`. | `# karte: kharvan-kamm` | Die Tagebuch-Karte nach Perle 1: Küste, Lysmara, Klippen von Ahrn, Weiden als Strichel, am rechten Rand die Zacken des Kamms mit dem Nyrrspalt. Alles andere bleibt leeres Papier (Nebel des Unbekannten). Anordnung nach `meridel-lagevorlage.png`. |

Die Karten-Tags für einzelne Orte (`# karte: hafen`, `markt`, `brunnen` …) brauchen keine eigenen Bilder: Die App blendet die Orte später auf der Tagebuch-Karte ein.

---

## Erzeugte Bilder (lokale Sitzung, 13.10.2026)

Alle mit `tools/erzeuge-szene.ps1` (liest Größe und Referenzen aus der Kopfzeile der Prompt-Datei), FLUX.2 klein 4B, je 6 Seeds. Dateiname = Name der Prompt-Datei mit `.png`. Übersichten: `uebersicht-1.png`, `uebersicht-2.png`.
Mehrere Referenzbilder funktionieren (getestet mit drei); Szenen mit drei Referenzen brauchen deutlich länger pro Bild.

| Bild | Seed | Bekannte Schwächen |
|---|---|---|
| `szene-lysmara-abend` | 5 | – |
| `szene-sonnenuntergang-hafen` | 6 | Blick leicht von oben; kein Entdeckungs-Rand nötig |
| `szene-bezugsperson-packt-reisender` | 2 | – |
| `szene-bezugsperson-packt-schausteller` | 4 | In drei Seeds stand Bonifaz doppelt im Bild (verworfen) |
| `szene-bezugsperson-packt-strassenkind` | 4 | In mehreren Seeds war Mutter Kessel doppelt (verworfen) |
| `szene-bezugsperson-packt-botenlaeufer` | 6 | – |
| `szene-bezugsperson-packt-kartografenlehrling` | 5 | – |
| `szene-bezugsperson-packt-schiffsjunge` | 5 | – |
| `szene-fremder-im-regen` | 3 | Gesicht sichtbar (entspricht Pascos Wahl vom 13.10.); das Siegel ist sehr groß; er wirkt jung |
| `szene-eintreiber-fesk` | 4 | Fesk wirkt gedrungener als auf dem Referenzbild |
| `szene-nordkai-kisten` | 5 | Fünf statt weniger Söldner; alle Gesichter ähneln sich |
| `szene-morgen` | 6 | – |
| `szene-zwirbelgasse` | 2 | Auf dem Schild ein Knotenzeichen (keine Schrift) |
| `figur-tickwort` | 1 | **Vier Beine statt drei** sichtbar; ein Auge, Zangen und Schornstein stimmen. In den anderen Seeds: Katzenohren, zweites Auge am Bauch |
| `szene-hafen-kran` | 5 | Brann hat Glatze (wie Referenz) |
| `szene-weite-feder` | 2 | Zweite Brille auf der Stirn nur angedeutet; Hände sehr blau |
| `szene-klippen-leuchtturm` | 2 | Im Sand ist eine kleine Spirale zu sehen (passt zum Suchspiel, war aber nicht bestellt) |
| `szene-markt` | 1 (zweite Runde) | Erste Runde: Zeichen auf Finks Mütze sah wie ein ausgestreckter Finger aus, ein Seed zeigte Hände der Spielfigur. Prompt nachgeschärft. Finks Jacke wirkt modern |
| `szene-stadtwache` | 3 | Tickworts Beine nicht im Bild |
| `figur-grumak` | 2 | Hauer zeigen nach oben und sind sehr groß; Größe ohne Vergleichsfigur schwer zu sehen |
| `szene-freund-faellt-liora` / `-cassian` | 5 / 5 | Jacke fast schwarz statt dunkelgrün; Karren mit vier Rädern |
| `figur-freund-liora` / `-cassian` | 1 / 4 | Jacke sehr dunkel; Riss im Ärmel klein; beide wirken eher wie 10 als 12 |
| `entdeckung-ausrufer-ratshalle` | 5 | Kreuz auf dem Turm der Ratshalle; im Vordergrund Hinterköpfe der Menge (keine Spielfigur) |
| `szene-goblin-werkstatt` | 3 | Tickwort und die Teekannen-Maschine sind zu einer Figur verschmolzen (kupferfarben, auf einer Kiste, grüner Qualm) – **sollte neu gemacht werden**, am besten mit getrennter Beschreibung von Maschine und Tickwort |
| `tagebuch-perle-1` | 5 (zweite Runde) | Zweite Runde mit Tickwort als zusätzlicher Referenz, weil er sonst als Menschen-Roboter gezeichnet wurde. Unten rechts ein seltsames Apfel-Vogel-Wesen. Die Anordnung folgt der Lagevorlage nur grob |
| `karte-lysmara-erste-skizze` | 2 | – |
| `tagebuch-erzmarke` | 3 (zweite Runde) | Erste Runde zeigte einen Elfenkopf statt Grisk; mit `grisk-einzel.png` als zweiter Referenz stimmt er |
| `tagebuch-kompass` | 6 (zweite Runde) | Erste Runde zeigte einen Menschen-Roboter; mit `tickwort-einzel.png` als zweiter Referenz stimmt er. Loser Messingring im Bild |

Die Zusätze der zweiten Runde für die drei Tagebuchbilder (zweite Referenz und ein Satz dazu) stehen noch nicht in den Prompt-Dateien.