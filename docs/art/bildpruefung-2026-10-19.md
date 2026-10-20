# Bildprüfung in voller Größe (19.10.2026)

Anlass: Pasco hat im Player Kettrich und Talin mit drei Armen gefunden. Daraufhin hat Claude im Story-Chat alle Szenenbilder (Perle 1–7) und alle Figuren-Einzelbilder in voller Auflösung geprüft. Gemeldet sind nur echte Fehler (Anatomie, sichtbare Spielfigur, Schrift, grobe Abweichung von der Beschreibung). Jeder Fund hat einen englischen Prompt-Vorschlag. Auftrag dazu: `docs/auftraege.md`, Abschnitt „Bildprüfung in voller Größe“.

**Umsetzung (20.10.2026, lokale Sitzung):** Je Fund steht das Ergebnis („neu, Seed …“ oder „behalten, weil …“) im README der jeweiligen Perle im Abschnitt „Bildprüfung 19.10.2026 – umgesetzt am 20.10.2026“; Figuren-Kandidaten in `docs/offene-entscheidungen.md` (Punkt 5).

**Vorrang vor den Prompt-Vorschlägen:** Das Schweigen ist nie Rauch, Dampf oder Nebel – auch kein „thread of smoke“ über einem Lagerfeuer. Zeichen immer vier verschlungene Ringe (Vorlage `requisiten/ringzeichen.png`, notfalls `tools/zeichen-einsetzen.py`). Bei den Wiedersehen-Bildern in Perle 5 ist die halb graue Gesichtshälfte gewollt.

---

## Bildprüfung Perle 1 + Figuren-Einzelbilder (19.10.2026)

Geprüft: `docs/art/szenen/perle-1/*.png` (ohne `uebersicht-*`) und `docs/art/figuren/*-einzel.png`, jeweils als 1152-px-JPG, Details als Vollauflösungs-Ausschnitt.
Nur echte Fehler; Kleinkram (Farben, Stil, kleine Requisiten-Abweichungen) ist nicht gelistet.

### Hoch (muss neu)

- `docs/art/szenen/perle-1/szene-freund-faellt-cassian.png` – **hoch** – Eine dritte, körperlose Hand greift im oberen Drittel rechts der Bildmitte direkt neben Cassians erhobener rechter Hand nach einem Apfel am Zweig. Einen brechenden Ast gibt es auch nicht. (Die Liora-Variante ist sauber.)
  Prompt: *"He has exactly two arms: his right hand grabs a single breaking branch, his left arm flails in the air; no other hands, no other people in the tree."*

- `docs/art/szenen/perle-1/szene-goblin-werkstatt.png` – **hoch** – Es sind drei statt zwei Goblins: Eine dritte Goblin mit Zöpfen sitzt rechts unten halb hinter der Kiste. Alle Goblins sind nackt und haben Schwänze, obwohl Brakka laut Referenz eine Schürze und Fitzel einen Overall trägt; auch Brakka (Mitte, Schutzbrille) hat Zöpfe. Tickwort (3 Beine) und die Maschine sind korrekt.
  Prompt: *"Exactly two goblins and no others: a boy goblin in a scorched leather apron and a girl goblin in a patched work overall, both fully clothed, no tails."*

- `docs/art/figuren/kettrich-einzel.png` – **hoch** – In den Brillengläsern sitzen statt Augen übereinander gestapelte Augäpfel (links 2, rechts 3). Das wirkt wie ein Gesicht mit fünf Augen. Die „drei Linsen pro Auge“ wurden als drei Augen gemalt.
  Prompt: *"He has exactly two normal eyes; in front of each eye a short brass tube holding three stacked glass lenses, the lenses show one magnified eye each, never several eyes."*
  Alternative: *"jeweler's loupe flipped up on the side of his spectacles"* (Lupen hochgeklappt, die Augen bleiben frei).

### Mittel (sollte neu)

- `docs/art/figuren/durgash-einzel.png` – **mittel** – Die zwei Unterkiefer-Hauer fehlen. Stattdessen ragt aus dem rechten Mundwinkel bzw. der Wange ein rosa, hornartiger Zapfen wie eine Pfeife. Der abgebrochene Hauer wurde nicht als Hauer erkannt.
  Prompt: *"Two lower tusks pointing upward from his lower jaw on both sides of his mouth; the left tusk is a short broken stump, nothing else in his mouth."*

- `docs/art/figuren/orwin-einzel.png` + `docs/art/szenen/perle-1/szene-weite-feder.png` – **mittel** – Statt einer zweiten Brille auf der Stirn steckt dort ein winziges Nadel- bzw. Insekt-Ding (oben rechts auf der Stirn). Wirkt wie ein Fremdkörper im Kopf. Die Szene hat den Fehler von der Referenz übernommen; dort sind die Hände außerdem komplett blau wie Handschuhe oder Monsterhände. Zuerst Orwin neu machen, dann die Szene.
  Prompt: *"A second pair of round wire spectacles, the same size as the first, rests pushed up on his forehead in his white hair. Only his fingertips have small ink-blue stains, his hands are skin-colored."*

- `docs/art/figuren/strell-einzel.png` – **mittel** – Das Schwert hat zwei Griffe: Knauf und Griff am Gürtel, dazu eine zweite Parierstange in der Hand hinter dem Rücken. Die Klinge hängt blank herunter statt in einer Scheide.
  Prompt: *"A single sabre fully inside a black leather scabbard hangs from his left hip; both hands are clasped behind his back and do not touch the sabre."*

- `docs/art/figuren/merla-einzel.png` – **mittel** – Der Hirtenstab endet unten in einem Spatenblatt (Mischobjekt, vermutlich wegen „hands as big as shovels“).
  Prompt: Den Ausdruck „shovels“ streichen, also *"very large strong hands"*; dazu *"a plain wooden shepherd's crook with a curved hook at the top and a plain wooden tip at the bottom".*

