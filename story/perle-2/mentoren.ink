// =====================================================================
// Perle 2 – Beim Mentor: erster Zauber, Quelle, ein Hinweis auf den Weg hinaus
// Jeder Mentor bringt zwei kleine Zauber bei:
//   1. mit starkem Element in der Nähe (Umgebung +1)
//   2. ohne Element, mit einer Quelle (Wind braucht keine)
// Danach sind die Kraftfunken verbraucht – Lektion „Rasten“.
// =====================================================================

=== p2_mentor
„Ich warte an der Orinbrücke auf dich“, sagt {freund()}. „Ich glaube, das ist etwas, das man allein machen muss.“
{ element:
- "erde":
    -> p2_borrik
- "wasser":
    -> p2_nerelle
- "feuer":
    -> p2_yrsa
- else:
    -> p2_vael
}


// ---------------------------------------------------------------------
// ERDE – Borrik, der Steinmetz
// ---------------------------------------------------------------------
=== p2_borrik
# karte: steinmetzhof
# bild: figur/borrik
Das Zwergenviertel liegt am Hang über dem Fluss. Die Häuser sind niedrig und aus grauem Stein, und aus jedem Hof klingt das Pling-Pling von Meißeln.

Am Steinmetzhof sitzt ein uralter Zwerg auf einem Felsblock. Sein weißer Bart ist so lang, dass er ihn in den Gürtel gesteckt hat. Seine Augen sind milchig weiß. Er ist blind. Trotzdem dreht er den Kopf genau in deine Richtung, bevor du ein Wort gesagt hast.
{ volk == "zwerg":
    „Steinfest, Kind des Berges“, brummt er. „Lange {geschlecht == "w":keine junge Zwergin|keinen jungen Zwerg} mehr hier gehabt, {geschlecht == "w":die|der} so leise schleicht.“
- else:
    „Du trittst auf wie jemand, der etwas will“, brummt er. „Also. Was willst du?“
}

„Yrsa schickt mich“, sagst du leise.

Der alte Zwerg schweigt. Dann legt er die flache Hand auf den Felsblock, als würde er ihm zuhören. „Ah“, sagt er. „Die Steine haben es mir schon erzählt. Heute Mittag hat jemand am Fluss gerufen. Laut. Sehr laut.{element_erkannt != "erde": Nicht die Erde. Aber die Erde hat zugehört.}“ Er grinst in seinen Bart. „Borrik. So heiße ich. Setz dich.“
{ erzmarke:
    Er schnuppert. „Du trägst Erz aus den Minen. Eine Marke.“ Seine Finger tasten nach deiner Tasche. „Grisks Zeichen. Die Kobolde vertrauen dir. Das ist mehr wert als jedes Gold.“
}

„Augen“, sagt Borrik, „sind etwas für Leute, die nicht zuhören. Erde sieht man nicht. Erde hört man. Sie ist geduldig. Sie hat alle Zeit der Welt. Du musst nicht schreien wie heute Mittag. Du musst bitten.“

Er hält dir einen Kiesel hin. „Bitte ihn, aufzustehen.“
+ [Den Kiesel bitten zu schweben (Zauber)]
    ~ temp z = zauber(1)
    ~ probe_zeile("Zauber", z)
    { z:
    - ERFOLG:
        Du legst den Kiesel auf deine Handfläche und denkst ganz ruhig: Bitte. Der Kiesel zittert. Dann hebt er sich, eine Fingerbreite, zwei, und schwebt über deiner Hand wie eine kleine graue Wolke.
        „Gut“, brummt Borrik. „Sehr gut. Du hast gebeten, nicht befohlen.“
    - JA_ABER:
        Der Kiesel hebt sich. Und mit ihm alle anderen Kiesel im Hof, ein ganzer Schwarm, der um dich herumschwirrt wie aufgeschreckte Bienen, bevor er klappernd zu Boden fällt.
        Borrik lacht dröhnend. „Zu laut gebeten. Aber gebeten.“
    - else:
        Du denkst: Bitte. Der Kiesel tut nichts. Du denkst es lauter. Der Kiesel springt dir mit einem Ruck gegen die Stirn.
        „Autsch.“
        „Die Erde hat Humor“, sagt Borrik. „Das vergessen die meisten.“
    }
