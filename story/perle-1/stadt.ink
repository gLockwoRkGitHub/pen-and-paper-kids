// =====================================================================
// Perle 1 – Lysmara: drei Aufträge und die Begegnung mit Liora/Cassian
// Mindestens zwei Aufträge, dann darf man weiter. Nach dem zweiten
// Auftrag fällt der Freund bzw. die Freundin vom Himmel.
// =====================================================================

=== p1_stadt
# karte: lysmara
{ auftraege >= 2 && not p1_freund:
    -> p1_freund
}
{ auftraege >= 3:
    Die Sonne steht schon tief über dem Meer. Du hast getan, was du an einem Tag tun konntest.
    ->->
}
{ auftraege == 0:
    Lysmara liegt vor dir, laut und bunt und voller Möglichkeiten. Wohin zuerst?
- else:
    Tickwort zählt dein Silber, zweimal, zur Sicherheit. „{Silberlinge(silber)}.{silber >= 10: Genug für den Zoll!“ Sein Schornstein pfeift vor Freude.| Es fehlen noch {zahl(10 - silber)}.“}
    Wohin als Nächstes?
}
+ {not p1_hafen} [Zum Hafen – der Hafenmeister sucht Hilfe beim Entladen]
    -> p1_hafen
+ {not p1_feder} [Zur Gesellschaft der Weiten Feder – sie zahlen für Skizzen]
    -> p1_feder
+ {not p1_markt} [Zum Markt – jemand sucht einen Boten, der keine Fragen stellt]
    -> p1_markt
+ {auftraege >= 2} [Genug für heute. Zum Marktplatz, wo gerade die Glocken läuten.]
    ->->


// ---------------------------------------------------------------------
// Auftrag: Der Hafen und der Kobold Grisk
// ---------------------------------------------------------------------
=== p1_hafen
# karte: hafen
# bild: szene/hafen-kran
Der Hafen von Lysmara ist laut. Möwen kreischen, Taue knarren, und überall wird gerufen, geflucht und gefeilscht.

Hafenmeister Brann, ein Mann so breit wie eine Tür, steht auf dem Kai und brüllt Befehle. Als er dich sieht, deutet er auf einen Lastkahn voller Säcke. „Helfer? Gut. Drei Silberlinge, wenn der Kahn bis Mittag leer ist. Das Erz geht an Webstuhl und Amboss, also trödel nicht.“

Ein dampfbetriebener Ladekran hebt die Säcke in großen Netzen an Land. Auf dem Kahn arbeitet ein Kobold: klein, grauschuppig, mit einer Grubenlampe auf dem Helm und Fingern, die flinker sind als deine.

Gerade als du anpacken willst, gibt es einen Knall. Ein Seil am Kran reißt. Das Netz schwingt herum, und der Kobold, der sich darin verfangen hat, baumelt plötzlich hoch über dem Hafenbecken.

„Hilfe!“, quiekt er. „Grisk schwimmt nicht gut! Grisk schwimmt wie Stein!“

Am Kai lachen ein paar Hafenarbeiter. „Lass den Wurm doch baden!“
* [Das Haltetau packen und ihn heranziehen (Kraft)]
    ~ temp e = probe(kraft)
    ~ probe_zeile("Kraft", e)
    -> rettung(e)
* [Auf den Kran klettern und den Hebel umlegen (Geschick)]
    ~ temp e_b = probe(geschick)
    ~ probe_zeile("Geschick", e_b)
    -> rettung(e_b)
* {hintergrund == "schiffsjunge"} [(Schiffsjunge) Ein Tau über den Ausleger werfen und mit einem Seemannsknoten sichern]
    Du schnappst dir ein Tau, wirfst es über den Ausleger und schlingst einen Knoten, den Kapitänin Rhea dir hundertmal gezeigt hat. Dann ziehst du. Langsam, gleichmäßig, wie beim Segelsetzen.
    -> rettung(ERFOLG)
* [Nichts tun. Kobolde können doch schwimmen. Oder?]
    ~ kobold_ignoriert = true
    ~ aendern(ruf_kobolde, -1)
    Das Netz reißt endgültig. Der Kobold klatscht ins Wasser, geht unter, taucht prustend wieder auf und paddelt mit wütenden Bewegungen zur Kaimauer.
    Als er sich hochzieht, sieht er dich an. Lange.
    Dann spuckt er ins Hafenbecken und verschwindet zwischen den Kisten.
    Tickwort sagt nichts. Sein Schornstein raucht nicht.
    -> arbeit

