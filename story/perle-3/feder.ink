// =====================================================================
// Perle 3 – Prüfung bei der Gesellschaft der Weiten Feder:
// Die Karte unter dem Markt. Ein verborgener Raum mit der Spirale,
// und durch die Wand hört man, wozu das Register der Waage dient.
// =====================================================================

=== p3_feder
~ pruefungen += 1
# karte: gewoelbe
# bild: szene/gewoelbe-pruefung
Unter dem Markt beginnt eine andere Stadt. Eine Treppe aus ausgetretenem Stein führt hinab in die Gewölbe, die älter sind als Lysmara selbst. Die Luft ist kühl und riecht nach Stein, nach Moder und ein bisschen nach Käse, weil oben ein Käsehändler seinen Keller hat.

Am Fuß der Treppe steht Meister Orwin mit seinen zwei Brillen und einer Sanduhr.
{
- p1_feder && skizze == 3:
    „Ah! Die Klippen von Ahrn!“, ruft er, als er dich sieht. „Die mit der Mauer! Ich habe deine Skizze an die Wand gehängt.“
- hintergrund == "kartografenlehrling":
    „Ysoldes Lehrling“, sagt er. „Dann zeig mal, was sie dir beigebracht hat.“
}

„Die Prüfung“, sagt Orwin zu den sechs Bewerbern, „ist einfach und unmöglich zugleich. Jeder bekommt eine Laterne, ein Stück Kreide und ein Blatt. In einer Stunde will ich eine Karte dieser Gewölbe sehen.“ Er dreht die Sanduhr um. „Und noch etwas. Auf einer uralten Karte der Gesellschaft ist hier unten ein Raum eingezeichnet, den seitdem niemand gefunden hat. Wer ihn findet, hat bestanden. Wer ihn nicht findet, aber eine gute Karte zeichnet, auch.“

Er lächelt. „Wir zeichnen, was ist. Nicht, was wir uns wünschen. Los.“
-> zeichnen

= zeichnen
Die Gewölbe sind ein Labyrinth. Gänge, Treppen, Nischen, Bögen, Kammern voller Fässer. Die Laternen der anderen Bewerber verschwinden schnell in der Dunkelheit.
* [Jeden Schritt zählen und jeden Gang mit Kreide markieren (Verstand)]
    { hintergrund == "kartografenlehrling":
        Deine Hand weiß, was zu tun ist. Ysolde hat dir das hundertmal gezeigt.
        ~ temp e = probe(verstand + 1)
        ~ probe_zeile("Verstand +1", e)
        -> karte(e)
    - else:
        ~ temp e2 = probe(verstand)
        ~ probe_zeile("Verstand", e2)
        -> karte(e2)
    }
* [So schnell wie möglich durch alle Gänge laufen und grob skizzieren (Geschick)]
    ~ temp e3 = probe(geschick)
    ~ probe_zeile("Geschick", e3)
    -> karte(e3)
* {hintergrund == "strassenkind"} [(Straßenkind) Du kennst die Gewölbe. Du hast hier unten schon geschlafen.]
    Du kennst diese Gänge. Den mit dem tropfenden Gewölbe, den mit der Nische, in der es im Winter warm ist, weil über ihr der Backofen des Bäckers steht. Du zeichnest sie nicht. Du erinnerst dich nur.
    -> karte(ERFOLG)

= karte(guete)
{ guete:
- ERFOLG:
    Nach einer halben Stunde hast du eine Karte, auf die Ysolde stolz wäre: jeder Gang, jede Treppe, jede Nische. Und weil du so genau gezeichnet hast, fällt dir etwas auf.
    Im Nordosten, genau unter der Ratshalle, ist eine Lücke. Drei Gänge führen darauf zu, und alle drei enden an einer Wand. Als würde sich dort etwas verstecken.
- JA_ABER:
    Die Karte wird brauchbar. Ein paar Gänge sind schief, eine Treppe ist zweimal eingezeichnet. Aber im Nordosten, unter der Ratshalle, fällt dir eine seltsame Lücke auf.
- else:
    Deine Karte sieht aus wie ein Teller Nudeln. Du hast dich zweimal verlaufen und einmal einen Gang gezeichnet, der in Wirklichkeit ein Weinregal ist.
    Aber als du zum dritten Mal an derselben Wand im Nordosten landest, unter der Ratshalle, kommt sie dir merkwürdig vor.
}
-> suchen(guete)