- `docs/art/figuren/fink-einzel.png` – **mittel** – Die Kleidung ist modern (Jeansjacke, Jeans, Schnürstiefel) statt einer übergroßen, geflickten braunen Jacke. Das Schh-Zeichen auf der Mütze zeigt eine große Faust mit einem erhobenen Finger von hinten, die als Mittelfinger gelesen werden kann (grenzwertig; laut Prompt-Kopf ggf. mit `tools/zeichen-einsetzen.py` ersetzen).
  Prompt: *"An oversized, patched, old-fashioned brown wool jacket with sleeves rolled up, baggy patched trousers, worn leather shoes; no denim, no modern clothes."* Das Zeichen danach per Tool einsetzen.

- `docs/art/szenen/perle-1/figur-grumak.png` – **mittel** – Flammen schlagen direkt aus zwei Gewürzsäcken (unten Mitte und rechts). Es gibt kein Kohlebecken; die Ware scheint zu brennen.
  Prompt: *"A small round iron brazier with glowing coals stands on the counter beside the spice sacks; he holds a long-handled pan over it; the spice sacks are not burning, no flames anywhere except a faint glow in the brazier."*

- `docs/art/szenen/perle-1/szene-klippen-leuchtturm.png` – **mittel** – Tickwort hat hinten mittig unter dem Bauch einen kleinen vierten Beinstummel. Außerdem steht er ruhig, statt sich mit den Zangen am Gras festzuklammern. Das Ringzeichen im Felsen fehlt (optional).
  Prompt: Pose wie bei `figur-tickwort` (sitzt aufrecht) übernehmen: *"he crouches low and hugs a tuft of grass with both pincers; seen from the front, only his two front legs are visible, the third leg is hidden behind his round body."*

- `docs/art/szenen/perle-1/szene-lysmara-abend.png` – **mittel** – Statt einer geschlossenen grauen Bergwand mit genau einer Kerbe (dem Nyrrspalt, der in Perle 4 wieder vorkommt) sind einzelne Gipfel zu sehen. Die Kerbe ist nicht zu erkennen.
  Prompt: *"On the far left horizon one continuous straight grey mountain wall like a fortress wall, all the same height, with a single deep narrow V-shaped notch cut into its middle; no separate peaks."*

- `docs/art/szenen/perle-1/tagebuch-perle-1.png` – **mittel** – Unten rechts auf der rechten Seite sind Apfel und Möwe zu einem Mischwesen verschmolzen: ein Apfel mit Schnabel, Flügel und Beinen. Dazu gibt es vier Brunnen statt einem und keine runde Hafenbucht.
  Prompt: *"In the margins three separate small sketches far apart from each other: an apple (just a fruit), a flying seagull, and the face of a brass automaton."* Ergänzen: *"Only one fountain on the market square."*

- `docs/art/szenen/perle-1/tagebuch-kompass.png` – **mittel** – Links ist eine Metallringbindung zu sehen (Prompt: genähter Lederrücken). Der „Dampfring“ ist ein fester Messingring, der Kompass hat einen Schornstein, und Tickwort hält eine Pinzette, statt zu winken.
  Prompt: *"Bound book with stitched leather spine in the middle, absolutely no spiral or metal rings. The automaton waves with an open empty pincer; a small puff of white steam shaped like a ring floats above him; the compass has no chimney."*

- `docs/art/szenen/perle-1/tagebuch-erzmarke.png` – **mittel** – Ringbindung links (zwei Metallringe), obwohl die Tagebuchseiten einheitlich einen Lederrücken haben sollen.
  Prompt: *"The page is the left page of an open book with a stitched leather spine on its right edge; absolutely no spiral binding, no metal rings."*

- `docs/art/szenen/perle-1/szene-bezugsperson-packt-botenlaeufer.png` – **mittel** – Groß lesbare Schein-Schrift „TAVJK“ auf einem Postsack im Regal links.
  Prompt: *"The mail sacks are plain undyed canvas without any letters, stamps or markings."*

- `docs/art/szenen/perle-1/szene-sonnenuntergang-hafen.png` – **mittel (leicht)** – Schein-Schrift auf dem Kesselgehäuse des Krans vorne links und ein kleines Ladenschild mit Buchstaben dahinter.
  Prompt: *"All signs, boats and machines are blank and unmarked, with no letters or numbers."*

- `docs/art/szenen/perle-1/szene-zwirbelgasse.png` – **mittel (grenzwertig)** – Links hält ein Gnom etwas wie ein Tablet, ein Gnom dahinter blickt auf ein smartphone-artiges Gerät. Für Kinder wirkt das wie modernes Handy/Tablet. Das Ringzeichen ist korrekt.
  Prompt: *"The gnomes carry brass gears, wrenches and small clockwork toys; no flat rectangular devices, no screens."*

- `docs/art/figuren/gnoll-einzel.png` + `docs/art/figuren/ashka-einzel.png` – **mittel (leicht)** – Beide haben große, spitze Wolfs- bzw. Fuchsohren statt runder Hyänenohren und lesen sich als Wolf statt Gnoll. Ashkas eingerissenes Ohr fehlt.
  Prompt: *"Short rounded hyena ears (round like a bear's, not pointed), a sloping back with a short bristly mane, spotted hyena face, not a wolf or fox."*

- `docs/art/szenen/perle-1/szene-eintreiber-fesk.png` – **mittel (leicht)** – Die Tür steht als freistehendes Häuschen im Wald und wirkt wie ein Plumpsklo statt wie eine Haustür. Fesk schaut ins Buch statt auf den Betrachter herab.
  Prompt: *"The front door of a narrow town house in a cobbled street, with house walls and windows left and right; he looks down at the viewer, not at the book."*

- `docs/art/szenen/perle-1/szene-bezugsperson-packt-reisender.png` – **mittel (leicht)** – Regenstriche laufen im Zimmer über linke Wand und Rückwand, als regne es drinnen.
  Prompt: *"Rain only visible outside through the window glass; the room inside is completely dry."*

