# Bildliste

Alle Bilder und Kartenteile, die die Story über Tags anfordert (`# bild: …`, `# karte: …`).
Die App zeigt an diesen Stellen später das passende Bild. Bis dahin sind es nur Platzhalter.

## Vorgehen (Vorschlag, 12.10.2026)
1. **Zuerst die Figuren-Referenzblätter**, bevor Szenenbilder entstehen: Tickwort, Liora, Cassian, die fünf Völker, Grumak, Fesk, der Fremde. Nur so sehen die Figuren in allen Bildern gleich aus.
2. **Danach je Perle**, sobald sie getestet ist und sich der Text nicht mehr stark ändert. Bilder zu Szenen, die noch umgeschrieben werden, wären verschwendet.
3. **Die Gesamtkarte von Meridel** ist festgelegt (12.10.2026): `docs/worldbuilding/karte-meridel.md`, Lagevorlagen in `docs/art/karten/`.

Werkzeuge: siehe `werkzeuge.md`.

**Perspektive:** Alle Szenenbilder aus der Sicht der Spielfigur, von ihr ist nichts zu sehen (siehe `art-style.md`).

**Aussehen der Figuren:** verbindlich ist `docs/worldbuilding/figuren-aussehen.md`. Referenzblätter zeigen immer das Grundaussehen, nie einen Szenenzustand.

## Perle 1 – Die Hafenstadt

**Ausführliche Beschreibung jedes Bildes, Varianten, Referenzen und fertige Prompts: `docs/art/szenen/perle-1/README.md`** (12.10.2026). Die Tabellen hier sind nur die Kurzfassung.

### Figuren-Auftritte (Szenenbilder, die eine Figur vorstellen)
| Tag | Inhalt | Ebene |
|---|---|---|
| `figur/tickwort` | Tickwort fliegt aus der Werkstatt und liegt vor dem Betrachter auf dem Pflaster | Szene |
| `figur/freund` | Liora bzw. Cassian taucht aus dem Apfelhaufen auf (Blätter im Haar, Ärmel eingerissen – Szenenzustand) | Szene |
| `figur/grumak` | Grumak an seinem Gewürzstand am Brunnen, der Betrachter schaut weit zu ihm hoch | Szene |

### Szenen
| Tag | Inhalt | Ebene |
|---|---|---|
| `szene/lysmara-abend` | Lysmara zwischen Meer und Bergen am Abend | Entdeckung |
| `szene/sonnenuntergang-hafen` | Sonnenuntergang über dem Hafen | Szene |
| `szene/bezugsperson-packt` | Die Bezugsperson packt hastig eine Tasche (6 Varianten je Hintergrund oder neutral) | Szene |
| `szene/fremder-im-regen` | Gestalt im grauen Mantel unter einem Torbogen, Mondlicht-Augen, Brief mit Spiralsiegel | Szene |
| `szene/eintreiber-fesk` | Dürrer Eintreiber im silbergrauen Mantel mit Buch | Szene |
| `szene/nordkai-kisten` | Söldner der Goldenen Waage laden Kisten, Glaskugel mit gefangenem Blitz | Szene |
| `szene/morgen` | Morgenlicht, Möwe am Fenster | Szene |
| `szene/zwirbelgasse` | Gasse der Gnomenwerkstätten | Entdeckung |
| `szene/hafen-kran` | Dampfkran, Kobold Grisk im Netz über dem Wasser | Szene |
| `szene/weite-feder` | Schmales hohes Haus voller Fernrohre, Meister Orwin am Kartentisch | Szene |
| `szene/klippen-leuchtturm` | Klippen von Ahrn, schiefer weißer Leuchtturm | Szene |
| `szene/markt` | Bunter Markt von Lysmara | Szene |
| `szene/stadtwache` | Stadtwachen versperren eine Gasse | Szene |
| `szene/freund-faellt` | Kind fällt aus dem Apfelbaum in einen Obstkarren – **hier** Blätter im Haar, zerrissener Ärmel | Szene |
| `szene/goblin-werkstatt` | Knallfunke & Söhne, qualmende Teekannen-Spinnen-Maschine | Entdeckung |
| `entdeckung/ausrufer-ratshalle` | Herold auf den Stufen der Ratshalle, Söldner der Waage | Entdeckung |