= suchen(guete)
Du stehst vor der Wand. Alter, grauer Stein, mit Moos in den Fugen. Und doch: Irgendetwas stimmt nicht.
* [Die Wand abklopfen und auf einen hohlen Klang horchen (Verstand)]
    ~ temp e = probe(verstand)
    ~ probe_zeile("Verstand", e)
    { e:
    - ERFOLG:
        Tock, tock, tock. Dann: tonk. Hohl. Du findest einen Stein, der lockerer sitzt als die anderen. Dahinter ist ein Spalt, gerade breit genug für dich.
        -> raum(guete)
    - JA_ABER:
        Tock, tock, tonk. Hohl! Aber der lockere Stein sitzt so fest, dass du ihn nur mit Mühe herausziehen kannst. Dabei reißt du dir die Hand an einer Kante auf. Halb so schlimm. Dahinter ist ein Spalt.
        -> raum(guete)
    - else:
        Tock, tock, tock. Alles klingt gleich. Die Sanduhr in deinem Kopf rinnt.
        -> zurueck(guete)
    }
* [Die Laterne hochhalten und beobachten, wohin die Flamme sich neigt]
    ~ neigung_wind += 1
    Du hältst die Laterne still. Die Flamme zittert. Dann neigt sie sich, ganz leicht, zur Wand hin. Da zieht es. Irgendwo hinter diesen Steinen ist Luft.
    ~ temp e2 = probe(geschick)
    ~ probe_zeile("Geschick", e2)
    { e2 == MISSERFOLG:
        Du tastest die Fugen ab, findest den Spalt, durch den die Luft zieht, aber er ist zu schmal. Nur ein Fingerbreit. Du kommst nicht hindurch.
        -> zurueck(guete)
    - else:
        Du tastest die Fugen ab und findest eine Stelle, an der zwei Steine nur aufeinandergelegt sind, ohne Mörtel. Du hebst sie heraus. Dahinter ist ein Spalt.
        -> raum(guete)
    }
* {kann_zaubern(1) && element == "erde"} [Die Steine bitten, dir zu zeigen, wo sie hohl sind (Zauber)]
    -> zauber_suchen(guete)
* {kann_zaubern(0) && element == "wind"} [Dem Wind folgen, der durch die Fugen pfeift (Zauber)]
    -> zauber_suchen(guete)
* {kann_zaubern(0) && element == "wasser"} [Den Wassertropfen folgen, die irgendwohin abfließen (Zauber)]
    -> zauber_suchen(guete)
* {kann_zaubern(0) && element == "feuer"} [Die Laternenflamme bitten, dir den Luftzug zu zeigen (Zauber)]
    -> zauber_suchen(guete)