- -> quelle_lernen

= quelle_lernen
„Und jetzt das Wichtigste.“ Borrik zieht ein kleines Säckchen aus Leder aus seiner Schürze und drückt es dir in die Hand. Es ist schwer und kühl. „Erde vom Steinmetzhof. Wenn du irgendwo bist, wo kein Stein und kein Boden ist, auf einem Schiff, in einem Holzhaus, dann nimmst du davon. Eine Handvoll reicht für einen kleinen Ruf. Dann musst du es neu füllen.“
~ quelle = true

Er führt dich in seine Werkstatt. Der Boden ist aus dicken Holzdielen. „Hier gibt es keine Erde“, sagt er. „Nur das Säckchen. Bitte die Erde darin, mir diesen Becher zu reichen.“
+ [Mit der Erde aus dem Säckchen den Becher reichen (Zauber, mit Quelle)]
    ~ temp z2 = zauber(-1)
    ~ probe_zeile("Zauber", z2)
    { z2:
    - ERFOLG:
        Eine Handvoll Erde rieselt aus dem Säckchen, formt sich zu einer kleinen braunen Hand, greift den Becher und schiebt ihn Borrik zu. Dann zerfällt sie zu Staub.
    - JA_ABER:
        Die Erde formt eine Hand und greift den Becher. Sie reicht ihn Borrik. Dann kippt sie ihm den Becher über die Hose.
        „Humor“, brummt Borrik. „Ich sagte es ja.“
    - KEINE_KRAFT:
        Nichts passiert. Gar nichts.
    - else:
        Die Erde rieselt aus dem Säckchen und bleibt als kleiner Haufen auf den Dielen liegen. Sie hat dich nicht gehört.
    }
- -> leer

= leer
Plötzlich wird dir schwindelig. Du musst dich an der Werkbank festhalten.

„Leer“, sagt Borrik zufrieden. „So fühlt es sich an, wenn deine Kraft verbraucht ist. Zwei Rufe, mehr schaffst du noch nicht. Dann musst du rasten. Schlafen, essen, am Feuer sitzen. Und versuch nie, mehr zu rufen, als du hast. Die Erde nimmt sich sonst, was ihr fehlt.“
# tutorial: rasten
Er füllt dein Säckchen mit einer Handvoll Erde aus dem Hof nach.
~ quelle = true
-> weg

= weg
~ tiefe_stiege_bekannt = true
~ berg_brummt = true
Als du nach einem Weg durch die Berge fragst, legt Borrik wieder die Hand auf den Felsblock.

„Die Tiefe Stiege“, sagt er. „Zwerge haben sie gehauen, vor dreihundert Jahren. Sie führt unter dem ganzen Kharvan-Kamm hindurch. Mein Großvater hat mitgehauen.“ Er schweigt. „Aber seit dem Winter singt der Berg falsch. Ganz unten. Ich höre es jede Nacht. Ein Brummen, das nicht hierhergehört.“

Er dreht dir sein blindes Gesicht zu. „Wenn du dort hinunter willst, Kind, dann nicht allein. Und nicht ohne Freunde unter den Kobolden.“

„Komm morgen wieder“, sagt er. „Und übermorgen. Die Erde braucht Zeit. Du auch.“
->->


// ---------------------------------------------------------------------
// WASSER – Nerelle, die Kapitänin der Morgentau
// ---------------------------------------------------------------------
=== p2_nerelle
# karte: hafen
# bild: figur/nerelle
Am Liegeplatz sieben liegt ein altes Schiff mit grauen Segeln. Auf dem Bug steht in verblassten Buchstaben: Morgentau. Es schaukelt nicht, obwohl alle Schiffe um es herum auf den Wellen tanzen.