= rettung(e)
{ e:
- ERFOLG:
    ~ kobold_gerettet = true
    ~ erzmarke = true
    ~ aendern(ruf_kobolde, 1)
    ~ neigung_erde += 1
    # tagebuch: Grisk und die Erzmarke
    Mit einem letzten Ruck landet das Netz sicher auf dem Kai. Der Kobold krabbelt heraus, schüttelt sich und starrt dich mit großen gelben Augen an.
    „Du hast Grisk geholfen“, sagt er langsam. „Keiner hilft Grisk. Aber du.“
    Er kramt in seinem Beutel und drückt dir etwas in die Hand: eine kleine Marke aus dunklem Erz, in die ein Zeichen geritzt ist. Sie ist erstaunlich schwer und fühlt sich an, als würde sie ganz leise summen.
    „Erzmarke. Zeig sie in den Minen. Dann wissen alle: Freund von Grisk. Grisk vergisst nicht.“ # tagebuch_ende
- JA_ABER:
    ~ kobold_gerettet = true
    ~ aendern(ruf_kobolde, 1)
    ~ silber -= 1
    Du bekommst das Netz zu fassen und ziehst es zum Kai. Grisk ist gerettet. Aber zwei Erzsäcke rutschen dabei heraus und versinken gluckernd im Hafenbecken.
    „Die ziehe ich dir vom Lohn ab!“, brüllt Hafenmeister Brann.
    Grisk sieht zwischen dir und Brann hin und her. Dann klopft er dir auf die Hand. „Grisk merkt sich das“, flüstert er. „Das Gute. Nicht die Säcke.“
- else:
    ~ neigung_wasser += 1
    ~ aendern(ruf_kobolde, 1)
    Du greifst zu, verlierst den Halt und fällst kopfüber ins Hafenbecken.
    Das Wasser ist kalt und grün und dunkel. Und doch: Für einen Moment fühlt es sich nicht feindlich an. Es trägt dich, als würde es dich kennen.
    Dann klatscht das Netz neben dir ins Wasser. Grisk zappelt heraus, packt dich am Kragen und zieht dich am Seil des Netzes zur Kaitreppe.
    „{geschlecht == "w":Große Heldin|Großer Held}“, keucht er, als ihr beide tropfend auf den Stufen sitzt. „Kann nicht retten. Kann nicht schwimmen. Aber hat es versucht.“ Er grinst mit spitzen Zähnen. „Grisk mag das trotzdem.“
}
-> arbeit

= arbeit
Dann wird gearbeitet. Sack um Sack schleppst du vom Kran zum Karren, bis dir die Arme brennen.

~ silber += 3
Als der Kahn leer ist, zählt dir Hafenmeister Brann drei Silberlinge in die Hand.{kobold_gerettet && not erzmarke: Dann nimmt er einen davon wieder zurück. „Für die Säcke.“}

Brann wischt sich den Schweiß von der Stirn und blickt zu den Bergen hinüber. „Seit zehn Tagen kein einziger Wagen von jenseits des Passes“, murmelt er. „Nur noch Erz aus den Kobold-Minen. Komische Zeiten.“
~ auftraege += 1
-> p1_stadt


// ---------------------------------------------------------------------
// Auftrag: Die Weite Feder, die Klippen von Ahrn und der Leuchtturm
// ---------------------------------------------------------------------
=== p1_feder
# karte: weite-feder
# bild: szene/weite-feder
Das Haus der Gesellschaft der Weiten Feder ist schmal und hoch, und auf seinem Dach ragen Fernrohre in alle Himmelsrichtungen. Drinnen riecht es nach Tinte, Papier und Lampenöl.

Meister Orwin, ein alter Mann mit tintenblauen Fingern, einer Brille auf der Nase und einer zweiten auf der Stirn, blickt von einem riesigen Kartentisch auf.
{ hintergrund == "kartografenlehrling":
    „Du?“ Er blinzelt. „Ysoldes Lehrling! Wo steckt deine Meisterin?“
    { ausloeser == "verschwunden":
        Du erzählst ihm, dass Ysolde fort ist. Zum Nyrrspalt.
        Orwin wird still. Er nimmt die Brille von der Nase, putzt sie, setzt sie wieder auf. „Ausgerechnet jetzt“, murmelt er. „Sie hat mich letzte Woche nach alten Karten vom Kharvan-Kamm gefragt. Nach Pfaden, die nicht über den Spalt führen.“
    - else:
        „Unterwegs“, sagst du. Orwin nickt. „Wie immer. Diese Frau hat Hummeln im Tintenfass.“
    }
}

„Skizzen?“ Orwin nickt. „Ja, ja. Ich brauche eine Zeichnung der Klippen von Ahrn, nördlich der Stadt, mit dem alten Leuchtturm. Die Goldene Waage behauptet, ihr gehöre das Land dort, und hat eine eigene Karte anfertigen lassen.“

Er schnaubt.