- `docs/art/figuren/ysolde-einzel.png` – **mittel (leicht)** – Rote Spritzer an Wange und Handrücken wirken wie Blut oder Wunden statt Tinte.
  Prompt: *"Small dark-blue ink smudges on her fingertips only; no red marks on face or hands."*

- `docs/art/figuren/pell-einzel.png` – **mittel (leicht)** – Zwei Bleistifte: einer hinterm Ohr, ein zweiter schwebt ohne Halt über der Schulter.
  Prompt: *"Exactly one pencil, tucked behind his right ear."*

- `docs/art/figuren/mirk-einzel.png` – **mittel (leicht)** – Eine große Schaufel liegt über der Schulter, aber keine Hand hält sie (beide Hände hängen unten).
  Prompt: *"She holds a short miner's shovel resting on her shoulder with her right hand gripping the handle."* Alternativ ohne Schaufel.

- `docs/art/figuren/faehrfrau-einzel.png` – **mittel (leicht)** – Sie hält zwei Stangen: ein kurzes Paddel mit Ringzeichen rechts und eine zweite lange Stange links. Das Ringzeichen selbst ist korrekt.
  Prompt: *"She holds exactly one long punting pole upright with both hands; the ring sign is carved near its top."*

### Ohne echte Fehler

**Szenen (16):** entdeckung-ausrufer-ratshalle (Ringzeichen ok), figur-freund-cassian, figur-freund-liora, figur-tickwort (3 Beine), karte-lysmara-erste-skizze, bezugsperson-packt-kartografenlehrling/-schausteller/-schiffsjunge/-strassenkind, szene-fremder-im-regen (Ringzeichen ok), szene-freund-faellt-liora, szene-hafen-kran, szene-markt (Schh-Zeichen korrekt), szene-morgen, szene-nordkai-kisten, szene-stadtwache.

**Figuren (36):** ambra, bonifaz, borrik, brakka, brann, cassian, dorn, fesk, fitzel, fremder (gewählte Fassung, Vergleichsfigur gewollt), gnom-obsthaendler, gnomenjunge, grisk, grumak, haldor, herold, holm, hulda, jorrit, koboldkind, liora, maren, mutter-kessel, nerelle, ratsherr, rhea, schreiber-waage, seraphine-arvelle, soeldner-waage, stadtwache, talin, tickwort (3 Beine), vael, vater-arvelle, wuk, yrsa.

In keinem Szenenbild ist etwas von der Spielfigur (Hände, Füße usw.) zu sehen.

**Anzahl geprüfter Bilder: 78** (30 Szenen-/Tagebuchbilder Perle 1 + 48 Figuren-Einzelbilder). Davon 3 Bilder hoch, 23 Bilder mittel (davon mehrere „leicht/grenzwertig“), 52 ohne echte Fehler.

---

## Bildprüfung Perle 2 + 3

Basis: `docs/art/szenen/`. `perle-3/szene-tuchhalle-pruefung.png` ausgelassen, weil schon beauftragt.

### Hoch (muss neu)

- `perle-3/szene-morgen-mentor-erde.png` – hoch – Der Zwerg hat **drei Hände**: eine links auf dem Knie, zwei nebeneinander rechts auf dem Felsen (Bildmitte rechts). – *Prompt:* "He has exactly two hands: his left hand rests on his knee and his right hand lies flat on the boulder beside him."
- `perle-3/entdeckung-magiergesetz-cassian.png` – hoch – Am unteren Bildrand (links und Mitte rechts) schweben **geballte Fäuste ohne Körper**. Sie wirken wie die Hände des Betrachters. Außerdem sehen die Zuschauer vorn links und rechts wie Doppelgänger von Cassian aus. – *Prompt:* "The crowd in the foreground is seen only from behind as heads and shoulders, with no raised fists and no hands at the bottom edge; no other child in the crowd resembles the boy on the grandstand."
- `perle-3/entdeckung-magiergesetz-liora.png` – hoch – Derselbe Fehler: Fäuste ohne Körper am unteren Rand. Die zwei Mädchen vorn links und rechts haben dieselben kastanienbraunen Locken wie Liora und wirken wie Doppelgängerinnen. – *Prompt:* Wie bei der Cassian-Variante, mit "no other girl in the crowd resembles the girl on the grandstand".
- `perle-3/tagebuch-perle-3.png` – hoch – Das Zeichen oben rechts zeigt **nur zwei verschlungene Ringe** statt vier, darum stehen **fünf** Figuren statt vier. Außerdem gibt es nur zwei Laternen (blau und rot) statt vier, und der Knopf fehlt. – *Prompt:* "Exactly four small figures around a sign of exactly four interlinked rings in a four-leaf-clover shape; below the grandstand exactly four lanterns in a row: blue, silver, red, gold."

### Mittel (sollte neu)