An der Reling steht eine große Frau mit silbergrünem Haar, barfuß, in einem Mantel, der aussieht, als wäre er aus Seetang genäht.
{ hintergrund == "schiffsjunge":
    „Dich kenne ich“, sagt sie, bevor du etwas sagen kannst. „Du kletterst bei Rhea in der Takelage herum. Rhea hat mir einmal das Leben gerettet. Komm an Bord.“
- else:
    „Yrsa schickt dich“, sagt sie, bevor du etwas sagen kannst. „Ich habe es am Wasser gemerkt. {element_erkannt == "wasser":Heute Mittag hat jemand den Mühlgraben gerufen, und die ganze Bucht hat es gespürt.|Heute Mittag hat am Fluss jemand ein Element gerufen. Und das Wasser in der Bucht hat sich danach umgedreht, als hätte es dich gesucht.} Komm an Bord.“
}

„Ich bin Nerelle“, sagt sie, als du auf dem Deck stehst. „Und ich verlasse dieses Schiff nicht. Niemals. Ich habe dem Meer ein Versprechen gegeben. Solange ich an Bord bleibe, bleibt die Bucht ruhig.“ Sie lächelt. „Frag nicht, was passiert, wenn ich es breche. Ich möchte es selbst nicht wissen.“

Sie stellt einen Eimer mit Meerwasser vor dich hin.

„Wasser hört nicht auf Befehle“, sagt Nerelle. „Es folgt. Du musst ihm einen Weg zeigen. Zeig ihm, wie man eine Kugel ist.“
+ [Das Wasser zu einer Kugel formen (Zauber)]
    ~ temp z = zauber(1)
    ~ probe_zeile("Zauber", z)
    { z:
    - ERFOLG:
        Du hältst die Hand über den Eimer und stellst dir eine Kugel vor. Das Wasser hebt sich, dreht sich, rundet sich und schwebt als glitzernde Kugel vor deinem Gesicht. Darin spiegelt sich der ganze Himmel.
        „Schön“, sagt Nerelle leise. „Wirklich schön.“
    - JA_ABER:
        Das Wasser hebt sich zu einer Kugel. Eine sehr große Kugel. Dann zerplatzt sie, und du bist von oben bis unten nass.
        Nerelle lacht. „Das Wasser mag dich. Es wollte dich umarmen.“
    - else:
        Das Wasser im Eimer kräuselt sich. Dann springt ein kleiner Fisch heraus, von dem du nicht wusstest, dass er drin war, und klatscht dir ins Gesicht.
        „Auch eine Antwort“, sagt Nerelle.
    }
- -> quelle_lernen

= quelle_lernen
Nerelle reicht dir einen kleinen Schlauch aus Robbenleder, verschlossen mit einem Korken. Er gluckert.
~ quelle = true
„Ein Wasserschlauch. Für Orte, an denen kein Wasser ist. Ein Schluck reicht für einen kleinen Ruf. Dann musst du ihn neu füllen.“

Sie führt dich in ihre Kajüte. Alles ist trocken hier, Holz und Papier und Kerzen. „Hier unten gibt es kein Wasser. Nur deinen Schlauch. Lass einen Tropfen für mich tanzen.“
+ [Einen Tropfen aus dem Schlauch tanzen lassen (Zauber, mit Quelle)]
    ~ temp z2 = zauber(-1)
    ~ probe_zeile("Zauber", z2)
    { z2:
    - ERFOLG:
        Ein einzelner Tropfen steigt aus dem Schlauch und dreht sich vor Nerelles Nase im Kreis, schneller und schneller, bis er wie ein winziger Kreisel summt.
    - JA_ABER:
        Der Tropfen tanzt. Leider tanzt er direkt auf die Kerze zu und löscht sie mit einem Zischen.
    - KEINE_KRAFT:
        Nichts passiert. Gar nichts.
    - else:
        Der Schlauch gluckert. Sonst passiert nichts. Das Wasser darin hat dich nicht gehört.
    }
- -> leer

= leer
Plötzlich wird dir schwindelig, als würde das Schiff schwanken. Aber das Schiff liegt ganz still.