„Aber wir zeichnen, was ist. Nicht, was bezahlt wird. Vier Silberlinge für eine ordentliche Skizze.“
-> klippen

= klippen
# karte: klippen-von-ahrn
# bild: szene/klippen-leuchtturm
Der Weg zu den Klippen führt aus der Stadt hinaus, über Schafweiden und dann steil bergauf. Oben pfeift der Wind so heftig, dass Tickwort sich an deinem Bein festklammert.

„Ich wiege elf Pfund!“, ruft er. „Elf! Pfund! Bei dieser Windstärke ist das eine sehr ernste Angelegenheit!“

Unter dir donnert das Meer gegen die Felsen. Auf der äußersten Klippe steht der alte Leuchtturm, weiß und schief wie ein abgebrochener Zahn.
* [Ganz vorn an die Klippe treten und den Wind spüren]
    ~ neigung_wind += 2
    Du trittst an die Kante. Der Wind packt dich, zerrt, drückt. Und dann geschieht etwas Seltsames: Er hört auf zu drücken. Er umfließt dich, als hättest du ihn darum gebeten. Für einen Atemzug stehst du mitten im Sturm, und um dich herum ist es ganz still.
    Dann ist der Moment vorbei, und der Wind reißt dir fast die Mütze vom Kopf.
    „Was war das?“, fragt Tickwort.
    „Ich weiß es nicht.“
* [Hinter einem Felsen Schutz suchen und von dort zeichnen]
    ~ neigung_erde += 1
    Du hockst dich in den Windschatten eines großen Felsens. Der Stein in deinem Rücken ist rau und kalt und so fest, als wäre er mit der ganzen Welt verwachsen. Hier kann dich kein Sturm wegblasen.
- -> zeichnen

= zeichnen
Du schlägst dein Buch auf und beginnst zu zeichnen: die Klippen, die Bucht, den Leuchtturm.
{ hintergrund == "kartografenlehrling":
    Deine Hand weiß, was zu tun ist. Zwei Jahre bei Ysolde machen sich bezahlt.
    ~ temp e = probe(verstand + 1)
    ~ probe_zeile("Verstand +1", e)
    -> skizze_ergebnis(e)
- else:
    ~ temp e2 = probe(verstand)
    ~ probe_zeile("Verstand", e2)
    -> skizze_ergebnis(e2)
}

= skizze_ergebnis(e)
{ e:
- ERFOLG:
    ~ skizze = 3
    ~ kuestenmauer_gesehen = true
    Deine Linien werden sicher und genau. Und weil du so genau hinsiehst, bemerkst du etwas, das nicht ins Bild passt: Unten am Klippenweg, halb versteckt hinter Ginsterbüschen, steht eine frische Mauer. Grauer Stein, noch ohne Moos. Daneben der Stumpf eines halbfertigen Wachturms.
    Du zeichnest beides mit ein.
- JA_ABER:
    ~ skizze = 2
    Die Skizze gelingt. Aber eine Windbö fegt dir den Kohlestift übers Blatt, und quer über den Leuchtturm zieht sich jetzt ein dicker schwarzer Strich. Vielleicht kann man das als Gewitterwolke verkaufen.
- else:
    ~ skizze = 1
    Eine Bö reißt dir das Blatt aus dem Buch. Es flattert davon, über die Klippe, hinaus aufs Meer. Du musst die ganze Zeichnung noch einmal aus dem Gedächtnis machen. Sie wird … nun ja. Erkennbar.
}
-> leuchtturm

= leuchtturm
Auf dem Rückweg kommst du dicht am Leuchtturm vorbei. Die Tür ist mit einer schweren Kette verschlossen. Daran hängt ein Schild in krakeliger Schrift:

„KEIN ZUTRITT. KEIN INTERESSE. KEINE AUSNAHMEN.“

Als du nach oben blickst, siehst du im höchsten Fenster eine Gestalt. Nur kurz. Dann ist das Fenster leer.
* [Anklopfen]
    ~ leuchtturm_geklopft = true
    Du klopfst. Einmal, zweimal. Niemand öffnet.
    Aber als du dich abwendest, schlägt hoch oben ein Fensterladen zu. Laut und scharf, wie eine Antwort. Dabei weht in diesem Moment überhaupt kein Wind.
    Tickwort rückt näher an dein Bein.
* [Lieber nicht stören]
    Du lässt den Leuchtturm hinter dir. Trotzdem hast du den ganzen Weg bergab das Gefühl, dass dich jemand beobachtet.
- -> bezahlung