- `perle-2/szene-erwachen-erde-cassian.png` – mittel – Es **wächst keine Treppe** am Turm hoch. Stattdessen brennt links ein Felshaufen, und der Junge rennt am Boden statt die Treppe herunterzusteigen. Im Feuer links sitzt ein **Kobold mitten in den Flammen**. – *Prompt:* "A rough stone staircase spirals up the side of the smoking wooden tower to its top platform, and the boy is on the upper steps coming down; the fire at the foot is buried under heaped earth, and no one stands in or near any flames."
- `perle-2/szene-erwachen-erde-liora.png` – mittel – Wie bei Cassian: keine Treppe zum Turm, ein brennender Felshaufen, Liora rennt am Boden. – *Prompt:* Wie oben, mit "the girl".
- `perle-2/szene-erwachen-feuer-cassian.png` – mittel – Cassian steht unten in der Schmiedetür statt oben auf der Plattform. Der Arbeiter unten rechts am Boot hat ein **verformtes, tierartiges Gesicht** (Hut und Kopf verschmolzen). – *Prompt:* "The boy stands small on the railed top platform of the drying tower; all workers have normal human faces, and the bottom right corner shows only riverbank."
- `perle-2/szene-erwachen-wasser-cassian.png` – mittel – Der Junge ist **riesig** und sitzt auf dem Schmiededach, statt klein oben auf dem Turm zu sein. Die hausgroße Welle fehlt, es gibt nur eine Gischt. – *Prompt:* "The boy is tiny in the distance on the tower's top platform, much smaller than the smithy; a huge arched wave taller than the tower crashes down over it."
- `perle-2/szene-erwachen-wasser-liora.png` – mittel – Dieselben Fehler wie bei Cassian (riesig, auf dem Dach, keine Welle). Dazu fällt direkt **unter Lioras Beinen ein Wasserstrahl** herab, der unfreiwillig komisch wirkt. – *Prompt:* Wie oben, mit "no stream of water falls near the girl".
- `perle-2/szene-faerberturm-feuer.png` – mittel – Der Turm brennt kaum (vor allem das Schmiededach brennt). Das Kind oben **winkt lächelnd mit gut erkennbarem Gesicht**, statt sich ängstlich ans Geländer zu klammern. – *Prompt:* "Flames climb the lower half of the drying tower itself; the child at the top is a tiny dark silhouette clinging to the railing, no visible face."
- `perle-2/szene-grosse-schmiede.png` – mittel – Mitten in der Schmiedehalle stehen ein Wasserrad, ein Haus, Bäume, Felsen und **ein Boot (unten rechts)**, wie aus dem Ortsbild hineinkopiert. – *Prompt:* "Fully enclosed interior of the smithy hall, no outdoor elements: no river, no boat, no houses or trees inside."
- `perle-2/szene-schmiedekeller.png` – mittel – Senkrechte Eisenstangen an beiden Wänden lassen den Keller wie eine **Gefängniszelle** aussehen; gewollt ist „geheim und sicher“. – *Prompt:* "Iron bars lie stacked flat on the floor in a corner; no bars, gratings or cage-like walls anywhere."
- `perle-2/szene-tuchhalle.png` – mittel – Kettrich trägt eine **normale Brille mit zwei Gläsern** statt drei gestapelter Gläser pro Auge (dasselbe Merkmal, das bei tuchhalle-pruefung nachgebessert wird). – *Prompt:* Brillenbeschreibung aus `szene-tuchhalle-pruefung-brille.prompt.txt` übernehmen oder per Bildbearbeitung genauso nachbessern.
- `perle-3/szene-beitritt-webstuhl.png` – mittel – Derselbe Brillenfehler bei Kettrich: zwei normale Gläser. – *Prompt/Bearbeitung:* Wie oben, mit `szene-tuchhalle-pruefung-brille.prompt.txt`.
- `perle-3/entdeckung-gildentag.png` – mittel – Das schwarze Banner zeigt einen **Anker** statt einer goldenen Waage. Die Waage steht dafür auf einem roten Banner, und die schwarz-goldene Tribüne fehlt (es gibt nur einen Marktstand). – *Prompt:* "The black banner shows a golden two-pan balance scale, not an anchor; a large wooden grandstand draped in black and gold stands on the steps of the town hall."
- `perle-3/szene-brunnen-nacht-cassian.png` – mittel – Cassian **steht im Brunnenbecken** wie in einer Tonne, statt auf dem Rand zu sitzen. – *Prompt:* "The boy sits sideways on the outer stone rim of a wide, low fountain, his legs and shoes visible outside the basin."
- `perle-3/szene-brunnen-nacht-liora.png` – mittel – Derselbe Fehler: Liora steht im Brunnenbecken. – *Prompt:* Wie oben, mit "the girl".
- `perle-3/szene-raum-der-vier.png` – mittel – Das Mosaik zeigt **nur zwei Figuren statt vier**: Stein und Welle fehlen, und die Figuren haben Gesichter. Das Ringzeichen selbst ist korrekt. – *Prompt:* "Exactly four flat mosaic figures, one on each side of the ring sign (top: ochre with stone, right: blue with wave, bottom: red with flame, left: white-grey with feather), faceless silhouettes."
- `perle-3/szene-tickwort-werkstatt.png` – mittel – Rechts stehen **zwei fast gleiche Goblin-Mädchen** (eine Doppelung) statt einem. Die Zettel oben links und rechts sind groß und mit Schein-Schrift bedeckt, die fast wie englische Wörter aussieht. – *Prompt:* "Only one goblin girl, alone at the right; the paper notes are small and covered only with tiny dots and wavy lines, no letter-like shapes."
- `perle-3/szene-zelt-register.png` – mittel – In den Glaskugeln im Regal liegen **Äpfel**; die Kugeln sollen leer sein. – *Prompt:* "The glass orbs on the shelf are completely empty and transparent, nothing inside them, no fruit."

Ohne Befund: entdeckung-raederviertel, bruecke-abend (2), erwachen-feuer-liora, erwachen-wind (2), erzlaende, tagebuch-perle-2, beitritt-feder, beitritt-hand, beitritt-phiole, brunnen-abend (2), gewoelbe-pruefung, gildenlaternen, heimweg-nacht, morgen-mentor-feuer/-wasser/-wind, phiole-pruefung, zelt-der-waage.

**Geprüfte Bilder: 41** (perle-2: 17, perle-3: 24 ohne tuchhalle-pruefung)

---

## Bildprüfung Perle 4 + 5 (19.10.2026)

Nicht gemeldet (bekannt): perle-5/szene-talin.png; Strell verbeugt sich nicht in szene-freund-abgeholt.

### Hoch (muss neu)