„Leer“, sagt Nerelle. „So fühlt es sich an, wenn deine Kraft verbraucht ist. Zwei Rufe, mehr schaffst du noch nicht. Dann musst du rasten. Schlafen, essen, dich wärmen. Und versuch nie, mehr zu rufen, als du hast. Das Wasser nimmt sich sonst, was ihm fehlt.“
# tutorial: rasten
Sie füllt deinen Schlauch mit Meerwasser nach.
~ quelle = true
-> weg

= weg
~ seeweg_bekannt = true
Als du nach einem Weg hinaus fragst, blickt Nerelle aufs Meer.

„Es gibt Kapitäne, die nachts ohne Laternen fahren“, sagt sie. „Um die Klippen herum, an der Küste entlang, bis jenseits der Berge. Das Meer kennt Wege, die keine Karte kennt.“
{ kuestenmauer_gesehen:
    „Aber die Waage baut an der Küste“, sagst du. „Ich habe eine neue Mauer gesehen. Und einen Wachturm.“
    Nerelle sieht dich überrascht an. „Dann weißt du mehr als die meisten. Ja. Die Waage will auch das Meer verschließen. Bald wird es auch auf dem Wasser keinen Weg mehr geben.“
- else:
    „Aber die Waage baut neue Türme an der Küste. Bald wird es auch auf dem Wasser keinen Weg mehr geben.“
}

„Komm morgen wieder“, sagt sie. „Und übermorgen. Wasser lernt man nicht an einem Tag.“
->->


// ---------------------------------------------------------------------
// FEUER – Yrsa, die Schmiedin
// ---------------------------------------------------------------------
=== p2_yrsa
# karte: grosse-schmiede
# bild: figur/yrsa
Am Abend, als die anderen Schmiede nach Hause gegangen sind, ist die Große Schmiede still. Nur die Esse glüht noch.

Yrsa wartet auf dich. „Feuer“, sagt sie, „will immer mehr. Mehr Holz, mehr Luft, mehr alles. Das Wichtigste beim Feuer ist nicht, es zu rufen. Sondern ihm zu sagen, wann es genug ist.“

Sie deutet auf die Glut. „Mach mir einen Vogel. Einen kleinen.“
+ [Einen Vogel aus Flammen formen (Zauber)]
    ~ temp z = zauber(1)
    ~ probe_zeile("Zauber", z)
    { z:
    - ERFOLG:
        Du streckst die Hand aus. Eine Flamme löst sich aus der Glut, faltet sich, bekommt Flügel und flattert als kleiner, leuchtender Vogel durch die Schmiede. Er dreht eine Runde um Yrsas Kopf und verglimmt dann in der Esse.
        Yrsa schweigt lange. „Ich habe dreißig Jahre gebraucht, bis mir ein Vogel gelungen ist“, sagt sie dann.
    - JA_ABER:
        Ein Flammenvogel steigt aus der Glut. Er ist sehr groß, sehr hell und sehr begeistert. Er fliegt dreimal durch die Schmiede und versengt dabei einen Besen.
        „Du musst ihm sagen, wann es genug ist“, wiederholt Yrsa trocken und tritt die Glut am Besen aus.
    - else:
        Die Glut faucht. Eine Stichflamme schießt hoch, und für einen Moment riecht es nach verbrannten Haaren. Deinen Haaren.
        „Genug“, sagt Yrsa. „Das ist das Wort, das du lernen musst.“
    }
- -> quelle_lernen

= quelle_lernen
Yrsa gibt dir eine kleine Laterne aus Messing, kaum größer als eine Faust. Darin glimmt ein Stück Kohle.
~ quelle = true
„Eine Glutlaterne. Für Orte ohne Feuer. Die Glut darin reicht für einen kleinen Ruf. Dann musst du sie neu füllen.“

