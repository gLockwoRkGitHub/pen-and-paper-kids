// =====================================================================
// Perle 5 – Der Abstieg in die Tiefe Stiege und die Vermissten
// =====================================================================

=== p5_abstieg
# bild: szene/tiefe-stiege
# karte: tiefe-stiege
Hinter dem dritten Schacht beginnt die Tiefe Stiege.

Eine Treppe, in den Fels gehauen, so breit, dass vier Zwerge nebeneinander gehen könnten. Sie führt hinab in eine Dunkelheit, die so dick ist, dass deine Lampe darin wie ein Glühwürmchen aussieht. An den Wänden sind Zeichen gemeißelt, kantig und alt, alle paar Schritte eines.
{ element == "erde":
    Du legst die Hand an die Wand. Der Stein erzählt dir von Hämmern und Meißeln und von Zwergen, die gesungen haben, während sie gruben. Einer von ihnen hat seine Hand genau hier auf den Fels gelegt. Vielleicht Borriks Großvater.
}
{ grisk_begleitet:
    Grisk geht voraus. Er schnuppert an jeder Ecke. „Hier lang“, flüstert er. „Grisk riecht den alten Weg.“
}
Ihr steigt hinab. Hundert Stufen. Fünfhundert. Irgendwann hörst du auf zu zählen.
-> talin

= talin
# bild: szene/talin
Ein Stück unterhalb des Schachts siehst du Licht. Eine einzelne Lampe. Und davor ein Junge, vielleicht fünfzehn, dünn, mit einer Messingplakette um den Hals. Er steht vor der Felswand, die Hände flach auf dem Stein, und der Stein weicht vor ihm zurück, Fingerbreit um Fingerbreit, wie Butter vor einem warmen Messer.

Er hört dich und fährt herum. Sein Gesicht ist grau vor Staub und Müdigkeit.
~ talin_getroffen = true

„Talin“, sagt er, als du fragst. „Erd-Rufer. Eingeschrieben bei der Waage.“ Er tippt auf die Plakette. „Sie haben gesagt, eingeschriebene Rufer dürfen sich bewähren. Hier bewähre ich mich. Jeden Tag zwölf Stunden. Für das dunkle Erz.“ Er lacht. Es klingt nicht fröhlich. „Und letzte Nacht haben sie mir einen Funken genommen. Jetzt geht es noch langsamer.“
{ element == "erde":
    Er sieht dich an, und plötzlich wird sein Blick wach. „Du auch“, sagt er. „Erde. Ich hör's an deinen Schritten.“
}
* [Ihm sagen, dass da unten das Graue wartet und er aufhören soll (Ausstrahlung)]
    ~ temp e = probe(ausstrahlung)
    ~ probe_zeile("Ausstrahlung", e)
    { e:
    - ERFOLG:
        ~ talin_hilft = true
        Talin hört zu. Als du von den Kobolden erzählst, die im Stehen schlafen, wird er blass. Er sieht auf seine Hände. Dann nimmt er die Lampe. „Ich komm mit“, sagt er. „Wenn ich schon grabe, dann wenigstens für etwas Richtiges.“
    - JA_ABER:
        Talin hört zu. Er wird blass. „Ich kann nicht aufhören“, sagt er. „Meine Mutter braucht das Silber.“ Er dreht sich wieder zur Wand. Aber als ihr weitergeht, hörst du, dass er nicht mehr gräbt. Er sitzt nur da, die Hände im Schoß.
    - else:
        „Grau, Grau“, sagt Talin müde. „Die Kobolde erzählen auch dauernd Geschichten.“ Er dreht sich wieder zur Wand.
    }
* [Ihn fragen, wer ihm befohlen hat, hier zu graben]
    „Der Vorarbeiter der Waage“, sagt Talin. „Und der hat es aus Vardholm. Und Vardholm …“ Er zuckt die Schultern. „Von ganz oben. Wie immer.“
    Von ganz oben. Du denkst an Strell. An {freund()}.
* [Weitergehen. Du kannst nicht jedem helfen.]
    Talin sieht dir nach. Dann dreht er sich wieder zur Wand.
- -> weiter_nach_talin

= weiter_nach_talin

Und dann hörst du es. Das Brummen. Erst nur ein Zittern in den Fußsohlen, dann ein Summen in den Zähnen, dann ein Ton, so tief, dass man ihn mehr fühlt als hört. Wie ein riesiger Bienenstock, irgendwo unter dir.
-> schlund