= bezahlung
# karte: weite-feder
Zurück bei der Weiten Feder hält Meister Orwin deine Skizze gegen das Licht.
{ skizze:
- 3:
    ~ silber += 4
    ~ aendern(ruf_weite_feder, 1)
    „Ausgezeichnet“, murmelt er. „Saubere Linien, gute Maße … Moment.“ Er erstarrt. „Diese Mauer. Und der Turm. Das ist neu.“
    Er schiebt sich die zweite Brille von der Stirn auf die Nase, sodass er jetzt zwei übereinander trägt. „Die Waage baut einen Wachturm an der Küste? Warum bewacht man das Meer?“
    Er zählt dir vier Silberlinge hin und sieht dich ernst an. „Zieh dir nicht die Waage zum Feind, Kind. Aber merk dir, was du gesehen hast.“
- 2:
    ~ silber += 3
    „Brauchbar“, sagt Orwin. „Die Wolke ist … künstlerisch.“ Er gibt dir drei Silberlinge.
- else:
    ~ silber += 2
    Orwin betrachtet das Blatt lange. Dann dreht er es um. Dann wieder zurück. „Für den Fleiß“, sagt er schließlich und gibt dir zwei Silberlinge.
}
~ auftraege += 1
-> p1_stadt


// ---------------------------------------------------------------------
// Auftrag: Der Botengang für die Leise Hand und Grumak, der Ork
// ---------------------------------------------------------------------
=== p1_markt
# karte: markt
# bild: szene/markt
Der Markt von Lysmara ist ein einziges buntes Durcheinander: Stoffballen, Fischkörbe, Käfige mit gackernden Hühnern und Gnomen-Spielzeug, das von selbst über die Tische hüpft.

An einer Ecke lehnt ein Junge mit tief ins Gesicht gezogener Mütze. Darauf ist ein kleines Zeichen aufgenäht: eine Hand, die einen Finger an die Lippen legt.

„Du bist der Bote?“ Er mustert dich. Dann Tickwort. „Mit Blechkatze?“

„Erklärautomat“, sagt Tickwort würdevoll.

„Egal.“ Der Junge drückt dir ein kleines, fest verschnürtes Päckchen in die Hand. „Ich bin Fink. Das geht zu Grumak, dem Gewürzhändler. Ork, großer Stand am Brunnen, kannst du nicht verfehlen. Nicht reinschauen, nicht trödeln, nicht quatschen. Drei Silberlinge, wenn er's hat.“

Tickwort flüstert: „Das Zeichen auf seiner Mütze. Die Leise Hand. Die Diebesgilde. Offiziell gibt es sie nicht.“ Pause. „Inoffiziell gibt es sie sehr.“
* [Das Päckchen nehmen und liefern]
    -> kontrolle
* [Das Päckchen nehmen und unterwegs heimlich hineinschauen]
    ~ paeckchen_geoeffnet = true
    -> hineinschauen
* {hintergrund == "botenlaeufer"} [(Botenläufer) „Eilzustellung kostet extra.“ (Ausstrahlung +1)]
    ~ temp e = probe(ausstrahlung + 1)
    ~ probe_zeile("Ausstrahlung +1", e)
    { e:
    - ERFOLG:
        ~ silber += 1
        Fink sieht dich an, als hätte er gerade in eine Zitrone gebissen. Dann grinst er und legt dir einen Silberling vorab hin. „Frech. Gefällt mir.“
    - JA_ABER:
        Fink grinst. „Frech. Gefällt mir. Aber nein.“
    - else:
        Fink kneift die Augen zusammen. „Noch so ein Spruch, und ich such mir einen anderen Boten.“
    }
    -> kontrolle
* [Das Päckchen nehmen und es zur Stadtwache bringen]
    ~ paeckchen_zur_wache = true
    -> wache

= hineinschauen
In einer Toreinfahrt löst du vorsichtig die Schnur. Im Päckchen liegen ein paar Silbermünzen und ein sorgfältig gefaltetes Stück Pergament.

Es ist eine Karte. Mit dünner Tinte ist ein Pfad eingezeichnet, der sich vom Rand der Weiden in Kehren hinauf in den Kharvan-Kamm windet. Nicht zum Nyrrspalt. Ganz woanders hin. An einer Stelle hoch oben steht ein einziges Wort: „Ziegenstiege“.
~ schmugglerpfad_gesehen = true

„Ein Schmugglerpfad“, flüstert Tickwort. „Über die Berge. Am Zoll vorbei.“ Sein Glasauge surrt. „Ich habe mir jede Linie gemerkt. Ich kann nicht anders.“

Du faltest alles wieder zusammen und knotest die Schnur, so gut es geht.
-> kontrolle

= kontrolle
# bild: szene/stadtwache
Auf halbem Weg zum Brunnen versperren zwei Stadtwachen die Gasse. „Kontrolle! Taschen auf!“
* [Ruhig bleiben und die Wachen bequatschen (Ausstrahlung)]
    ~ temp e = probe(ausstrahlung)
    ~ probe_zeile("Ausstrahlung", e)
    -> kontrolle_ergebnis(e)