Sie geht mit dir hinaus auf den Hof. Es ist kühl, und nirgendwo brennt ein Licht. Sie stellt eine Kerze auf den Brunnenrand. „Hier gibt es kein Feuer. Nur deine Laterne. Zünde diese Kerze an.“
+ [Mit der Glut aus der Laterne die Kerze anzünden (Zauber, mit Quelle)]
    ~ temp z2 = zauber(-1)
    ~ probe_zeile("Zauber", z2)
    { z2:
    - ERFOLG:
        Ein Funke springt aus der Laterne, tanzt durch die Luft und setzt sich auf den Docht. Die Kerze brennt ruhig und gerade.
    - JA_ABER:
        Ein Funke springt aus der Laterne und zündet die Kerze an. Dann den Docht der zweiten Kerze, die Yrsa noch in der Tasche hatte. Durch den Stoff hindurch.
    - KEINE_KRAFT:
        Nichts passiert. Gar nichts.
    - else:
        Die Glut in der Laterne flackert auf. Und erlischt.
    }
- -> leer

= leer
Plötzlich wird dir schwindelig. Du musst dich am Brunnenrand festhalten.

„Leer“, sagt Yrsa. „So fühlt es sich an, wenn deine Kraft verbraucht ist. Zwei Rufe, mehr schaffst du noch nicht. Dann musst du rasten. Schlafen, essen, still sitzen. Und versuch nie, mehr zu rufen, als du hast. Das Feuer nimmt sich sonst, was ihm fehlt.“
# tutorial: rasten
Sie legt ein neues Stück Kohle in deine Laterne.
~ quelle = true
-> weg

= weg
~ vardholm_hinweis = true
Als du nach einem Weg hinaus fragst, sieht Yrsa in die Esse.

„Seit einem Monat schmiede ich für Vardholm“, sagt sie. „Torbeschläge, Gitter, Ketten. Und Halterungen. Hunderte. Kleine eiserne Körbe, genau so groß wie ein Apfel.“
{ kugeln_verstanden:
    Du verstehst sofort. „Für die Glaskugeln.“
    Yrsa nickt langsam. „Für die Glaskugeln. Die Waage baut in Vardholm keine Mauern gegen Gnolle, Kind. Sie baut einen Speicher.“
- else:
    Sie runzelt die Stirn. „Ich weiß nicht, wofür. Aber eine Festung, die sich gegen Gnolle schützen will, braucht Mauern. Keine Körbchen.“
}
„Die Karren mit meinen Lieferungen fahren jede Woche nach Vardholm. Die Wachen am Tor schauen kaum hinein. Sie kennen den Fuhrmann.“ Sie sieht dich an. „Nur damit du es weißt.“

„Komm morgen wieder“, sagt sie. „Und übermorgen. Feuer ist ungeduldig. Du darfst es nicht sein.“
->->


// ---------------------------------------------------------------------
// WIND – Vael, der Einsiedler im Leuchtturm
// ---------------------------------------------------------------------
=== p2_vael
# karte: klippen-von-ahrn
# bild: figur/vael
{p1_feder:Der Weg zu den Klippen von Ahrn kommt dir heute kürzer vor.|Der Weg führt aus der Stadt hinaus, über Schafweiden und steil bergauf zu den Klippen von Ahrn. Trotzdem kommt er dir kurz vor.} Vielleicht, weil der Wind dich die ganze Zeit von hinten schiebt.

Vor dem Leuchtturm hängt {p1_feder:noch immer }ein Schild: „KEIN ZUTRITT. KEIN INTERESSE. KEINE AUSNAHMEN.“
{ leuchtturm_geklopft:
    Bevor du klopfen kannst, rasselt die Kette von selbst zu Boden, und die Tür schwingt auf. Von oben ruft eine heisere Stimme: „Du schon wieder. Der Klopfer. Komm hoch.“
- else:
    Du hebst die Hand, um zu klopfen. Da rasselt die Kette von selbst zu Boden, und die Tür schwingt auf. Von oben ruft eine heisere Stimme: „Hör auf zu zögern. Komm hoch.“
}