= schlund
# bild: szene/der-schlund
Plötzlich hört die Treppe auf.

Vor dir klafft ein Abgrund, zwanzig Schritte breit. Unten rauscht Wasser in der Dunkelheit. Auf der anderen Seite geht die Treppe weiter. Dazwischen hängen die Reste einer Brücke: zwei rostige Ketten, an denen nichts mehr hängt.
* {talin_hilft} [Talin bitten, eine Brücke aus dem Fels zu formen]
    Talin legt die Hände auf die Kante. Er ist müde, aber er weiß, was er tut. Aus beiden Seiten des Abgrunds wachsen Steine, Schicht um Schicht, bis sie sich treffen. „Dafür“, sagt er leise, „hab ich das Rufen gelernt. Nicht für Erz.“
    -> weiter
* {runen_gelernt} [An der Kante nach dem Zwergenzeichen für „verborgener Weg“ suchen (Verstand +1)]
    ~ temp e5 = probe(verstand + 1)
    ~ probe_zeile("Verstand +1", e5)
    { e5 == MISSERFOLG:
        Du findest viele Zeichen, aber nicht das richtige. Ihr müsst klettern.
        -> schlund_ergebnis(JA_ABER)
    - else:
        Da, links an der Wand, ein Strich unter einem Bogen. Dahinter, eine Handbreit unter der Kante, ein alter Steg, den die Zwerge in den Fels gehauen haben. Ihr geht hinüber, als wäre es nichts. {grisk_begleitet:Mirk hätte gelacht.|Mirk lacht leise. „Kluges Kind.“}
        -> weiter
    }
* [Am Fels entlangklettern, wo eine schmale Kante bis hinüber führt (Geschick)]
    ~ temp e = probe(geschick)
    ~ probe_zeile("Geschick", e)
    -> schlund_ergebnis(e)
* [Ein Seil an der rostigen Kette befestigen und dich hinüberhangeln (Kraft)]
    ~ temp hilfe = 0
    { grisk_begleitet:
        ~ hilfe = 1
    }
    ~ temp e2 = probe(kraft + hilfe)
    ~ probe_zeile("Kraft", e2)
    -> schlund_ergebnis(e2)
* {kann_zaubern(1) && element == "erde"} [Den Fels bitten, eine Brücke über den Abgrund zu formen (Zauber)]
    -> zauber_schlund(1)
* {kann_zaubern(0) && element == "wasser"} [Das Wasser aus der Tiefe zu einer Brücke aus Eis gefrieren lassen (Zauber)]
    -> zauber_schlund(0)
* {kann_zaubern(0) && element == "wind"} [Dich vom Wind über den Abgrund tragen lassen (Zauber)]
    -> zauber_schlund(0)
* {kann_zaubern(-1) && element == "feuer"} [Mit Glut aus deiner Laterne ein helles Licht entzünden, das einen verborgenen Weg zeigt (Zauber, Quelle)]
    -> zauber_schlund(-1)