= zauber_suchen(guete)
~ temp u = 0
{ element == "erde":
    ~ u = 1
}
~ temp z = zauber(u + tipp_bonus())
~ probe_zeile("Zauber", z)
{ z == ERFOLG || z == JA_ABER:
    { element:
    - "erde":
        Du legst die Stirn an den Stein. Er erzählt dir von sich: von dem Gewicht der Ratshalle über ihm, von den Jahrhunderten, und von einer Leere hinter ihm, die er nicht mag. Ein Stein lockert sich unter deiner Hand, als wollte er dir den Weg zeigen.
    - "wind":
        Du schließt die Augen. Der Wind in den Gewölben ist schwach, ein Hauch nur. Aber er kennt seinen Weg, und er führt durch eine Fuge, die breiter ist als die anderen. Du hebst den Stein heraus.
    - "wasser":
        Von der Decke tropft es, und die Tropfen laufen nicht in die Rinne am Boden, sondern zur Wand. Du bittest sie, dir zu zeigen, wohin. Sie sammeln sich zu einem dünnen Faden, der unter einem Stein verschwindet. Dahinter ist Leere.
    - else:
        Du flüsterst der Flamme in der Laterne etwas zu. Sie streckt sich, lang und dünn, und zeigt wie ein leuchtender Finger auf eine Fuge in der Wand. Dort zieht es.
    }
    { z == JA_ABER:
        Dabei poltern ein paar Steine mehr heraus als nötig. Der Lärm hallt durch die Gewölbe. Irgendwo ruft jemand: „Hallo? Ist da wer?“ Du wartest mit klopfendem Herzen, bis es wieder still ist.
    }
    -> raum(guete)
- else:
    { z == KEINE_KRAFT:
        Du greifst nach deiner Kraft, aber da ist nichts.
    - else:
        Das Element antwortet mit einem Geräusch, das klingt wie ein Seufzer. Dann nichts.
    }
    -> zurueck(guete)
}

= raum(guete)
~ spirale_im_gewoelbe = true
# bild: szene/raum-der-vier
Du zwängst dich durch den Spalt. Dahinter ist ein runder Raum mit einer niedrigen Kuppel. Der Boden ist mit kleinen Steinen ausgelegt, ein Mosaik, verblasst und staubig.

Du wischt den Staub mit dem Ärmel weg. Darunter kommen vier Gestalten zum Vorschein, im Kreis, einander zugewandt. Die erste hält einen Stein. Die zweite eine Welle. Die dritte eine Flamme. Die vierte eine Feder. Und in ihrer Mitte, aus vier Linien, die sich ineinander winden: eine Spirale.
{ brief_erhalten:
    Du kennst dieses Zeichen. Es ist dasselbe wie auf dem Siegel deines Briefes. Unter deiner Jacke wird der Brief plötzlich warm, so warm, als hätte er in der Sonne gelegen.
    { spirale_erkannt:
        Und du erinnerst dich an Yrsas Gesicht, als sie das Siegel gesehen hat. Wie sie blass geworden ist. Zeig es niemandem.
    }
- else:
    Vier Elemente, denkst du. Und einer, der sie alle zusammenhält.
}

Dann hörst du Stimmen.

Sie kommen von der anderen Seite des Raumes, durch eine zugemauerte Tür. Dahinter muss der Keller der Ratshalle liegen.

„… die ersten zweihundert Kugeln stehen bereit“, sagt ein Mann. „Für das Register.“

„Und die Leute wissen, was sie unterschreiben?“, fragt eine Frau.

Der Mann lacht leise. „Es steht im Vertrag. Jeder Eingeschriebene gibt der Waage jeden Mond einen Funken. Zum Wohl der Stadt. Ganz unten, klein geschrieben. Wer liest schon das Kleingedruckte?“
~ register_geheimnis = true
* [Das Ohr an die zugemauerte Tür legen und weiter lauschen (Geschick)]
    ~ temp e = probe(geschick)
    ~ probe_zeile("Geschick", e)
    { e:
    - ERFOLG:
        Du hältst den Atem an.
        „Die Waagmeisterin will bis zum Winter tausend Kugeln in Vardholm“, sagt die Frau.
        „Wofür?“
        „Fragt man nicht. Man füllt.“
        Dann entfernen sich die Schritte.
    - JA_ABER:
        „… bis zum Winter tausend Kugeln in Vardholm …“, hörst du noch. Dann knirscht Mörtel unter deinem Knie. Auf der anderen Seite verstummen die Stimmen.
        „Hast du das gehört?“
        „Ratten.“
        Du kriechst so leise wie möglich zurück durch den Spalt.
    - else:
        Du lehnst dich an die Tür. Ein Stück Mörtel bröckelt ab und fällt klackernd zu Boden.
        „Wer ist da?“
        Du bist schon durch den Spalt, bevor jemand auf die Idee kommt, nachzusehen.
    }
