// =====================================================================
// Perle 3 – Prüfung bei Webstuhl und Amboss: Das stumme Rad
// Das große Wasserrad der Tuchhalle bleibt stehen. Wer findet die
// Ursache, wer bringt es wieder zum Laufen? (Sabotage des Kontors)
// =====================================================================

=== p3_webstuhl
~ pruefungen += 1
# karte: tuchhalle
# bild: szene/tuchhalle-pruefung
In der Tuchhalle warten schon ein Dutzend Bewerber. Weberkinder, ein Schmiedelehrling mit Brandnarben an den Fingern und ein Gnomenjunge, der unablässig seine Schutzbrille putzt. Dazu eine junge Zwergin mit zwei dicken Zöpfen. Sie stellt sich als Hulda vor.

Meister Kettrich steht auf seinem Podest und mustert euch durch seine drei Brillengläser.
{ ruf_webstuhl_amboss > 0:
    Als er dich sieht, nickt er knapp. „Du. {geschlecht == "w":Die|Der} mit den Fragen. Gut. Fragen sind heute erlaubt.“
}

„Regel eins der Gilde“, sagt er. „Erst arbeiten, dann gehören. Die Prüfung ist einfach. Ihr arbeitet einen Tag in dieser Halle. Wer sich bewährt …“

Da passiert es.

Das Wumm, wumm, wumm, das die ganze Halle erfüllt, stockt. Die Webstühle rattern langsamer, langsamer, dann stehen sie still. Hunderte Weberinnen heben gleichzeitig den Kopf. Es ist plötzlich so leise, dass man eine Spindel fallen hört.

„Das große Rad“, flüstert Hulda.

Kettrich wird blass. Dann reißt er sich zusammen und klatscht in die Hände. „Neue Prüfung! Wer das Rad wieder zum Laufen bringt, hat bestanden. Los!“

Die Bewerber stürzen zur Tür.
-> ursache

= ursache
Das große Rad steht am Mühlgraben hinter der Halle, so hoch wie drei Häuser übereinander. Es rührt sich nicht. Das Wasser staut sich davor und schäumt wütend gegen die Schaufeln.

Hulda rennt zum Getriebehaus. Der Gnomenjunge zieht ein Werkzeug nach dem anderen aus seinen Taschen und weiß offenbar nicht, welches. Und du?
* [Auf den glitschigen Balken hinunter zum Mühlgraben klettern und nachsehen (Geschick)]
    ~ temp e = probe(geschick)
    ~ probe_zeile("Geschick", e)
    { e:
    - ERFOLG:
        Du kletterst über die nassen Balken hinunter, bis das Wasser dir um die Stiefel spritzt. Und da siehst du es: Zwischen den untersten Schaufeln und der Mauer klemmt ein Baumstamm. Um ihn herum ist eine schwere Kette gewickelt, und die Kette ist mit einem Tau an einem Eisenring in der Mauer festgezurrt.
        -> fund
    - JA_ABER:
        Du rutschst aus und landest bis zu den Knien im eiskalten Wasser. Aber von hier unten siehst du es: Zwischen Schaufeln und Mauer klemmt ein Baumstamm, mit einer Kette umwickelt und an einem Ring in der Mauer festgebunden.
        -> fund
    - else:
        Du rutschst auf dem zweiten Balken aus und hängst plötzlich an beiden Armen über dem schäumenden Graben. Bis du wieder oben bist, hat Hulda aus dem Getriebehaus gerufen: „Die Zahnräder sind heil! Es muss draußen etwas klemmen!“
        Ihr seht euch an. Dann rennt ihr beide los.
        -> loesen
    }
