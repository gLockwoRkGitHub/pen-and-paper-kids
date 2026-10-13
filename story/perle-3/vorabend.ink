// =====================================================================
// Perle 3 – Die drei Tage vor dem Gildentag
// Übung beim Mentor (neuer kleiner Zauber), Neuigkeiten aus der Stadt,
// ein Besuch, der am Gildentag hilft.
// =====================================================================

=== p3_tage
# bild: szene/morgen-mentor-{element}
Drei Tage bis zum Gildentag. Drei Tage, in denen die Stadt summt wie ein Bienenkorb, in den jemand mit einem Stock gestochert hat.

Jeden Morgen gehst du zu {element == "erde":Borrik}{element == "wasser":Nerelle}{element == "feuer":Yrsa}{element == "wind":Vael}. Und jeden Morgen bist du ein bisschen weniger müde, wenn du nach dem Üben nach Hause gehst.
{ element:
- "erde":
    -> erde
- "wasser":
    -> wasser
- "feuer":
    -> feuer
- else:
    -> wind
}

= erde
Am dritten Morgen streut Borrik eine Handvoll Sand über die Steinplatten seines Hofes. Dann geht er einmal kreuz und quer hindurch und wischt alles wieder glatt.

„Wo bin ich gegangen?“, fragt er. „Frag den Boden. Der Boden vergisst keinen Schritt. Er erzählt es nur nicht jedem.“
+ [Den Boden nach Borriks Schritten fragen (Zauber)]
    ~ temp z = zauber(1)
    ~ probe_zeile("Zauber", z)
    { z:
    - ERFOLG:
        ~ aendern(beziehung_mentor, 1)
        Du legst die Hand auf die Platten. Und plötzlich spürst du sie: Borriks Schritte, schwer und schlurfend, ein Weg, der sich durch den Hof schlängelt wie eine Schnur. Du gehst ihn nach, Schritt für Schritt, bis du vor Borrik stehst.
        „Spuren lesen“, brummt er. „Das kannst du jetzt. Unter der Erde gibt es keine Geheimnisse. Nur Leute, die nicht fragen.“
    - JA_ABER:
        Du spürst die Schritte. Leider spürst du auch die Schritte von jedem, der in den letzten hundert Jahren durch diesen Hof gegangen ist. In deinem Kopf trampelt eine ganze Herde.
        „Zu viel gefragt“, sagt Borrik. „Frag genauer.“
    - else:
        Der Boden schweigt. Dann rieselt dir Sand in den Kragen. Von innen. Du hast keine Ahnung, wie.
        „Humor“, sagt Borrik zufrieden.
    }
- -> neuigkeiten

= wasser
Am dritten Morgen stellt Nerelle dir eine Schale mit Meerwasser hin und daneben einen leeren Becher.

„Meerwasser kann man nicht trinken“, sagt sie. „Es sei denn, man bittet das Salz, zu Hause zu bleiben. Gib mir einen Becher Süßwasser.“
+ [Das Wasser vom Salz trennen (Zauber)]
    ~ temp z = zauber(1)
    ~ probe_zeile("Zauber", z)
    { z:
    - ERFOLG:
        ~ aendern(beziehung_mentor, 1)
        Du hältst die Hand über die Schale. Das Wasser steigt in einem dünnen, glitzernden Faden auf und fließt in den Becher. Zurück bleibt eine Kruste aus weißem Salz.
        Nerelle trinkt. „Süß wie ein Bergbach“, sagt sie. „Wer Wasser rufen kann, verdurstet nie. Merk dir das. Es wird dir eines Tages wichtiger sein als jeder Zauber, der glitzert.“
    - JA_ABER:
        Das Wasser fließt in den Becher. Das Salz auch. Es hat sich nur oben als hübsches Häubchen abgesetzt.
        „Fast“, sagt Nerelle. „Das Salz hängt an dir. Du musst lernen, es gehen zu lassen.“
    - else:
        Das Wasser springt aus der Schale und landet auf Nerelles Füßen. Sie lacht. „Barfuß hat seine Vorteile.“
    }
- -> neuigkeiten

= feuer
Am dritten Morgen löscht Yrsa jede Lampe im Keller der Schmiede. Es ist so dunkel, dass du deine eigene Nase nicht mehr siehst.