- `docs/art/szenen/perle-4/figur-ashka.png` – hoch – Ashka hat **drei Hände**: eine Pfote liegt auf der Brust, dazu je eine Hand auf beiden Knien (Bildmitte unten). – *Prompt:* "She has exactly two arms and two paws: one paw rests on her chest, the other lies on her knee; no third hand."
- `docs/art/szenen/perle-4/szene-ruf-wind.png` – hoch – Links vorn ein **zweiköpfiger Gnoll**: zwei Köpfe teilen sich einen Körper, einen Umhang und ein Beinpaar. Rechts sitzt eine kahle Figur mit dem Gnoll davor verschmolzen auf dessen Rücken. – *Prompt:* "Each gnoll is a separate figure with one head and its own body, standing apart from the others with clear space between them; no figures overlapping or riding on each other."
- `docs/art/szenen/perle-4/szene-ruf-erde.png` – hoch – Das Grau ist eine **senkrechte Rauch-/Dampfsäule** aus dem Steinring statt eines farblosen Landstrichs. Die „Gnolle“ sind kahle Goblins mit Spitzohren und Menschengesichtern. Links sind zwei Figuren ineinander verschmolzen. – *Prompt:* "The grey is not smoke or steam but a part of the hillside that has lost its color, stopped by the rock ring; the gnolls are hyena-like with spotted fur, round ears and hyena snouts, each clearly separate."
- `docs/art/szenen/perle-4/szene-landtor-morgen.png` – hoch – Unten in der Bildmitte ist auf dem Weg der **Schatten des Betrachters** (Kopf und Schultern) zu sehen. Statt einer Bergkette steht hinten eine **Burgmauer mit Türmen**, und die Scharte in den Bergen fehlt. – *Prompt:* "The sun is high enough that no shadow of the viewer falls on the road; far away a range of natural snowy mountains (no walls, no towers, no buildings) with one narrow notch."
- `docs/art/szenen/perle-4/szene-fremder-am-grauen.png` – hoch – Das Grau erscheint als **Nebel/Rauchwolken am Himmel** hinter dem Fremden, und das Gras ist überall grün. Die Grenze zwischen Grün und einem farblosen Feld fehlt. – *Prompt:* "Behind him the grass itself is ash-grey and colorless like an unpainted pencil sketch, with a clear edge to the green grass; the sky is clear, no fog, no smoke, no clouds near the ground."
- `docs/art/szenen/perle-5/szene-herz-des-berges.png` – hoch – Das **Ringzeichen** am Boden ist eine massive Vierpass-/Propellerform mit Loch in der Mitte und keine vier verschlungenen Ringe. Mirk hält eine **elektrische Glühbirne**. Statt einer Kristallkugel schwebt eine Linsenform mit zwei Feuern und ohne weißes Licht, und das sinkende Grau fehlt. – *Prompt:* "On the floor four separate thin stone rings, each overlapping only its two neighbours exactly like the reference ringzeichen.png, not a solid filled shape; the old kobold holds an oil miner's lamp with a flame (no light bulb); the crystal is a round sphere with four lights: brown, blue, red and white."
- `docs/art/szenen/perle-5/szene-der-schlund.png` – hoch – Der **Abgrund fehlt** ganz. Zu sehen ist eine durchgehende Treppe nach oben, auf deren Stufen Wasser spritzt. Auch der schmale Sims und das Zeichen (Strich unter Bogen) fehlen. – *Prompt:* "The staircase ends abruptly at the viewer's feet: a wide black chasm cuts across the whole picture, the stairs only continue on the far side; the water is deep below at the bottom of the chasm, not on the steps."
- `docs/art/szenen/perle-5/entdeckung-orin-treidelpfad.png` – hoch – Das rechte Maultier trägt einen **Kobold-Grubenhelm mit Glocke**, und hinter seinem Hals steckt ein grauer Koboldkopf, mit dem Tier verschmolzen. Die Maultiere laufen auf den Betrachter zu und ziehen nichts. – *Prompt:* "The mules wear only harness and no helmets, walking away from the viewer upstream and pulling taut ropes; the kobolds sit only in the barges, clearly separate from the mules."

### Mittel (sollte neu)