* [Im Gedränge an ihnen vorbeischlüpfen (Geschick)]
    ~ temp e_b = probe(geschick)
    ~ probe_zeile("Geschick", e_b)
    -> kontrolle_ergebnis(e_b)
* {hintergrund == "strassenkind" || hintergrund == "botenlaeufer"} [({hintergrund == "strassenkind":Straßenkind|Botenläufer}) Kehrtmachen und durch die Hinterhöfe abkürzen]
    Du drehst um, bevor die Wachen dich richtig bemerken. Durch eine Hoftür, über eine Mauer, unter einer Wäscheleine voller Laken hindurch, und eine Minute später stehst du hinter dem Brunnen.
    Tickwort keucht. Das heißt, er pfeift sehr schnell.
    -> grumak

= kontrolle_ergebnis(e)
{ e:
- ERFOLG:
    „Wir sind Abgesandte des Verbands der Erklärautomaten“, sagst du mit fester Stimme. Tickwort beginnt sofort, den Verband zu erklären. Sehr ausführlich. Nach dem dritten Unterpunkt winken die Wachen euch genervt durch.
- JA_ABER:
    ~ aendern(ruf_stadtwache, -1)
    Ihr kommt durch. Aber eine der Wachen sieht dir lange nach und kritzelt etwas in ihr Notizbuch.
- else:
    ~ aendern(ruf_stadtwache, -1)
    Eine Wache greift nach deiner Tasche. Im letzten Moment stößt Tickwort einen schrillen Pfiff aus und eine Dampfwolke, die die halbe Gasse einhüllt. Ihr rennt. Hinter euch hustet und flucht es.
    „Das war“, keucht Tickwort, „vermutlich nicht ganz legal.“
}
-> grumak

= grumak
# karte: brunnen
# bild: figur/grumak
Grumaks Stand ist nicht zu übersehen. Unter einem rot-goldenen Sonnensegel stapeln sich Säcke mit Zimt, Pfeffer, Safran und Gewürzen, deren Namen du nicht kennst. Die Luft riecht so stark, dass Tickwort niest. Zumindest klingt es so.

Grumak selbst ist ein Ork, so groß wie ein Schrank, mit grauen Strähnen im Haar und kleinen goldenen Ringen in beiden Ohren. Er röstet Nüsse über einer Kohlenpfanne. Viele seiner Säcke sind nur noch halb voll.
{ volk == "ork" || volk == "troll":
    Als er dich sieht, legt er die Faust auf die Brust. „Gor'ash, {volk_wort()}. Gut, ein Gesicht aus den Clans zu sehen.“
- else:
    Er hebt eine Augenbraue. „Was willst du? Pfeffer? Zimt? Viel hab ich nicht mehr.“
}

Du gibst ihm das Päckchen.
{ paeckchen_geoeffnet:
    -> ertappt
}
-> geliefert

= ertappt
Grumak dreht das Päckchen in seinen riesigen Händen. Dann sieht er die Schnur. Und dich.

„Der Knoten“, sagt er ruhig, „ist nicht der von Fink.“
* [Ehrlich sein: „Ich habe hineingeschaut.“]
    ~ aendern(ruf_leise_hand, -1)
    Grumak brummt. „Ehrlich. Selten. Gefällt mir.“ Er legt den Kopf schief. „Aber Fink wird es nicht gefallen. Die Leise Hand mag keine Neugierigen.“
* [Abstreiten (Ausstrahlung)]
    ~ temp e = probe(ausstrahlung)
    ~ probe_zeile("Ausstrahlung", e)
    { e:
    - ERFOLG:
        „Fink hatte es eilig“, sagst du. „Der Knoten ging unterwegs auf, ich habe ihn neu gebunden.“
        Grumak sieht dich lange an. Dann zuckt er die Schultern. „Kann passieren.“
    - JA_ABER:
        ~ aendern(ruf_leise_hand, -1)
        „Fink hatte es eilig“, sagst du. „Der Knoten ging unterwegs auf.“
        Grumak brummt. „Vielleicht.“ Er dreht das Päckchen noch einmal hin und her. „Aber Fink wird trotzdem fragen, wer seinen Knoten neu gebunden hat.“
    - else:
        ~ aendern(ruf_leise_hand, -2)
        Grumak lacht, tief und dröhnend. „Netter Versuch.“ Dann wird er ernst. „Fink wird davon hören.“
    }
- -> geliefert

= geliefert
~ paeckchen_geliefert = true
~ aendern(ruf_leise_hand, 1)
~ silber += 3
Grumak öffnet das Päckchen, legt dir drei Silberlinge auf die Hand und steckt den Rest weg, ohne hinzusehen.
-> grumak_erzaehlt