Die Treppe windet sich zweihundert Stufen nach oben. Ganz oben, in der Laternenkammer, sitzt ein dürrer alter Mann mit Haaren wie Pusteblumenflaum. Er sieht dich an, als wärst du ein Gespenst.

„Wind“, sagt er. „Bei einem Kind. Seit vierzig Jahren keiner.“ Er schüttelt den Kopf. „Vael. Ich rede nicht viel. Hör gut zu.“

„Wind kann man nicht festhalten. Nur einladen.“ Er öffnet ein Fenster, und der Seewind fährt herein. Er legt eine Möwenfeder auf den Tisch. „Lad ihn ein. Zum Tanzen.“
+ [Den Wind einladen, mit der Feder zu tanzen (Zauber)]
    ~ temp z = zauber(1)
    ~ probe_zeile("Zauber", z)
    { z:
    - ERFOLG:
        Du öffnest die Hand, nicht die Faust. Der Wind kommt. Er hebt die Feder auf, wirbelt sie herum, lässt sie Kreise und Spiralen fliegen, und legt sie dann sanft zurück auf den Tisch.
        Vael nickt. Einmal. Bei ihm ist das wahrscheinlich ein Applaus.
    - JA_ABER:
        Der Wind kommt. Er hebt die Feder auf. Und alle Papiere auf dem Tisch. Und Vaels Mütze. Alles wirbelt durch die Kammer und segelt zum Fenster hinaus.
        Vael schaut seiner Mütze nach. „Gut eingeladen“, sagt er. „Zu gut.“
    - else:
        Du rufst den Wind. Der Wind kommt nicht. Stattdessen schlägt das Fenster zu, so laut, dass ihr beide zusammenzuckt.
        „Gerufen“, sagt Vael. „Nicht eingeladen. Nochmal. Irgendwann.“
    }
- -> zweiter

= zweiter
„Wind braucht keine Quelle“, sagt Vael. „Er ist überall. Das ist das Schöne.“ Er hält inne. „Und das Schwere. Er hört auch überall zu.“

Er geht mit dir die Treppe hinunter. Auf jeder zehnten Stufe brennt eine Kerze. „Lösch sie“, sagt er. „Eine nach der anderen. Ohne zu pusten.“
+ [Den Wind die Treppe hinunterschicken (Zauber)]
    ~ temp z2 = zauber(0)
    ~ probe_zeile("Zauber", z2)
    { z2:
    - ERFOLG:
        Ein feiner Luftzug läuft vor dir die Treppe hinab, und eine Kerze nach der anderen erlischt mit einem leisen Pff. Pff. Pff. Bis ganz unten.
    - JA_ABER:
        Die Kerzen gehen aus. Alle auf einmal. Und die Tür unten fliegt mit einem Knall auf.
    - KEINE_KRAFT:
        Nichts passiert. Gar nichts.
    - else:
        Die Flammen flackern. Dann brennen sie ruhig weiter, als wollten sie dich auslachen.
    }
- -> leer

= leer
Plötzlich wird dir schwindelig. Du musst dich am Geländer festhalten.

„Leer“, sagt Vael. „Zwei Rufe. Mehr noch nicht. Dann rasten. Und nie mehr rufen, als du hast. Der Wind nimmt sich sonst, was ihm fehlt. Den Atem.“
# tutorial: rasten
Er drückt dir eine lange graue Feder in die Hand. „Sturmvogel. Damit der Wind dich erkennt.“
-> weg

= weg
~ ziegenstiege_bewacht = true
Als du nach einem Weg durch die Berge fragst, deutet Vael aus dem Fenster nach Osten, wo der Kharvan-Kamm im Abendlicht glüht.

„Ich sehe alles von hier oben“, sagt er. „Die Ziegenstiege. Über die Gipfel. Seit einer Woche brennen dort Fackeln. Nachts. Die Waage.“

Er schweigt. Dann, zum ersten Mal, lächelt er. „Aber der Wind kennt Wege, die keine Ziege kennt.“

„Komm morgen wieder“, sagt er. „Und übermorgen. Und bring keinen Besuch mit.“
->->