### Tagebuch und Karte
| Tag | Inhalt |
|---|---|
| `tagebuch/perle-1` | Tagebuchseite mit Skizzen von Lysmara |
| `karte: lysmara` | Erste Kartenskizze: Küste, Hafen, Dächer |
| `karte: hafen`, `markt`, `brunnen`, `marktplatz`, `oberstadt`, `wachhaus`, `weite-feder` | Orte in Lysmara, die beim Besuch auf der Karte erscheinen |
| `karte: klippen-von-ahrn` | Klippen und Leuchtturm nördlich der Stadt |
| `karte: kharvan-kamm` | Gebirgskette am Kartenrand mit dem Nyrrspalt |

## Perle 2 – Am Fluss der Räder

**Ausführliche Beschreibungen, Varianten, Referenzen und fertige Prompts: `docs/art/szenen/perle-2/README.md`** (13.10.2026). Neu: `szene/bruecke-abend-<liora\|cassian>`, `tagebuch/perle-2`, Ortsbild `orte/raederviertel`.

### Figuren (Referenzblätter)
| Tag | Inhalt | Ebene |
|---|---|---|
| `figur/yrsa` | Feuer-Mentorin: alte Schmiedin, Lederschürze, rußige Hände, graues Haar unter einem Tuch | Szene |
| `figur/borrik` | Erde-Mentor: uralter blinder Zwerg, weißer Bart im Gürtel, milchige Augen | Szene |
| `figur/nerelle` | Wasser-Mentorin: große Frau, silbergrünes Haar, barfuß, Mantel wie aus Seetang | Szene |
| `figur/vael` | Wind-Mentor: dürrer alter Einsiedler, Haare wie Pusteblumenflaum | Szene |
| (ohne Tag) | Grisk (Kobold, grauschuppig, Grubenlampe), Mirk (alte Koboldin mit gesprungener Brille), Kettrich (Gnom, Brille mit drei Gläsern) | Szene |

### Szenen
| Tag | Inhalt | Ebene |
|---|---|---|
| `entdeckung/raederviertel` | Wasserräder so hoch wie Häuser, Schmieden, bunter Färberdampf | Entdeckung |
| `szene/erzlaende` | Erzkähne am Ufer, Kobolde mit Grubenlampen | Szene |
| `szene/tuchhalle` | Riesige Halle, Webstühle, bunte Stoffbahnen von der Decke | Szene |
| `szene/grosse-schmiede` | Esse so groß wie ein Zimmer, Funkenregen | Szene |
| `szene/faerberturm-feuer` | Brennender Färberturm am Mühlgraben, Kind oben auf der Plattform (klein, keine Varianten) | Szene |
| `szene/erwachen-wasser-<liora\|cassian>` | Eine Welle steigt aus dem Mühlgraben und löscht den Turm | Szene |
| `szene/erwachen-feuer-<liora\|cassian>` | Die Flammen fließen den Turm hinab auf den Betrachter zu und ballen sich vor ihm zu einer glühenden Kugel | Szene |
| `szene/erwachen-wind-<liora\|cassian>` | Der Wind fängt das fallende Kind auf und trägt es auf den Betrachter zu | Szene |
| `szene/erwachen-erde-<liora\|cassian>` | Eine Felsentreppe wächst vor dem Betrachter aus dem Pflaster neben dem Turm empor | Szene |
| `szene/schmiedekeller` | Dunkler Keller, eine Lampe, Yrsa auf einer Kiste | Szene |
| `szene/bruecke-abend` | Steinbrücke über den Orin bei Sonnenuntergang; Liora/Cassian sitzt neben dem Betrachter auf der Brüstung und schaut ihn an | Szene |

### Tagebuch und Karte
| Tag | Inhalt |
|---|---|
| `tagebuch/perle-2` | Tagebuchseite: Fluss, Wasserräder, verkohlter Färberturm |
| `karte: raederviertel`, `erzlaende`, `tuchhalle`, `grosse-schmiede`, `orinbruecke`, `orin`, `steinmetzhof` | Neue Orte am Fluss |

## Perle 3 – Die Gildenprobe

**Ausführliche Beschreibungen, Varianten, Referenzen und fertige Prompts: `docs/art/szenen/perle-3/README.md`** (13.10.2026). Die Tabelle hier ist nur die Kurzfassung.