- `docs/art/szenen/perle-4/szene-ruf-wasser.png` – mittel – Rechts sind der alte Schäfer und der Gnoll vor ihm ineinander verschmolzen: Die Beine des Schäfers fehlen, sein Körper geht in den Gnoll über. – *Prompt:* "The shepherd stands apart from the gnolls with his own two legs visible; every figure is clearly separate."
- `docs/art/szenen/perle-4/szene-ruf-feuer.png` – mittel – Die Gnolle haben Menschengesichter, Spitzohren und Bärte und wirken wie Goblins statt wie Hyänen. Das passt nicht zu Ashka und dem Gnollenlager. – *Prompt:* "The gnolls have hyena heads with long snouts, round ears and spotted fur, no human faces."
- `docs/art/szenen/perle-4/szene-nacht-das-schweigen.png` – mittel – Das Feuer brennt hell, statt gerade ausgegangen zu sein. Ein farbloser Bildteil mit klarer Kante ist nicht zu erkennen, die ganze Szene ist gleichmäßig nachtgrau. Statt eines Gnoll-Jungen sind zwei zu sehen, und die Schlafwandler laufen bergab auf den Betrachter zu. – *Prompt:* "The campfire is out, only glowing embers and a thread of smoke; the lower slope keeps its green color while the upper slope is clearly colorless with a visible edge; exactly one gnoll cub; all sleepwalkers walk away from the viewer uphill."
- `docs/art/szenen/perle-4/szene-morgen-danach.png` – mittel – Das linke Tier ist ein **Mischwesen aus Gnoll-Junges und Ziege mit Horn**. Ziegen fehlen, der graue Streifen am Bergfuß fehlt ebenfalls. – *Prompt:* "Exactly one gnoll cub without horns, playing among several separate ordinary goats; a thin ash-grey strip is visible at the foot of the mountains."
- `docs/art/szenen/perle-4/szene-lamm-auf-der-strasse-cassian.png` und `…-liora.png` – mittel – Das Lamm ist fast ganz weiß, die **hintere Hälfte ist nicht farblos-grau**. Außerdem schaut es zum Kind statt starr zu den fernen Hügeln. Das ist der Kern der Szene. – *Prompt:* "The rear half of the lamb, from the middle of its back to its tail and hind legs, is clearly ash-grey like an unpainted pencil sketch; its head faces away from the child towards the distant hills."
- `docs/art/szenen/perle-4/szene-freund-abgeholt-cassian.png` und `…-liora.png` – mittel – Das Kind trägt die Mütze noch auf dem Kopf, zusätzlich liegt eine zweite, schwarze Mütze am Boden. Die Locken sind also nicht frei. – *Prompt:* "The child is bareheaded with free curls; the child's own brown flat cap lies on the ground at their feet."
- `docs/art/szenen/perle-4/entdeckung-wollmark.png` – mittel – Der Hirtenstab steht frei hinter Merla und wird von niemandem gehalten. Sie greift mit einem Stöckchen nach einer Waage, die der Söldner hält. Die drei schwarzen Zelte und der Pfosten mit Aushang fehlen. – *Prompt:* "The old woman holds her shepherd's crook in her own hand and waves it near the mercenary's nose; the mercenary holds nothing; three black tents and a post with a blank sheet stand behind them."
- `docs/art/szenen/perle-4/szene-das-graue.png` – mittel – Die Schafe am Rand des Graus fehlen. Stattdessen liegen im Grau kleine graue rattenartige Tiere, und die Mulde wirkt wie ein ausgehobener Krater. – *Prompt:* "A dozen white sheep stand along the edge of the grey, half-grey themselves, facing its center; no small rodent-like animals; the grey is flat meadow, not a pit."
- `docs/art/szenen/perle-5/szene-flucht-tiefe-stiege.png` – mittel – Mirk winkt fröhlich, statt drängend zu winken, und **der Seitentunnel mit Tageslichtpunkt fehlt** (Plot-Hinweis). Das Licht hängt am Ende der Haupttreppe, und das kriechende Grau fehlt. – *Prompt:* "To the left a separate side tunnel branches off with a tiny dot of daylight at its far end; the kobold looks worried and waves urgently; on the lower steps the stone turns colorless grey."
- `docs/art/szenen/perle-5/szene-neumond-glimmhalde.png` – mittel – Statt eines Blicks nach oben durch einen Luftschacht sieht man eine Türöffnung zum Himmel, und die wandernden goldenen Lichter fehlen. Mirk liegt groß im Vordergrund und ist keine Silhouette am Rand. Dazu ein überlanges Bein nach links und ein zweiter Fuß rechts unter der Hand. – *Prompt:* "Looking straight up a narrow vertical stone shaft to a small patch of stars crossed by dozens of drifting golden lights; the kobold is only a small dark silhouette at the very edge of the picture."
- `docs/art/szenen/perle-5/szene-tiefe-stiege.png` – mittel – Die Treppe führt sichtbar nach oben statt hinab. Mirk steht frontal zum Betrachter, statt unten über die Schulter zurückzublicken. Die Laterne an der Stange schwebt hinter ihr, ohne dass eine Hand sie hält. – *Prompt:* "Looking steeply down the stairs; the kobold stands several steps below with her back to the viewer, turning her head over her shoulder, holding the lamp in her raised hand."
- `docs/art/szenen/perle-5/szene-vermisste-kobolde.png` – mittel – Es sind nur **4 statt 7** Kobolde zu sehen, und sie sind kaum grauer als Mirk. Der Boden wird zum Tunnel hin nicht farblos. – *Prompt:* "Exactly seven kobolds in a row, their scales clearly ash-grey like an unpainted sketch; the floor turns visibly colorless towards the tunnel."
- `docs/art/szenen/perle-5/szene-wiedersehen-botenlaeufer.png` und `…-schausteller.png` – mittel – Die **halb graue Gesichtshälfte ist kaum zu sehen**: beim Botenläufer nur ein hellerer Scheitel, beim Schausteller fast gar nicht. Bei Kartografenlehrling, Reisender, Schiffsjunge und Straßenkind ist sie schwach, aber erkennbar. – *Prompt:* "The left half of his face is clearly ash-grey and colorless like an unpainted pencil sketch, with a visible vertical edge down the middle of the face."

### Ohne Befund

perle-4: entdeckung-weiden, figur-freund-verkleidet-cassian, figur-freund-verkleidet-liora, figur-strell, szene-gasthaus-krummer-stab-cassian, szene-gasthaus-krummer-stab-liora, szene-ginsterhof, szene-gnollenlager, tagebuch-perle-4
perle-5: entdeckung-glimmhalde, entdeckung-minentor, szene-brief-in-wollmark (Leise-Hand-Zeichen korrekt, zwei Hände), szene-glimmhalde-fest, szene-wiedersehen-kartografenlehrling, szene-wiedersehen-reisender, szene-wiedersehen-schiffsjunge, szene-wiedersehen-strassenkind, tagebuch-perle-5

**Geprüfte Bilder: 42** (perle-4: 24, perle-5: 18 ohne szene-talin)

---

## Bildprüfung Perle 6 + 7

### Hoch (muss neu)