= zauber_schlund(u)
~ temp z = zauber(u)
~ probe_zeile("Zauber", z)
{ z == KEINE_KRAFT:
    Du greifst nach deiner Kraft. Leer. Ihr müsst klettern.
    ~ temp e = probe(geschick)
    ~ probe_zeile("Geschick", e)
    -> schlund_ergebnis(e)
}
{ element:
- "erde":
    { z == MISSERFOLG:
        Der Fels grollt. Ein paar Steine lösen sich und poltern in die Tiefe. Eine Brücke wird es nicht, aber eine Reihe kleiner Vorsprünge, über die ihr mühsam hinüberklettert.
    - else:
        Du legst beide Hände auf die Kante. Bitte, denkst du. Und der Fels antwortet. Aus beiden Seiten des Abgrunds wachsen Steine, Schicht um Schicht, bis sie sich in der Mitte treffen. Eine Brücke aus Fels, schmal, aber fest.
        { z == JA_ABER:
            Sie hält. Aber hinter euch hört ihr, wie sie langsam wieder in den Abgrund bröckelt. Zurück geht es nicht mehr auf diesem Weg.
        }
    }
- "wasser":
    { z == MISSERFOLG:
        Das Wasser in der Tiefe steigt auf, als Nebel. Er ist kalt und nass und macht alles rutschig. Ihr klettert trotzdem hinüber, an der Kante, mit klappernden Zähnen.
    - else:
        Du rufst das Wasser aus der Tiefe. Es steigt auf, als silberner Nebel, und als er die Mitte des Abgrunds erreicht, gefriert er. Knisternd, klirrend, ein Bogen aus Eis, glatt wie Glas.
        { z == JA_ABER:
            Er hält. Aber er ist so glatt, dass ihr auf allen vieren hinüberkriechen müsst. Und hinter euch schmilzt er schon.
        }
    }
- "wind":
    { z == MISSERFOLG:
        Der Wind kommt, aber nur halb. Er wirft dich hinüber und lässt dich auf der anderen Seite unsanft auf die Stufen plumpsen. Deine Begleiter müssen sich mit dem Seil hinüberhangeln.
    - else:
        Du lässt dich fallen, nach vorn, in den Abgrund. Und der Wind fängt dich auf. Er trägt dich hinüber, leicht wie ein Blatt, und setzt dich auf der anderen Seite ab. Dann spannst du das Seil, und die anderen hangeln sich hinüber.
        { z == JA_ABER:
            Beim Landen pustet der Wind dir alle Lampen aus. Ihr braucht eine Weile, bis sie wieder brennen.
        }
    }
- else:
    { z == MISSERFOLG:
        Ein Funke springt aus der Laterne, flackert und verlischt. Ihr klettert an der Kante hinüber, im Halbdunkel.
    - else:
        Ein Funke springt aus der Laterne und wird zu einem Licht, hell wie ein kleiner Mond. Es schwebt über den Abgrund und zeigt, was im Dunkeln verborgen war: einen alten Steg aus Stein, eine Handbreit unter der Kante, den die Zwerge in den Fels gehauen haben. Ihr geht hinüber, als wäre es nichts.
        { z == JA_ABER:
            Das Licht war sehr hell. Von unten antwortet ein tiefes Grollen, als hätte etwas im Berg die Augen geöffnet.
        }
    }
}
-> weiter

= schlund_ergebnis(e)
{ e:
- ERFOLG:
    Ihr kommt hinüber, ohne einen einzigen Fehltritt.
- JA_ABER:
    Ihr kommt hinüber. Aber unterwegs rutscht dir die Tasche von der Schulter und ein Teil des Proviants verschwindet rauschend in der Tiefe.
- else:
    Auf halbem Weg rutschst du ab. Einen schrecklichen Augenblick lang hängst du nur an den Fingern über dem Rauschen. Dann packt dich eine kleine, kräftige Hand am Kragen. {grisk_begleitet:Grisk|Mirk} zieht dich hinauf, mit einer Kraft, die man einem Kobold nicht zutraut.
    „{grosse_figur(false)}“, keucht {grisk_begleitet:Grisk|Mirk}. „Schwer.“
}
-> weiter

= weiter
Je tiefer ihr kommt, desto lauter wird das Brummen. Und dann merkst du, dass etwas mit dem Licht nicht stimmt.

Die Lampen werden blass. Nicht dunkler, sondern blasser. Das Gelb wird grau. Der Fels, eben noch rötlich, wird grau. Deine eigenen Hände, als du sie ansiehst, haben weniger Farbe als vorhin.

„Das Graue“, flüstert {grisk_begleitet:Grisk|Mirk}. „{grisk_begleitet:Grisk|Mirk} riecht es. Wie Asche ohne Feuer.“
->->


=== p5_vermisste
# bild: szene/vermisste-kobolde
Die Treppe endet in einer Halle. Und am Rand der Halle stehen sie.

Sieben Kobolde, die Grubenlampen noch auf den Helmen, erloschen. Sie stehen ganz still und starren in die Dunkelheit, wo die Halle in einen Gang übergeht, aus dem das Brummen kommt. Ihre Schuppen sind grau. Nicht schiefergrau wie Grisks. Aschgrau.
{ ausloeser == "verschwunden":
    ~ bp_gefunden = true
    Und zwischen ihnen, größer als alle anderen, mit einem Seil über der Schulter: {bp()}.
    Dein Herz bleibt fast stehen. {Bp_er()} steht da wie die Kobolde, die Augen offen, und sieht dich nicht.
}

Du kennst das. Von den Weiden. Sie schlafen im Stehen. Und gleich gehen sie weiter. Hinein.
* [Laut rufen, singen, lärmen, alles, was Krach macht (Ausstrahlung)]
    ~ temp hilfe2 = 0
    { grisk_begleitet:
        ~ hilfe2 = 1
    }
    ~ temp e = probe(ausstrahlung + hilfe2)
    ~ probe_zeile("Ausstrahlung", e)
    { grisk_begleitet:
        Grisk stößt einen Schrei aus, so schrill, dass dir die Ohren klingeln. Ein Kobold-Kriegsschrei, sagt er später. Er hat ihn noch nie benutzt.
    }
    -> wecken(e)