| Tag | Inhalt | Ebene |
|---|---|---|
| `szene/morgen-mentor` | Morgenübung beim eigenen Mentor (4 Varianten je Element) | Szene |
| `szene/tickwort-werkstatt` | Knallfunke & Söhne aufgeräumt, überall Anleitungszettel, Tickwort stolz | Szene |
| `entdeckung/gildentag` | Lysmara geschmückt: Gildenbanner, Trommler, schwarz-goldene Tribüne vor der Ratshalle | Entdeckung |
| `szene/tuchhalle-pruefung` | Stillstehende Webstühle, Bewerber, Kettrich auf dem Podest | Szene |
| `szene/gewoelbe-pruefung` | Gewölbe unter dem Markt, Orwin mit Sanduhr, Laternen | Szene |
| `szene/raum-der-vier` | Runder Raum, Mosaik: vier Gestalten (Stein, Welle, Flamme, Feder) um die Spirale | Szene |
| `szene/phiole-pruefung` | Hof der Phiole, acht Kupferkessel, Zuschauer, Meisterin Ambra; Tickwort über dem Zaun | Szene |
| `szene/zelt-der-waage` | Schwarzes Zelt mit goldenen Fransen, Schreibtisch, goldene Waage, schwarzer Vorhang, Goldknopf am Boden | Szene |
| `szene/zelt-register` | Lächelnder Schreiber schiebt den Vertrag hin, dahinter leere Glaskugeln | Szene |
| `entdeckung/magiergesetz` | Tribüne: Waagmeisterin mit goldener Kette, Mann mit grauen Schläfen, dahinter Liora/Cassian; Herold | Entdeckung |
| `szene/brunnen-abend` | Brunnen in der Dämmerung, Gildenlaternen, Liora/Cassian im weißen Hemd | Szene |
| `szene/gildenlaternen` | Marktplatz bei Nacht: blaue, silberne, rote und goldene Laternen | Szene |
| `szene/beitritt-webstuhl`, `-feder`, `-phiole`, `-hand` | Aufnahme in die jeweilige Gilde | Szene |
| `szene/brunnen-nacht` | Keine Gilde: Liora/Cassian am Brunnen, leerer Platz | Szene |
| `szene/heimweg-nacht` | Zwei Söldner mit Buch und Laterne an einer Straßenecke | Szene |
| `tagebuch/perle-3` | Tribüne, Gildenlaternen, je nach Prüfung Wasserrad, Gewölbe, Kessel, Zelt | Tagebuch |

## Perle 4 – Die Weiden

**Ausführliche Beschreibungen, Varianten, Referenzen und fertige Prompts: `docs/art/szenen/perle-4/README.md`** (13.10.2026). Die Tabelle hier ist nur die Kurzfassung. Varianten `-liora`/`-cassian` auch bei `szene/lamm-auf-der-strasse` und `szene/gasthaus-krummer-stab`.

| Tag | Inhalt | Ebene |
|---|---|---|
| `szene/landtor-morgen` | Landtor von Lysmara, Spaltstraße zieht sich nach Osten zu den Bergen | Szene |
| `figur/freund-verkleidet` | Liora/Cassian in Arbeiterjacke und Mütze, feine Schuhe (2 Varianten) | Szene |
| `entdeckung/weiden` | Grüne Hügel, Steinmauern, Schafe wie Wolken, der Kamm wächst in den Himmel | Entdeckung |
| `szene/lamm-auf-der-strasse` | Lamm mit grauer Stelle im Fell starrt nach Süden | Szene |
| `entdeckung/wollmark` | Steinhäuser mit Grasdächern, Wollscheunen, Zelte der Waage, Pfahl mit Aushang | Entdeckung |
| `figur/strell` | Hauptmann Strell vor seinem Zelt | Szene |
| `szene/gasthaus-krummer-stab` | Dachkammer, offenes Fenster, drei Feuer an den Südhängen | Szene |
| `szene/freund-abgeholt` | Hof des Gasthauses, Liora/Cassian zwischen Söldnern, Strell verbeugt sich (2 Varianten) | Szene |
| `szene/ginsterhof` | Krummes Haus, Stall, fünfzig Ziegen, Jorrit auf der Bank | Szene |
| `szene/das-graue` | Graue Senke, schlafende Schafe am Rand, absolute Stille | Szene |
| `szene/fremder-am-grauen` | Der Fremde am Rand des Grauen, das Gnollenjunge im Arm | Szene |
| `szene/gnollenlager` | Schlucht mit Fellzelten, magere Gnolle am Feuer | Szene |
| `figur/ashka` | Ashka mit Stab und Steinkette | Szene |
| `szene/nacht-das-schweigen` | Das Graue kriecht den Hang hinab, Feuer erlöschen, Schlafwandler | Szene |
| `szene/ruf-erde`, `-wasser`, `-feuer`, `-wind` | Der große Ruf je Element | Szene |
| `szene/morgen-danach` | Grauer Streifen am Bergfuß, Morgenlicht über grünen Hängen | Szene |
| `tagebuch/perle-4` | Weiden, Ziegenhaus, Fellzelte, leer gelassener grauer Streifen | Tagebuch |