- `docs/art/szenen/perle-6/entdeckung-spaltstrasse-vardholm.png` – hoch – Vorne links wächst ein Pferdekopf ohne Körper aus der Brust des ersten Söldners. Außerdem laufen die Söldner zu Fuß auf den Betrachter zu, statt dass Eingeschriebene mit Plaketten zur Festung hin gehen. – Prompt: "The line of registered people walks away from the viewer towards the fortress, seen from behind; the black-coated mercenaries ride complete horses with all four legs visible, and no animal part merges with any person."
- `docs/art/szenen/perle-6/szene-funken-frei.png` – hoch – Der Kernmoment fehlt: Alle Kugeln liegen noch heil in ihren Körben, es gibt nur ein paar Funken. Das Bild sieht fast aus wie `szene-kugelhalle`. – Prompt: "Most baskets are already empty; dozens of orbs hang in mid-air above the shelves and burst, and a dense river of brown, blue, red and white sparks fills the aisle and streams out through high windows."
- `docs/art/szenen/perle-6/szene-modell-des-walls.png` – hoch – Die Glasglocke deckt das ganze Modell ab statt nur Oberstadt und Festung, und damit ist die Aussage des Bilds weg. Auf dem Zettel steht außerdem Schein-Schrift ("tlesd bon ial …", "Xahle"), die man zu lesen versucht. – Prompt: "A small glass dome covers only the hilltop district and the fortress, while the harbor, market and river houses stand clearly outside and uncovered beside it. The note is folded shut with only its blank back visible."
- `docs/art/szenen/perle-6/szene-ruf-gross-erde.png` – hoch – Vom Ruf ist nichts zu sehen: leerer Hof ohne Menschen, ohne leuchtende Felsen und ohne schwebende Steine. In der Mitte hängt stattdessen grauer Dunst, der wie Nebel wirkt. – Prompt: "In the foreground a crowd of people of all ages raise glowing hands, and the gorge cliffs blaze with deep brown light while boulders float in the air. No mist or haze anywhere; the grey is only a colorless, unpainted area far up the gorge."
- `docs/art/szenen/perle-7/szene-abschied-tickwort.png` – hoch – Der Automat hat am linken Arm (Bildmitte links) zwei Enden: eine Faust, die die Pfeife hält, und darunter zusätzlich eine Zange. Damit sind es drei Greifer statt zwei. – Prompt: "The automaton has exactly two thin arms, each ending in a single two-pronged pincer; the left pincer holds the whistle, and there are no hands or extra limbs."
- `docs/art/szenen/perle-7/szene-zum-halben-hauer.png` – hoch – Links brennt ein offenes Feuer mitten auf dem Gästetisch und eines darunter, dazu schweben Flammen an der Wand. Gäste tragen moderne Kleidung (Schirmmütze, Hemden). Der Wirt hat zwei heile Hauer und hält den Krug noch fest. – Prompt: "The only fire is in a stone fireplace at the back wall; the guests wear simple medieval tunics and hoods. The innkeeper's left lower tusk is clearly broken off short, and the tin jug is falling from his hand."
- `docs/art/szenen/perle-7/szene-vier-wege.png` – hoch – Auf der Karte steht Schein-Schrift ("Nacl Sordl", "Kum Coam", "Outsm (vlud)"). Die Karte zeigt kein Hufeisen mit Meer im Westen und keine vier unterscheidbaren Wege. – Prompt: "The map has no writing at all: a horseshoe of mountains around a green plain with blue sea on the left, and four clearly separate dotted routes leaving east, south, northeast (dashed, underground) and by sea around the southern cape."
- `docs/art/szenen/perle-7/tagebuch-perle-7.png` – hoch – Das Zeichen in den Ecken rechts oben und rechts unten besteht aus drei Ringen (wie die olympischen Ringe/Audi-Ringe) statt aus vier verschlungenen Ringen. Die Karte zeigt kein Hufeisen. – Prompt: "In one corner exactly four interlinked rings arranged like a four-leaf clover with an open center (as in ringzeichen.png), never three rings in a row; the map shows a horseshoe of mountains open to the sea in the west."

### Mittel (sollte neu)