* {kann_zaubern(1) && element == "erde"} [Den Boden unter ihnen beben lassen, bis sie aufwachen (Zauber)]
    -> zauber_wecken(1)
* {kann_zaubern(0) && element != "erde"} [{element == "wind":Den Wind durch die Halle heulen lassen}{element == "wasser":Eiskaltes Wasser aus der Wand über sie regnen lassen}{element == "feuer":Die erloschenen Grubenlampen auf ihren Helmen wieder anzünden} (Zauber)]
    -> zauber_wecken(0)
* [Einen nach dem anderen am Arm packen und aus dem Grauen ziehen (Kraft)]
    ~ temp e2 = probe(kraft)
    ~ probe_zeile("Kraft", e2)
    -> wecken(e2)

= zauber_wecken(u)
~ temp z = zauber(u)
~ probe_zeile("Zauber", z)
{ z == KEINE_KRAFT:
    Leer. Du schreist stattdessen, so laut du kannst.
    ~ temp e = probe(ausstrahlung)
    ~ probe_zeile("Ausstrahlung", e)
    -> wecken(e)
}
{ element:
- "erde":
    Der Boden der Halle bebt. Steine klappern, Staub rieselt von der Decke.
- "wasser":
    Aus einem Riss in der Wand bricht ein Schwall eiskaltes Wasser und regnet auf die Schlafenden herab.
- "feuer":
    Eine Lampe nach der anderen flammt auf den Helmen der Kobolde auf, hell, heiß, knisternd.
- else:
    Ein Sturm heult durch die Halle, als wäre der ganze Berg ein einziges Horn.
}
-> wecken(z)

= wecken(e)
{ e:
- ERFOLG:
    ~ vermisste_gerettet = true
    ~ aendern(ruf_kobolde, 2)
    Die Kobolde zucken zusammen. Einer nach dem anderen blinzelt, schüttelt sich, sieht sich verwirrt um. Ihre Schuppen bekommen langsam wieder Farbe. Der Jüngste fängt an zu weinen.
- JA_ABER:
    ~ vermisste_gerettet = true
    ~ aendern(ruf_kobolde, 1)
    Sechs Kobolde wachen auf. Der siebte ist schon zwei Schritte weiter, hinein in den Gang. {grisk_begleitet:Grisk|Mirk} rennt ihm nach, packt ihn am Schwanz und zerrt ihn zurück. Beide sind danach grau bis zu den Knien. Aber sie sind wach.
- else:
    ~ vermisste_gerettet = true
    Du rufst, du ziehst, du rüttelst. Und dabei wirst du selbst so müde, so unendlich müde. Du setzt dich hin. Nur kurz.
    Dann spürst du kleine Hände. Viele kleine Hände. Die Kobolde, die du schon geweckt hast, packen dich und schleppen dich zurück auf die Treppe, Stufe um Stufe, bis die Farben zurückkommen.
    „{grosse_figur(false)} hat uns geweckt“, sagt einer. „Jetzt wecken wir {grosse_figur(true)}.“
}
{ bp_gefunden:
    -> bp_wach
}
->->

= bp_wach
# bild: szene/wiedersehen-{hintergrund}
{bp()} blinzelt. Sieht dich. Erkennt dich.

„Du?“ Die Stimme klingt rau, als hätte {bp_er()} tagelang nicht gesprochen. „Ich hab doch gesagt … folge mir nicht.“

„Ich bin dir nicht gefolgt“, sagst du. „Ich bin dem Grauen gefolgt. Und da warst du.“

{bp()} lacht. Es ist ein kaputtes, müdes Lachen. Dann nimmt {bp_er()} dich in die Arme und hält dich sehr lange fest.

Später, auf den Stufen, erzählt {bp_er()}. „Ein Freund hat mir geschrieben, von jenseits der Berge. Dass die Dörfer leer werden. Dass etwas kommt. Ich wollte es mit eigenen Augen sehen. Und als der Spalt zuging, dachte ich, unter dem Berg komme ich durch.“ {Bp_er()} schaut in die Dunkelheit. „Ich bin bis hierher gekommen. Dann weiß ich nichts mehr.“
->->