„Feuer ist nicht nur Hitze“, sagt sie irgendwo in der Finsternis. „Feuer ist Licht. Mach mir ein Licht. Eines, das nichts verbrennt.“
+ [Ein kaltes Licht rufen (Zauber)]
    ~ temp z = zauber(1)
    ~ probe_zeile("Zauber", z)
    { z:
    - ERFOLG:
        ~ aendern(beziehung_mentor, 1)
        Über deiner Handfläche glimmt ein Licht auf, klein wie eine Kirsche und ruhig wie ein Stern. Es wärmt nicht. Es leuchtet nur.
        Yrsa hält einen Finger hinein. Nichts passiert. „Gut“, sagt sie. „Ein Licht, das genug weiß. Das ist das halbe Handwerk.“
    - JA_ABER:
        Das Licht ist da. Es ist nur ein bisschen sehr hell. Für einen Moment ist der ganze Keller weiß, und ihr seht beide noch eine Weile lang grüne Punkte.
        „Genug“, seufzt Yrsa. „Wir üben das Wort.“
    - else:
        Ein Funke springt aus deiner Hand, landet auf Yrsas Schürze und brennt ein kleines, rundes Loch hinein. Sie schaut lange darauf.
        „Das ist das vierzigste Loch“, sagt sie. „Die anderen neununddreißig waren von mir.“
    }
- -> neuigkeiten

= wind
Am dritten Morgen schickt Vael dich die zweihundert Stufen hinunter bis an den Fuß des Leuchtturms. Er selbst bleibt oben.

Du wartest. Dann hörst du ihn. Ganz leise, direkt an deinem Ohr, als stünde er neben dir: „Jetzt du. Schick mir deine Stimme. Nur mir.“
+ [Deine Stimme mit dem Wind hinaufschicken (Zauber)]
    ~ temp z = zauber(1)
    ~ probe_zeile("Zauber", z)
    { z:
    - ERFOLG:
        ~ aendern(beziehung_mentor, 1)
        Du flüsterst: „Hallo, Vael.“ Und der Wind nimmt die Worte, trägt sie die Mauer hinauf, an zweihundert Stufen vorbei, bis in die Laternenkammer.
        „Angekommen“, sagt Vael an deinem Ohr. „Leise. Gut. Wer leise reden kann, kann auch leise hören.“
    - JA_ABER:
        Der Wind trägt deine Worte hinauf. Und hinaus. Und über die halbe Klippe. Unten am Weg drehen sich zwei Schafhirten verwirrt um.
        „Angekommen“, sagt Vael. „Bei allen.“
    - else:
        Du flüsterst. Der Wind nimmt deine Worte, dreht sie einmal um sich selbst und bläst sie dir zurück ins Gesicht. Zusammen mit einer Möwenfeder.
        Von oben hörst du etwas, das fast ein Lachen sein könnte.
    }
- -> neuigkeiten

= neuigkeiten
In der Stadt hängen neue Aushänge an jeder Ecke. Die Ränder sind mit Gold bemalt.

„DER RAT BERÄT. Am Tag der Gilden wird über das Gesetz zum Schutz der Bürger vor ungeprüften Elementrufern entschieden.“

Ungeprüfte Elementrufer. Das bist du.
{ magie_oeffentlich:
    Seit dem Feuer am Färberturm schauen dir manche Leute im Räderviertel nach. Eine Frau zieht ihr Kind an der Hand auf die andere Straßenseite. Ein alter Weber dagegen nickt dir zu und tippt sich an die Mütze.
}
{ ausloeser:
- "schulden":
    Unter der Tür klemmt ein Brief mit silbernem Stempel. „Erinnerung: noch acht Tage bis Neumond. Das Kontor ist am Gildentag mit einem Stand vertreten. Hochachtungsvoll, Fesk.“
- "flucht":
    { gesehen_worden:
        An der Ecke zum Hafen klebt ein Zettel: „GESUCHT: Wer in der Nacht vor der Schließung am Nordkai war, melde sich beim Bund der Goldenen Waage. Belohnung.“ Darunter eine Zeichnung. Zum Glück sieht sie dir nur ein bisschen ähnlich.
    - else:
        Zweimal siehst du schwarze Mäntel in deiner Gasse. Beide Male gehen sie vorbei. Beide Male hältst du die Luft an.
    }
- "verschwunden":
    {bp()} ist noch immer nicht zurück. Jeden Abend lässt du eine Kerze im Fenster brennen. Jeden Morgen ist sie heruntergebrannt.
- "brief":
    Den Brief trägst du immer bei dir, eng an der Brust. Manchmal, wenn niemand hinsieht, fährst du mit dem Daumen über das Siegel. Es ist immer ein bisschen wärmer als alles andere.
}

Am Abend vor dem Gildentag hast du noch ein paar Stunden Zeit.
* {tickwort_bei_goblins} [Tickwort bei Knallfunke & Söhne besuchen]
    ~ p3_besuch = "tickwort"
    -> tickwort
* [Bei Grumak am Brunnen vorbeischauen]
    ~ p3_besuch = "grumak"
    -> grumak
* [Noch einmal zu {element == "erde":Borrik}{element == "wasser":Nerelle}{element == "feuer":Yrsa}{element == "wind":Vael} gehen und weiterüben]
    ~ p3_besuch = "mentor"
    -> mentor