* [Im Getriebehaus die Zahnräder prüfen (Verstand)]
    ~ temp e2 = probe(verstand)
    ~ probe_zeile("Verstand", e2)
    { e2:
    - ERFOLG:
        Im Getriebehaus ist es dunkel und riecht nach Fett. Du fährst mit den Fingern über die Zähne der großen Räder. Kein Bruch, kein Span, nichts. Die Welle steht, aber sie ist nicht blockiert. Sie wird festgehalten. Von außen.
        Du rennst hinaus, beugst dich über das Geländer und siehst es sofort: Zwischen den untersten Schaufeln klemmt ein Baumstamm. Mit einer Kette umwickelt. Und mit einem Tau an der Mauer festgebunden.
        -> fund
    - JA_ABER:
        Du findest keinen Fehler im Getriebe. Aber Hulda auch nicht, und sie war zuerst da. „Draußen“, sagt sie, und ihr rennt beide hinaus. Von oben seht ihr einen Baumstamm zwischen den Schaufeln. Und eine Kette.
        -> loesen
    - else:
        Du steckst den Kopf in das Getriebe, und ein Tropfen schwarzes Fett landet genau auf deiner Nase. Als du ihn weggewischt hast, ist Hulda schon draußen und ruft: „Ein Baumstamm! Da unten klemmt ein Baumstamm!“
        -> loesen
    }
* {kann_zaubern(1) && element == "erde"} [Die Hand an die Mauer des Mühlgrabens legen und die Steine fragen (Zauber)]
    -> zauber_ursache
* {kann_zaubern(1) && element == "wasser"} [Die Hand ins gestaute Wasser halten und es fragen, was es aufhält (Zauber)]
    -> zauber_ursache
* {kann_zaubern(0) && element == "wind"} [Dem Wind zuhören, wie er um das Rad streicht (Zauber)]
    -> zauber_ursache

= zauber_ursache
~ temp u = 1
{ element == "wind":
    ~ u = 0
}
~ temp z = zauber(u + tipp_bonus())
~ probe_zeile("Zauber", z)
{ z:
- ERFOLG:
    { element:
    - "erde":
        Die Mauersteine sind alt und geduldig, und sie erzählen gern. Von einem schweren Gewicht, das gegen sie drückt, ganz unten. Holz. Und kaltes, hartes Eisen, das gegen sie schabt.
    - "wasser":
        Das Wasser drängt gegen deine Finger, wütend und ungeduldig. Du folgst seinem Drängen mit deinen Gedanken, hinunter, bis du spürst, was ihm im Weg ist: etwas Langes, Hartes, zwischen den Schaufeln eingeklemmt. Und darum herum etwas Kaltes, das klirrt.
    - else:
        Der Wind streicht um das Rad und singt dabei, hoch und dünn, wie über eine Flasche. An einer Stelle ganz unten bricht sein Lied ab. Dort ist etwas, das nicht dorthin gehört.
    }
    Du beugst dich über das Geländer. Zwischen den untersten Schaufeln klemmt ein Baumstamm. Mit einer Kette umwickelt. Und mit einem Tau an der Mauer festgebunden.
    -> fund
- JA_ABER:
    Du spürst, wo es klemmt: ganz unten, zwischen Schaufeln und Mauer. Leider spürt das der Gnomenjunge auch, denn er hat dir zugesehen und ruft laut: „Da unten! Wo {anrede() == "junge Dame":sie|er} hinstarrt!“
    -> loesen
- else:
    { element:
    - "erde":
        Die Mauer antwortet. Mit einem Stein, der sich lockert und dir vor die Füße fällt. Ihr seht beide verlegen aus, du und der Stein.
    - "wasser":
        Das gestaute Wasser springt dir in einem Schwall entgegen. Du bist nass bis auf die Haut.
    - else:
        Der Wind fährt in die Halle und weht hundert Garnrollen von einem Tisch. Ein Dutzend Weberinnen schreit gleichzeitig.
    }
    Bis du dich wieder gefasst hast, ruft Hulda: „Ein Baumstamm! Da unten klemmt ein Baumstamm!“
    -> loesen
}