## Perle 5 – Unter dem Berg

**Ausführliche Beschreibungen, Varianten, Referenzen und fertige Prompts: `docs/art/szenen/perle-5/README.md`** (13.10.2026). Die Tabelle hier ist nur die Kurzfassung.

| Tag | Inhalt | Ebene |
|---|---|---|
| `szene/brief-in-wollmark` | Brunnen in Wollmark, Fink bzw. ein Botenjunge reicht einen Brief | Szene |
| `entdeckung/orin-treidelpfad` | Grüner Orin, Maultiere ziehen Erzkähne mit Kobolden flussaufwärts zu den Bergen | Entdeckung |
| `entdeckung/minentor` | Riesiges Zwergentor im Berg, Loren, Holzhaus der Gilde, Gnom Dorn, zwei Söldner | Entdeckung |
| `entdeckung/glimmhalde` | Höhlenstadt: Häuser wie Schwalbennester, bunte Grubenlampen, schwarzer See mit Pilzflößen | Entdeckung |
| `szene/neumond-glimmhalde` | Luftschacht mit Sternenhimmel, Funken wandern nach Osten | Szene |
| `szene/tiefe-stiege` | Breite Zwergentreppe in die Dunkelheit, Zeichen an den Wänden | Szene |
| `szene/talin` | Junge mit Messingplakette, der den Fels mit bloßen Händen weichen lässt | Szene |
| `szene/der-schlund` | Abgrund, Reste einer Kettenbrücke, Rauschen in der Tiefe | Szene |
| `szene/vermisste-kobolde` | Graue Halle, sieben Kobolde schlafen im Stehen (ggf. mit Bezugsperson) | Szene |
| `szene/wiedersehen` | Bezugsperson wacht auf (6 Varianten) | Szene |
| `szene/herz-des-berges` | Kristallkugel mit vier Lichtern über riesiger Spirale, Riss, Stollen mit Waage-Kisten | Szene |
| `szene/flucht-tiefe-stiege` | Treppe hinauf, das Graue folgt; Seitengang mit Licht am Ende | Szene |
| `szene/glimmhalde-fest` | Alle Lampen leuchten, singende Kobolde, Mirk mit der singenden Lampe | Szene |
| `tagebuch/perle-5` | Glimmhalde, Tiefe Stiege, Kristall mit Riss | Tagebuch |

## Perle 6 – Die Festung am Pass

**Ausführliche Beschreibungen, Varianten, Referenzen und fertige Prompts: `docs/art/szenen/perle-6/README.md`** (13.10.2026). Die Tabelle hier ist nur die Kurzfassung.

| Tag | Inhalt | Ebene |
|---|---|---|
| `entdeckung/spaltstrasse-vardholm` | Festung quer in der Schlucht, Spiegel auf dem Turm, lange Reihe Eingeschriebener mit Söldnern | Entdeckung |
| `szene/yrsas-karren` | Yrsa auf dem Bock, Kisten voller eiserner Körbe, Plane angehoben | Szene |
| `szene/mauer-vardholm` | Nachts an der Mauer, wo sie an den Fels stößt | Szene |
| `entdeckung/vardholm-hof` | Hof mit Bronzeplatten und Röhren, Eingeschriebene auf Decken | Entdeckung |
| `szene/kugelhalle` | Felsenhalle, Regale mit tausenden leuchtenden Glaskugeln in Körben | Szene |
| `szene/modell-des-walls` | Modell von Lysmara, Glasglocke nur über Oberstadt und Vardholm, Zettel „S. A.“ | Szene |
| `entdeckung/vorfuehrung` | Tribüne, Seraphine mit Liora/Cassian, Kuppel aus Licht über der Festung (Variante `-liora`/`-cassian`) | Entdeckung |
| `szene/hinter-dem-stall` | Liora/Cassian im weißen Hemd, rote Augen (Variante `-liora`/`-cassian`) | Szene |
| `szene/festmahl-vardholm` | Große Halle, lange Tafel, Seraphine am Kopf, Ratsherren und Gildenmeister | Szene |
| `szene/funken-frei` | Kugeln steigen auf und zerplatzen, Funken in vier Farben fliegen durch die Fenster | Szene |
| `szene/schweigen-im-spalt` | Graues Nebelband kriecht durch die Schlucht auf die Festung zu, Fackeln erlöschen | Szene |
| `szene/ruf-gross-erde` | Schluchtwände dröhnen, Steine schweben, braunes Licht | Szene |
| `szene/ruf-gross-wasser` | Bach wird zur Welle, rauscht die Schlucht hinauf | Szene |
| `szene/ruf-gross-feuer` | Flammensäule so hoch wie der Turm, alle Fackeln brennen | Szene |
| `szene/ruf-gross-wind` | Sturm heult durch die Schlucht, Fahnen und Läden schlagen | Szene |
| `entdeckung/vardholm-morgen` | Festung im Morgenlicht, gesprungener Spiegel, Suppenfeuer im Hof | Entdeckung |
| `tagebuch/perle-6` | Vardholm in der Schlucht, Spiegel mit Riss, fliegende Funken | Tagebuch |