- `docs/art/szenen/perle-6/szene-ruf-gross-wasser.png` – mittel – Keine Menschen mit Lichtern, kein graues Band in der Schlucht. Die Welle schießt aus der Mauer in den Hof statt die Schlucht hinauf. – Prompt: "Foreground: a crowd of people of all ages raising small colored lights; the blue wave races away from the viewer up the gorge into an ash-grey colorless area, which turns back to color where the water passes."
- `docs/art/szenen/perle-6/szene-ruf-gross-wind.png` – mittel – Keine Menschen, kein Sturm von den Gipfeln. Die weißen Schleier im Hof wirken wie Nebel oder ein Geist. – Prompt: "Foreground: a crowd of people with raised glowing hands, banners and cloaks whipping; the wind is drawn only as bright curved lines sweeping up the gorge, with no mist, smoke or ghostly veils."
- `docs/art/szenen/perle-6/szene-ruf-gross-feuer.png` – mittel – Die Menge besteht nur aus Kindern (es sollen alle Altersstufen sein). Die Plaketten werden wie Karten hochgehalten und tragen Schein-Buchstaben ("ER", "ZJZ"). In der Mitte vorne ist nicht klar, welche Arme zu wem gehören: Eine Rückenfigur scheint drei Plaketten zu halten. – Prompt: "A crowd of men, women, old people and children, each wearing a small blank brass plaque with only a balance-scale symbol on a string around the neck and raising one glowing hand; every raised arm clearly belongs to one person."
- `docs/art/szenen/perle-6/szene-mauer-vardholm.png` – mittel – Die Festung ist aus der Ferne zu sehen statt aus dem Blick steil an der Mauer hinauf. Der Klettermoment fehlt. – Prompt: "Extreme close-up looking straight up a rough stone wall that fills the whole picture, cracks and moss right in front of the eyes, the battlement tiny at the very top against the stars."
- `docs/art/szenen/perle-6/szene-schweigen-im-spalt.png` – mittel – Das ganze Bild ist gleichmäßig grau entsättigt. Es gibt keine sichtbare Grenze, an der die Farbe verschwindet, und keine erloschenen Fackeln. Der Blick geht in den Hof statt vom Wehrgang die Schlucht entlang. – Prompt: "The near half of the picture is in full warm color with burning torches, the far half up the gorge is ash-grey pencil lines, with one clear visible edge between them crossing the stream and road."
- `docs/art/szenen/perle-6/entdeckung-vardholm-morgen.png` – mittel – Die Suppe kocht in den Bronzeplatten der Maschine statt über Lagerfeuern. Eingeschriebene fehlen. Die Söldner tragen ihre Helme, obwohl sie sie abgenommen haben sollen. – Prompt: "Registered mages with brass plaques sit around small campfires on the paving with iron pots; the bronze plates stand empty, and the mercenaries hold their helmets in their laps."
- `docs/art/szenen/perle-6/szene-festmahl-vardholm.png` – mittel – Ambra fehlt: Statt der alten Frau mit kurzem weißem Haar ohne Augenbrauen sitzen rechts zwei weißhaarige Männer. – Prompt: "Clearly visible among the guests: an old woman (female) with short white hair, no eyebrows and a belt of little pouches, sitting next to the gnome."
- `docs/art/szenen/perle-6/szene-yrsas-karren.png` – mittel – Yrsa steht vor dem Karren statt auf dem Bock zu sitzen. In den Kisten liegen Blecheimer statt eiserner Körbchen, und die Pferde sind nicht eingespannt. – Prompt: "Yrsa sits up on the driver's seat and leans down; the crates hold small open hand-forged iron wire baskets (like requisiten/kugel-im-korb.png, empty), and both horses are harnessed to the cart."
- `docs/art/szenen/perle-7/szene-abschied-nerelle.png` – mittel – Sie hält einen tropfenden Eimer statt eines Wasserschlauchs aus Robbenleder und reicht nichts hinunter. Der Betrachter steht auf dem Deck statt am Kai. – Prompt: "Seen from the quay below, she leans over the ship's railing and holds out a soft seal-leather water skin (a bag-shaped flask with a stopper, not a bucket) down towards the viewer."
- `docs/art/szenen/perle-7/szene-abschied-vardholm-kommt-cassian.png` und `…-kommt-liora.png` – mittel – Das Tor ist mit einem Fallgitter geschlossen, obwohl es offen stehen soll (Aufbruch). Die Schuhe mit Silberschnallen am Ranzen fehlen. – Prompt: "Behind them the black iron gate stands wide open with daylight on the road beyond; a pair of fine shoes with silver buckles dangles from the child's satchel."
- `docs/art/szenen/perle-7/szene-herz-wiedersehen.png` – mittel – In der Kugel sind die Farben falsch: zweimal Braun und kein Weiß. Aus dem Riss läuft ein Strahl Flüssigkeit auf den Boden. Die Koboldin wirkt männlich, ihre Brille ist nicht gesprungen. – Prompt: "Exactly four lights in the sphere, one each of brown, blue, red and pure white; the crack is a dry dark line with nothing leaking. The kobold is clearly an old woman with cracked spectacles."
- `docs/art/szenen/perle-7/szene-fremder-am-steg.png` – mittel – Der Pfeil nach Osten fehlt. Das Ringzeichen ist eine lose Platte statt eines Abdrucks im Holz. Die Figur wirkt wie ein Teenager statt alterslos. – Prompt: "Pressed into the wet planks beside him, a four-ring sign with a clear arrow pointing to the right (east); he looks like a calm adult of indeterminate age, not a youth."
- `docs/art/szenen/perle-7/szene-silbermark-stube.png` – mittel – Der Schreiber sieht aus wie ein etwa 12-jähriger Junge; Kinder könnten ihn für Cassian oder die Spielfigur halten. – Prompt: "The clerk is a thin adult man around forty with a narrow face, thinning hair and small spectacles."
- `docs/art/szenen/perle-7/szene-leeres-dorf.png` – mittel – Die Ziege ist ganz grau, deshalb wirkt sie wie eine normale graue Ziege und das Schweigen ist nicht zu erkennen. Sie schaut den Betrachter an statt nach Osten, und graue Flecken auf den Feldern fehlen. – Prompt: "A brown-and-white goat whose rear half is drained to ash-grey with a clear border, standing in profile staring sideways into the distance; visible ash-grey patches on the colored fields behind."
- `docs/art/szenen/perle-7/entdeckung-aufstieg-suedarm.png` – mittel – Es gibt nur ein einzelnes Haus mit Ziegen auf dem Dach. Der alte Hirte fehlt, und die zwei Wege nach oben (Zickzack mit Fackelpfosten und Pfad weiter östlich) sind kaum zu erkennen, obwohl es um die Wegwahl geht. – Prompt: "Several small stone huts with grass roofs; an old shepherd sits in front of one. Behind, a huge mountain wall with two clearly visible paths: a zigzag with torch posts on the left and a faint rocky trail on the right."

### Ohne Befund (Auswahl ok)
perle-6: entdeckung-vardholm-hof, entdeckung-vorfuehrung-cassian, entdeckung-vorfuehrung-liora, szene-hinter-dem-stall-cassian, szene-hinter-dem-stall-liora, szene-kugelhalle, tagebuch-perle-6.
perle-7: entdeckung-dornfurt, entdeckung-jenseits-der-berge, szene-abschied-borrik, szene-abschied-grumak, szene-abschied-vael (sitzt nicht auf der Galerie, sondern auf der Klippe vor dem Leuchtturm; nur Kleinkram), szene-abschied-vardholm-bleibt-cassian, szene-abschied-vardholm-bleibt-liora, szene-abschied-yrsa, szene-am-grat, szene-faehrfrau, szene-heimkehr-lysmara, szene-orinbruecke-kontrolle, szene-schwarzwasserbucht, szene-sturm-am-kap, szene-tor-offen, szene-wolfspfad, szene-ziegenstiege-fackeln, szene-zwergentor-ost.

In keinem Bild ist die Spielfigur zu sehen.

**Geprüfte Bilder: 49** (perle-6: 19, perle-7: 30)