= fund
Ein Baumstamm, der ins Wasser gefallen ist, das kann passieren. Aber ein Baumstamm, der mit einer Kette umwickelt und an der Mauer festgebunden ist?

Du siehst genauer hin. Das Tau ist mit einem sauberen Knoten an den Eisenring geknüpft. Und im Knoten steckt, festgeklemmt, eine kleine Silbermünze. Du kennst diese Münze. Du hast sie auf Fesks Kragen gesehen.

Das Zeichen des Silbermark-Kontors.
~ sabotage_entdeckt = true

Du ziehst die Münze aus dem Knoten und steckst sie ein. Ein Beweis ist ein Beweis.
-> loesen

= loesen
Der Stamm sitzt fest. Das Wasser drückt ihn immer tiefer zwischen die Schaufeln. Die anderen Bewerber stehen ratlos am Geländer.
* [Eine Brechstange holen und den Stamm heraushebeln (Kraft)]
    ~ temp e = probe(kraft)
    ~ probe_zeile("Kraft", e)
    -> rad_ergebnis(e)
* [Den Wärter am Schütz finden und das Wasser umleiten lassen (Verstand)]
    Wenn das Wasser den Stamm festdrückt, dann muss das Wasser weg. Irgendwo flussaufwärts muss es ein Schütz geben, eine Holzwand, mit der man den Mühlgraben schließen kann.
    ~ temp e2 = probe(verstand)
    ~ probe_zeile("Verstand", e2)
    -> rad_ergebnis(e2)
* [Hulda, den Gnomenjungen und die anderen zusammentrommeln (Ausstrahlung)]
    „Allein schafft das keiner“, rufst du. „Zusammen schon!“
    ~ temp e3 = probe(ausstrahlung)
    ~ probe_zeile("Ausstrahlung", e3)
    -> rad_ergebnis(e3)
* {kann_zaubern(1) && element == "wasser"} [Das Wasser bitten, für einen Moment rückwärts zu fließen (Zauber)]
    -> zauber_loesen
* {kann_zaubern(1) && element == "erde"} [Den Mauerstein bitten, der den Stamm festhält, ein Stück zur Seite zu rücken (Zauber)]
    -> zauber_loesen
* {kann_zaubern(1) && element == "feuer"} [Mit einem Funken aus der Schmiede das Tau durchbrennen (Zauber)]
    -> zauber_loesen
* {kann_zaubern(0) && element == "wind"} [Deine Stimme mit dem Wind zum Wärter am Schütz schicken (Zauber)]
    -> zauber_loesen

= zauber_loesen
~ temp u2 = 1
{ element == "wind":
    ~ u2 = 0
}
~ temp z2 = zauber(u2 + tipp_bonus())
~ probe_zeile("Zauber", z2)
{ z2 == ERFOLG || z2 == JA_ABER:
    { element:
    - "wasser":
        Du legst die Hände auf das Wasser. Bitte, denkst du. Nur einen Atemzug lang. Und das Wasser im Mühlgraben hält inne, wird glatt wie ein Spiegel und weicht zurück. Der Druck auf den Stamm lässt nach. Er dreht sich, löst sich und treibt davon.
    - "erde":
        Du legst die Hand an die Mauer. Bitte, denkst du. Nur eine Fingerbreite. Ganz unten knirscht es. Ein Mauerstein rückt ein winziges Stück zur Seite, und der Stamm, der dagegengedrückt war, rutscht ab und treibt davon.
    - "feuer":
        Ein Funke springt aus der offenen Tür der Schmiede, so klein, dass ihn niemand bemerkt. Er landet auf dem Tau und frisst sich hindurch, Faser um Faser. Das Tau reißt. Die Kette rasselt in den Graben, und der Stamm dreht sich frei.
    - else:
        Du flüsterst in den Wind: „Schütz schließen!“ Und weit oben am Graben hört der Wärter eine Stimme an seinem Ohr, obwohl niemand neben ihm steht. Er erschrickt, aber er kurbelt. Das Wasser sinkt. Der Stamm lockert sich. Hulda und du, ihr zieht ihn mit einem Haken heraus.
    }
    { z2 == JA_ABER:
        Leider hat es jemand gesehen: Der Gnomenjunge starrt dich mit offenem Mund an. Aber bevor er etwas sagen kann, steht Kettrich neben ihm. „Regel einunddreißig“, sagt der Hallenmeister ruhig. „Was in der Halle passiert, bleibt in der Halle. Verstanden?“ Der Junge nickt sehr schnell.
    }
    -> geschafft
- else:
    { z2 == KEINE_KRAFT:
        Du greifst nach deiner Kraft, aber da ist nichts. Leer.
    - else:
        Das Element hört dich. Es hört dich nur leider falsch. Für einen Moment schäumt der Mühlgraben noch wütender als vorher.
    }
    -> rad_ergebnis(MISSERFOLG)
}