## Perle 7 – Der Weg hinaus

**Ausführliche Beschreibungen, Varianten, Referenzen und fertige Prompts: `docs/art/szenen/perle-7/README.md`** (13.10.2026). Die Tabelle hier ist nur die Kurzfassung. Wiederverwendet: `entdeckung/minentor` und `szene/der-schlund` aus Perle 5.

| Tag | Inhalt | Ebene |
|---|---|---|
| `szene/abschied-vardholm-kommt-<liora\|cassian>` / `-bleibt-<liora\|cassian>` | Am Tor von Vardholm: Liora/Cassian mit Ranzen bzw. mit dem Goldknopf (je Varianten Liora/Cassian) | Szene |
| `szene/heimkehr-lysmara` | Abends durch das Landtor, die Stadt wirkt kleiner | Szene |
| `szene/abschied-borrik` / `-nerelle` / `-yrsa` / `-vael` | Abschied vom Mentor, mit Geschenk | Szene |
| `szene/abschied-tickwort` | Werkstatt Knallfunke & Söhne, Tickwort mit Messingpfeife | Szene |
| `szene/abschied-grumak` | Grumak am Brunnen, eiserner Ring | Szene |
| `szene/vier-wege` | Tagebuchkarte auf den Knien, vier Wege eingezeichnet | Szene |
| `szene/tor-offen` | Das schwarze Tor von Vardholm steht offen | Szene |
| `entdeckung/aufstieg-suedarm` | Ginsterhof vor dem Südarm des Kamms | Entdeckung |
| `szene/wolfspfad` | Pfad zwischen Felsen, unten die Fackeln der Ziegenstiege | Szene |
| `szene/ziegenstiege-fackeln` | Kehren mit Fackelpfählen, Wachhütte | Szene |
| `szene/am-grat` | Schnee, Eis, Wind am höchsten Punkt | Szene |
| `szene/herz-wiedersehen` | Das Herz von der Schwelle aus, Splitter in der Hand | Szene |
| `szene/zwergentor-ost` | Kleines Zwergentor, dahinter Himmel | Szene |
| `szene/schwarzwasserbucht` | Nachts in der Bucht, Boot ohne Laterne | Szene |
| `szene/sturm-am-kap` | Riesige Wellen am Kap, das Tau | Szene |
| `entdeckung/jenseits-der-berge` | Braune Hügel, Fluss im Osten, der Kamm von hinten | Entdeckung |
| `szene/leeres-dorf` | Offene Türen, Brot auf dem Tisch, graue Ziege am Brunnen | Szene |
| `entdeckung/dornfurt` | Stadt hinter Pfählen an der Furt, Glocken, Trommel | Entdeckung |
| `szene/zum-halben-hauer` | Gasthaus mit abgebrochenem Orkzahn, Durgash | Szene |
| `szene/silbermark-stube` | Schreiber mit Kiesel und Zettel | Szene |
| `szene/faehrfrau` | Fährfrau mit Spirale in der Stange | Szene |
| `szene/fremder-am-steg` | Ithren am Ende des Stegs, Fackeln im Fluss | Szene |
| `tagebuch/perle-7` | Ganze Karte von Meridel, Pfeil nach Osten | Tagebuch |