= tickwort
~ tickwort_wiedergesehen = true
~ gildentag_regeln = true
# bild: szene/tickwort-werkstatt
Bei Knallfunke & Söhne qualmt es nicht mehr. Es schnurrt. Überall stehen Maschinen, und an jeder hängt ein Zettel, eng beschrieben in winziger, sehr ordentlicher Schrift.

„Anleitungen!“, ruft Tickwort, als er dich sieht, und sein Schornstein pustet drei Dampfringe auf einmal. „Ich habe zweiundvierzig geschrieben! Brakka hat sie alle gelesen! Na ja. Die ersten Seiten.“

Als du ihm vom Gildentag erzählst, surrt sein Glasauge begeistert.

„Oh, der Gildentag! Darf ich erklären? Ich darf. Erstens: Jede Gilde öffnet ihre Halle und stellt eine Prüfung. Zweitens: Jeder darf an zwei Prüfungen teilnehmen, nicht mehr, denn um Mitternacht ist alles vorbei. Drittens: Wer eine Prüfung besteht, bekommt ein Angebot. Wer ein Angebot hat, darf beitreten. Wer zwei hat, muss wählen.“

Er senkt die Stimme. „Und viertens, das steht in keiner Regel: Der Zirkel der Glühenden Phiole prüft jedes Jahr mit einem Leuchttrank. Brakka liefert ihnen die Kessel. Ich habe das Rezept gelesen. Nie das Salz zuerst. Niemals. Sonst …“ Er macht ein Geräusch, das klingt wie ein sehr kleiner Donner.

„Und die Leise Hand“, fügt er hinzu, noch leiser, „prüft auch. Aber nur, wen sie selbst fragt.“

Zum Abschied drückt er dir die Zange. „Morgen bin ich am Stand von Knallfunke, direkt neben der Phiole. Falls du einen Erklärautomaten brauchst. Rein zufällig.“
->->

= grumak
~ gnolle_gesichtet = true
# bild: figur/grumak
Grumak sitzt hinter seinen halbleeren Säcken und starrt in die Kohlenpfanne. Als er dich sieht, hellt sich sein Gesicht ein wenig auf. „Ah. Der Bote. Komm, setz dich. Nüsse?“

Du setzt dich. Eine Weile sagt keiner etwas.

„Weißt du, was die Hirten erzählen?“, sagt Grumak dann. „Die aus Wollmark, draußen an der Spaltstraße. Sie sagen, oben am Rand der Weiden haben sie Gnolle gesehen. Drei Nächte hintereinander. Feuer in den Hügeln.“

„Aber der Spalt ist doch zu.“

„Eben.“ Grumak sieht dich an. „Der Spalt ist zu. Und trotzdem sind Gnolle hier drin. Also gibt es einen Weg herein, den die Waage nicht bewacht. Oder einen, den sie nicht bewachen will.“ Er wirft eine Nuss in die Glut. Sie zischt.

„Und noch etwas. Morgen, am Gildentag, hat die Waage überall ihre Leute. Bei jeder Prüfung. Sie schauen nicht, wer gewinnt. Sie schauen, wer zaubert.“ Er tippt sich an die Nase. „Ein alter Händler riecht so etwas.“

Zum Abschied füllt er dir die Taschen mit Nüssen. „Für den Gildentag. Prüfungen machen hungrig.“
->->

= mentor
~ mentor_tipp = true
~ aendern(beziehung_mentor, 1)
{ element:
- "erde":
    Borrik sitzt noch auf seinem Felsblock, als hätte er sich den ganzen Tag nicht bewegt. Vielleicht hat er das auch nicht.
    „Morgen wirst du gesehen“, sagt er. „Von vielen. Wenn du die Erde bittest, dann bitte leise. So leise, dass nur sie es hört.“ Er drückt deine Hand auf den Stein. „So. Spürst du? Nicht drücken. Lehnen.“
- "wasser":
    Nerelle sitzt an der Reling und lässt die Füße ins Wasser hängen. „Morgen wirst du gesehen“, sagt sie. „Von vielen. Wasser ist geduldig. Wenn du es rufst, dann wie eine Welle, die am Strand ankommt. Nicht wie ein Eimer, den man jemandem ins Gesicht kippt.“
- "feuer":
    Yrsa sitzt vor der Esse und schaut in die Glut. „Morgen wirst du gesehen“, sagt sie. „Von vielen. Wenn du Feuer rufst, dann ruf es klein. Die kleinste Flamme, die reicht. Groß kann jeder.“
- "wind":
    Vael öffnet dir, bevor du klopfst. Er sagt lange nichts. Dann: „Morgen wirst du gesehen. Wind sieht man nicht. Nur, was er tut. Tu wenig. Aber das genau.“
}

Ihr übt, bis die Sonne untergeht. Danach fühlst du dich sicherer. Als würde {element_artikel(element)} dir ein kleines Stück näher stehen als vorher.
->->