* [Leise zurückkriechen, bevor dich jemand hört]
    Du hast genug gehört. Mehr als genug. Leise zwängst du dich zurück durch den Spalt.
- -> abgabe(guete, true)

= zurueck(guete)
Die Sanduhr ist abgelaufen. Irgendwo oben läutet Orwin eine kleine Glocke. Du gehst mit deiner Karte zurück.
-> abgabe(guete, false)

= abgabe(guete, gefunden)
Meister Orwin sammelt die Karten ein und legt sie nebeneinander auf ein Fass. Er schiebt die zweite Brille von der Stirn auf die Nase.
{ gefunden:
    -> abgabe_raum(guete)
}
{ guete:
- ERFOLG:
    ~ angebot_feder = true
    ~ aendern(ruf_weite_feder, 1)
    „Saubere Linien“, murmelt er. „Gute Maße. Und du hast die Lücke unter der Ratshalle bemerkt. Die bemerkt fast niemand.“ Er nickt. „Ein Angebot. Bis Mitternacht.“
- JA_ABER:
    ~ angebot_feder = true
    „Die Treppe ist doppelt“, sagt Orwin. „Und dieser Gang führt in Wirklichkeit nach links.“ Dann zuckt er die Schultern. „Aber du hast gesehen, was andere nicht sehen. Ein Angebot. Bis Mitternacht.“
- else:
    Orwin betrachtet deine Karte. Dann dreht er sie um. Dann wieder zurück. „Ist das ein Weinregal?“, fragt er. Er gibt dir die Hand. „Komm nächstes Jahr wieder. Mit mehr Geduld.“
}
->->

= abgabe_raum(guete)
Als er zu deiner Karte kommt, siehst du ihn zögern. Du hast den Raum noch nicht eingezeichnet. Der Kohlestift liegt in deiner Hand.
* [Den Raum mit der Spirale einzeichnen. Wir zeichnen, was ist.]
    ~ aendern(ruf_weite_feder, 1)
    ~ angebot_feder = true
    Du zeichnest einen kleinen Kreis an die Stelle unter der Ratshalle. Und darin, ganz klein, vier ineinander gewundene Linien.
    Orwin sieht lange darauf. Dann nimmt er die Brille ab, putzt sie und setzt sie wieder auf. „Vierzig Jahre“, sagt er leise. „Vierzig Jahre habe ich diesen Raum gesucht.“
    Er rollt deine Karte zusammen und steckt sie in seinen Mantel, nicht zu den anderen. „Dieses Blatt bleibt bei mir. Unter Verschluss. Die Ratshalle hat viele Ohren, und nicht alle gehören dem Rat.“ Er reicht dir die Hand. „Willkommen, wenn du willst.“
* [Den Raum verschweigen. Zu viele Ohren hier unten.]
    Du zeichnest nichts ein. Orwin wandert mit dem Finger über deine Karte, bis er an die Lücke unter der Ratshalle kommt. Er sieht dich über beide Brillen hinweg an. Lange.
    „Eine Karte, die etwas verschweigt“, sagt er schließlich, „ist eine Lüge mit schönen Linien.“ Dann senkt er die Stimme. „Oder sie ist klug. Manchmal sind Lügen klug.“
    { guete == MISSERFOLG:
        Er seufzt. „Aber die Linien sind leider nicht schön.“ Er gibt dir die Hand. „Komm nächstes Jahr wieder. Und dann zeig mir, was du heute nicht gezeichnet hast.“
    - else:
        ~ angebot_feder = true
        Er nickt. „Die Karte ist gut. Und dein Schweigen vielleicht auch. Ein Angebot. Bis Mitternacht.“
    }
- ->->