= grumak_erzaehlt
~ grumak_gewarnt = true
Dann drückt er dir eine Handvoll gerösteter Nüsse in die Hand. Sie sind noch heiß.
* [Die Hände über der Kohlenpfanne wärmen]
    ~ neigung_feuer += 1
    Du hältst die Hände über die glühenden Kohlen. Die Hitze kribbelt in deinen Fingern, und für einen Moment scheinen die Kohlen heller aufzuglühen, als hätten sie dich bemerkt. Grumak sieht dich von der Seite an, sagt aber nichts.
* [Die Nüsse essen und zuhören]
    Die Nüsse schmecken nach Zimt und Rauch.
- „Drei Wochen war ich unterwegs, von Kar Duun bis hierher“, sagt Grumak und schaut nach Osten, wo die Berge als graue Linie über den Dächern stehen. „Die Dörfer an der Straße? Leer. Nicht verbrannt, nicht geplündert. Einfach leer. Die Türen offen, das Essen auf dem Tisch.“

Er schüttelt den Kopf.

„Und die Gnolle ziehen nach Süden. Ganze Stämme. Gnolle ziehen immer umher, ja. Aber nicht so. Nicht so schnell.“ Er dreht eine Nuss zwischen den Fingern. „So rennt man nur, wenn etwas hinter einem her ist.“

„Was denn?“, fragst du.

„Wenn ich das wüsste, würde ich nicht hier Pfeffer verkaufen.“ Er lacht, aber es klingt nicht fröhlich. „Und jetzt erzählt man sich, die Waage will den Spalt dichtmachen. Wegen der Gnolle.“ Er schnaubt. „Gnolle. Pah.“
~ auftraege += 1
-> p1_stadt

= wache
# karte: wachhaus
Die Wachstube der Stadtwache liegt gleich neben dem Markt. Hauptfrau Hallward, eine kräftige Frau mit kurz geschorenem Haar, nimmt das Päckchen entgegen und öffnet es ohne Zögern.

Silbermünzen. Und ein gefaltetes Stück Pergament mit einer Karte. Sie runzelt die Stirn.

Mit dünner Tinte ist ein Pfad eingezeichnet, der sich vom Rand der Weiden hinauf in den Kharvan-Kamm windet. Hoch oben steht ein einziges Wort: „Ziegenstiege“. Tickworts Glasauge surrt leise.

„Ein Pfad über die Berge. Am Zoll vorbei.“ Hallward sieht dich an. „Das war klug von dir. Oder sehr dumm. Die Leise Hand vergisst so etwas nicht.“
~ schmugglerpfad_gesehen = true
~ aendern(ruf_stadtwache, 1)
~ aendern(ruf_leise_hand, -2)
~ silber += 2

Sie schiebt dir zwei Silberlinge hin. „Finderlohn.“ Dann senkt sie die Stimme. „Und ein Rat: Halte dich von der Goldenen Waage fern. Seit ein paar Tagen gehen ihre Leute in der Ratshalle ein und aus, als gehöre es ihnen. Vielleicht tut es das bald.“

Draußen vor dem Fenster siehst du Fink. Er sieht dich auch. Dann ist er in der Menge verschwunden.

Auf dem Rückweg kommst du am Brunnen vorbei. Dort streitet ein riesiger Ork mit grauen Strähnen lautstark mit einer Kundin.
~ grumak_gewarnt = true
„Leer, sag ich dir! Alle Dörfer hinter den Bergen! Und die Gnolle rennen nach Süden, als wäre ihnen etwas auf den Fersen!“ Er wirft die Hände in die Luft. „Und jetzt heißt es, die Waage will den Spalt dichtmachen. Wegen der Gnolle! Pah!“
~ auftraege += 1
-> p1_stadt


// ---------------------------------------------------------------------
// Begegnung: Liora bzw. Cassian fällt vom Himmel
// ---------------------------------------------------------------------
=== p1_freund
# karte: oberstadt
# bild: szene/freund-faellt-{freund_kurz()}
Der Weg führt am Rand der Oberstadt entlang, wo die Häuser aus hellem Stein sind und die Gärten hinter hohen Mauern liegen. Hier riecht es nach Rosen statt nach Fisch.

Gerade gehst du an einer besonders hohen Mauer vorbei, als über dir ein Ast knackt.

Dann fällt jemand vom Himmel.

Genauer gesagt: aus einem Apfelbaum, über die Mauer und mitten in den Obstkarren eines Gnomen-Händlers, der gerade vorbeituckert. Äpfel spritzen in alle Richtungen.