= rad_ergebnis(e)
{ e:
- ERFOLG:
    -> geschafft
- JA_ABER:
    Es klappt. Fast. Der Stamm löst sich, aber dabei bricht eine der großen Schaufeln. Das Rad wird sich drehen, aber es wird hinken, bis die Zimmerleute sie ersetzt haben.
    -> geschafft
- else:
    Es klappt nicht. Der Stamm rührt sich keinen Fingerbreit.
    Dann schiebt sich Hulda an dir vorbei. Sie hat eine Kette um ihre Schulter gelegt und ruft: „Zieht, wenn ich ziehe!“ Und mit vier Bewerbern an der Kette ruckt der Stamm endlich heraus.
    -> nicht_geschafft
}

= geschafft
Mit einem Ächzen setzt sich das große Rad wieder in Bewegung. Wumm. Wumm. Wumm. In der Halle beginnen die Webstühle zu klappern, erst zögernd, dann immer schneller. Jemand jubelt. Dann jubeln alle.
-> urteil

= nicht_geschafft
Mit einem Ächzen setzt sich das große Rad wieder in Bewegung. In der Halle jubeln die Weberinnen. Hulda wird auf Schultern durch die Halle getragen.
-> urteil

= urteil
Kettrich kommt zu euch heraus.
{ sabotage_entdeckt:
    Du zeigst ihm die Silbermünze aus dem Knoten. Er nimmt sie und dreht sie lange zwischen den Fingern. „Sabotage“, sagt er tonlos. „Am Gildentag. Damit wir einen Tag lang nichts weben. Damit wir das Geld brauchen, das uns das Kontor so freundlich anbietet.“
    Er sieht dich an, und zum ersten Mal sieht er nicht streng aus, sondern dankbar. „Ohne dich hätten wir gedacht, es war ein Unfall.“
    ~ aendern(ruf_webstuhl_amboss, 1)
    ~ aendern(ruf_silbermark, -1)
}
{
- p3_webstuhl.geschafft || sabotage_entdeckt:
    ~ angebot_webstuhl = true
    ~ aendern(ruf_webstuhl_amboss, 1)
    „Regel siebzehn“, sagt Kettrich. „Wer die Ursache findet oder das Problem löst, hat sich bewährt.“ Er zieht eine kleine Karte aus seiner Weste und schreibt deinen Namen darauf. „Ein Angebot. Bis Mitternacht. Danach verfällt es.“
    { gilde_bietet_minen:
        Leise fügt er hinzu: „Und ja. Mitglieder kommen in die Minen.“
    }
- else:
    Kettrich schüttelt dir die Hand. „Du hast dich angestrengt. Das sehe ich. Aber Regel siebzehn ist Regel siebzehn.“ Hulda bekommt die Karte mit dem Angebot. Sie zwinkert dir zu. „Nächstes Jahr“, sagt sie. „Dann schaffst du es.“
}
->->