# bild: figur/freund-{freund_kurz()}
Aus dem Apfelhaufen taucht ein Kopf auf. {fr_ist_m():Ein Junge|Ein Mädchen} in deinem Alter, mit Blättern im Haar, einem zerrissenen Ärmel aus feinstem Stoff und einem breiten Grinsen.

„Hallo“, sagt {fr_er()}. „Schöner Tag, oder?“

Hinter der Mauer ruft eine aufgeregte Stimme: „{freund()}! Die Rechenstunde ist noch nicht vorbei!“

Das Grinsen verschwindet. „Magister Pell. Schnell, versteck mich!“
* [{freund()} unter die Äpfel schieben und den Lehrer ablenken (Ausstrahlung)]
    ~ temp e = probe(ausstrahlung)
    ~ probe_zeile("Ausstrahlung", e)
    -> verstecken(e)
* [{freund()} an der Hand packen und wegrennen (Geschick)]
    ~ temp e_b = probe(geschick)
    ~ probe_zeile("Geschick", e_b)
    -> wegrennen(e_b)
* [„Das ist nicht mein Problem.“]
    ~ aendern(beziehung_freund, -1)
    „Doch, jetzt schon“, sagt {freund()} und springt aus dem Karren. „Du stehst nämlich direkt neben mir.“
    -> chaos

= verstecken(e)
{ e:
- ERFOLG:
    ~ aendern(beziehung_freund, 1)
    Ein Kopf mit Brille erscheint über der Mauer. „Hast du hier jemanden gesehen? So groß, frech, Blätter im Haar?“
    „Da lang!“, rufst du und zeigst in die falsche Richtung. „Zum Hafen. Sehr schnell. Mit einem Hund.“
    „Mit einem Hund?“ Der Kopf verschwindet. Unter den Äpfeln kichert es.
- JA_ABER:
    Du schickst den Lehrer in die falsche Richtung, und er glaubt dir. Aber der Gnom, dem der Karren gehört, hat alles mitangehört. Und er glaubt dir gar nichts. „Meine Äpfel!“, kreischt er.
- else:
    Magister Pell erscheint über der Mauer. Er sieht dich, er sieht den Apfelhaufen, er sieht den Schuh, der aus dem Apfelhaufen ragt. „Aha“, sagt er und verschwindet, um das Tor zu suchen.
}
-> chaos

= wegrennen(e)
{ e:
- ERFOLG:
    ~ aendern(beziehung_freund, 1)
    Du packst {freund()} an der Hand, und ihr rennt. Um eine Ecke, durch einen Torbogen, eine Treppe hinunter. Hinter euch verhallen die Rufe. Ihr lehnt euch keuchend an eine Hauswand und müsst lachen, bis euch die Seiten wehtun.
- JA_ABER:
    Ihr rennt los, und Magister Pell verliert euch aus den Augen. Aber {freund()} tritt beim Absprung gegen einen Hebel am Obstkarren.
- else:
    Ihr rennt los. {freund()} stolpert über einen Apfel, du stolperst über {freund()}, und ihr landet beide der Länge nach auf dem Pflaster.
}
-> chaos

= chaos
Und dann geht etwas schief. Natürlich.

Hinter euch klackt es. Der Obstkarren des Gnoms ist ein Dampfkarren mit einem kleinen Kessel, und irgendwie hat sich seine Bremse gelöst. Langsam, dann immer schneller, rollt er die steile Gasse hinunter. Richtung Markt. Zischend, ratternd, Äpfel spuckend.

„Oh nein“, sagt {freund()}. „Das passiert mir ständig.“
* [Hinterherrennen und den Karren aufhalten (Kraft)]
    ~ temp e = probe(kraft)
    ~ probe_zeile("Kraft", e)
    { e:
    - ERFOLG:
        ~ obstkarren_gestoppt = true
        ~ aendern(beziehung_freund, 1)
        Du holst den Karren ein, stemmst dich mit aller Kraft dagegen, und mit einem letzten Zischen kommt er zum Stehen. Einen Schritt vor einem Stand mit sehr teurem Porzellan.
        Der Gnom kommt angerannt und umarmt seinen Karren. Dann, nach kurzem Zögern, auch dich.
    - JA_ABER:
        ~ obstkarren_gestoppt = true
        Du bekommst den Karren zu fassen und bremst ihn ab. Er hält. Du auch. Allerdings erst, nachdem du dich einmal komplett in Apfelmus gewälzt hast.
    - else:
        Du rennst, du greifst, du verfehlst. Der Karren rattert weiter und landet mit einem gewaltigen Platschen im Marktbrunnen. Äpfel schwimmen wie kleine rote Enten.
    }
* [Auf Tickwort hören und das richtige Ventil finden (Verstand)]
    „Dampfventil, rechts, roter Griff!“, ruft Tickwort. „Dann den Bremshebel zweimal ziehen, nicht einmal, auf keinen Fall einmal, denn einmal bedeutet …“
    ~ temp e_b = probe(verstand)
    ~ probe_zeile("Verstand", e_b)
    { e_b:
    - ERFOLG:
        ~ obstkarren_gestoppt = true
        ~ aendern(beziehung_tickwort, 1)
        Du hörst nur den ersten Satz, und der reicht. Roter Griff, zweimal ziehen. Der Karren stößt einen langen, beleidigten Pfiff aus und bleibt stehen.
        „… und das hätte ich dann noch erklärt“, sagt Tickwort zufrieden.
    - JA_ABER:
        ~ obstkarren_gestoppt = true
        Roter Griff, das hast du gehört. Dann ziehst du den Bremshebel. Einmal.
        Der Karren bleibt so plötzlich stehen, dass alle Äpfel auf einmal nach vorn fliegen, über das Pflaster und mitten in einen Stand mit frisch gewaschener Wäsche.
        „… denn einmal bedeutet: Vollbremsung“, beendet Tickwort seinen Satz.
    - else:
        Bis Tickwort beim vierten Unterpunkt angekommen ist, ist der Karren schon im Marktbrunnen gelandet. Mit einem gewaltigen Platschen.
        „… und dann hätte man ihn angehalten“, beendet Tickwort leise seinen Satz.
    }
* [In einem Hauseingang abwarten, bis es vorbei ist]
    Ihr drückt euch in einen Hauseingang. Der Karren rattert vorbei und landet mit einem gewaltigen Platschen im Marktbrunnen.
- -> nach_chaos

= nach_chaos
{ not obstkarren_gestoppt:
    Der Gnom tobt. {freund()} läuft rot an, zieht eine Münze aus der Tasche und drückt sie ihm in die Hand. Der Gnom verstummt mitten im Satz.
    Es ist eine Goldmünze. Einfach so.
}
-> kennenlernen

= kennenlernen
~ freund_getroffen = true
Später sitzt ihr auf einer Treppe am Rand der Oberstadt. {freund()} pflückt sich Blätter aus den Haaren.

„Ich bin {freund()}“, sagt {fr_er()}. „Einfach {freund()}.“

„Und deine Familie?“

„Ist im Handel.“ {freund()} verdreht die Augen. „Furchtbar langweilig. Zahlen, Zahlen, Zahlen. Sie wollen, dass ich lerne, wie man Silber zählt. Ich will lernen, wie man über Berge klettert.“

Dann sieht {fr_er()} Tickwort zum ersten Mal richtig an, und die Augen von {freund()} werden riesig. „Ist das ein Erklärautomat? Ein echter? Dritte Baureihe?“

Tickworts Messingbacken laufen rötlich an. Das sollte bei Messing eigentlich gar nicht gehen.

„Was erklärst du so?“, fragt {freund()}.

„Alles“, sagt Tickwort.

„Alles!“, ruft {freund()} begeistert. „Wie wunderbar!“

Du erzählst, warum du Silber sammelst. Dass du durch den Nyrrspalt musst.

{freund()} wird plötzlich still. „Durch den Spalt?“, fragt {fr_er()} langsam. „Mein Vater hat gestern beim Abendessen gesagt, da gehe bald gar nichts mehr durch.“ {freund()} zuckt mit den Schultern, aber es sieht nicht ganz echt aus. „Er redet viel, wenn der Tag lang war.“

Dann leuchten die Augen von {freund()} wieder auf. „Aber wenn du gehst … nimm mich mit. Bitte. Ich kann klettern! Ich kann … also, ich kann wirklich gut klettern.“
* [„Klar. Zu zweit ist es weniger langweilig.“]
    ~ freund_will_mit = true
    ~ aendern(beziehung_freund, 1)
    {freund()} strahlt so sehr, dass du blinzeln musst.
* (gefaehrlich) [„Das ist gefährlich. Du solltest zu Hause bleiben.“]
    „Gefährlich?“ {freund()} grinst. „Endlich.“
* [„Ich kenne dich doch gar nicht.“]
    „Noch nicht“, sagt {freund()}. „Aber das ändert sich gerade.“
- Irgendwo schlägt eine Glocke. {freund()} springt auf. „Magister Pell! Wenn ich zum Abendessen nicht zurück bin, schicken sie die halbe Stadtwache.“

Schon halb die Treppe hoch, dreht {fr_er()} sich noch einmal um. „Wir sehen uns!“

Dann ist {fr_er()} weg.

„Bemerkenswert“, sagt Tickwort. „Hat mich nicht unterbrochen. Kein einziges Mal.“
-> p1_stadt
