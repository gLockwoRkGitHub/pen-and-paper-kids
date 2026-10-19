// =====================================================================
// Perle 4 – Die Nacht: Das Schweigen kommt. Das Element wächst.
// Morgen danach, Tagebuch.
// =====================================================================

=== p4_nacht
# bild: szene/nacht-das-schweigen
{
- gnolle_verraten:
    Du kannst nicht schlafen. Strells Patrouille lagert am Hang unter der Schlucht. In einem Pferch aus Seilen und Pfählen sitzen die Gnolle, die sie gefangen haben, eng aneinandergedrängt. Ashka sitzt ganz vorn. Wuk liegt in ihrem Arm. Keiner von beiden sieht dich an.
    Die Söldner schlafen um ein Feuer. Strell sitzt wach daneben und schärft nichts, liest nichts, tut nichts. Er schaut nur in die Flammen.
- gnolle_vermittelt:
    In der Schlucht brennen zwei Feuer: eines der Gnolle, eines der Hirten. Merla und Ashka sitzen dazwischen und reden leise. Hirtenkinder und Gnollenjunge sind zusammen eingeschlafen, auf einem Haufen, wie junge Hunde.
- else:
    In Jorrits Versteck unter dem Wolfspfad, einer alten Schäferhütte aus Feldsteinen, schlafen die Gnolle dicht an dicht. Jorrit raucht vor der Tür. Wuk hat sich an dich gekuschelt und schnarcht leise.
}

Mitten in der Nacht wachst du auf, weil etwas fehlt.

Das Feuer brennt noch. Aber es knistert nicht mehr. Der Bach fließt noch. Aber er rauscht nicht mehr. Der Wind, der eben noch über den Hang gestrichen ist, steht still. Und vom Berg herunter kriecht etwas auf euch zu. Man sieht es nicht selbst, man sieht nur, was es tut: Es wäscht die Farbe aus der Welt. Wo es hinkommt, wird das Gras grau.

Das Schweigen.

Die Flammen werden kleiner. Kleiner. Dann gehen sie aus, alle gleichzeitig, als hätte jemand eine Hand darübergelegt.

Und die Schlafenden stehen auf.
{
- gnolle_verraten:
    Die Söldner erheben sich von ihren Decken, einer nach dem anderen, die Augen offen und leer. Strell auch. Ohne ein Wort gehen sie den Hang hinauf, dem Grauen entgegen. Im Pferch rüttelt Ashka an den Seilen und heult.
- gnolle_vermittelt:
    Gnolle, Hirten, Kinder. Sie stehen auf, als hätte sie jemand gerufen, und gehen auf das Graue zu. Merla auch. Nur Ashka bleibt stehen, die Pfoten in die Erde gekrallt, und heult.
- else:
    Die Gnolle stehen auf und gehen hinaus in die Nacht, auf das Graue zu. Jorrit auch, die kalte Pfeife noch im Mund. Nur Ashka bleibt stehen, die Pfoten in die Erde gekrallt, und heult.
}
{gnolle_verraten:Und Wuk zwängt sich zwischen den Seilen des Pferchs hindurch und geht auch.|Und Wuk. Wuk geht auch.}

Du greifst nach {element_dativ(element)}. Es ist still, so still, wie es am Mittag am Rand des Grauen war. Aber diesmal ist da noch etwas. Ganz tief in dir, unter der Stille, ein winziger Funke. Er glimmt. Er wartet.

Rufen, hat der Fremde gesagt. So laut du kannst. Diesmal darfst du schreien.
-> rufen

= rufen
~ temp hilfe = 0
{ wuk_gerettet:
    ~ hilfe += 1
}
{ beziehung_mentor >= 2:
    ~ hilfe += 1
}
* {not gnolle_verraten} [Ashka zurufen, dass alle Gnolle heulen sollen, so laut sie können, und mit ihnen zusammen rufen]
    ~ hilfe += 1
    „HEULT!“, schreist du. „ALLE!“
    Ashka versteht sofort. Sie wirft den Kopf in den Nacken und heult, und der Laut zerreißt die Stille wie ein Messer ein Tuch. Ein Gnoll nach dem anderen bleibt stehen, blinzelt, und heult mit.
    { gnolle_vermittelt:
        ~ hilfe += 1
        Und dann schreit Merla. Ein Hirtenschrei, mit dem man Schafe über drei Hügel ruft. Ihre Hirten fallen ein.
    }
    -> der_ruf(hilfe)
* {gnolle_verraten} [Ashka anflehen, mit dir zu heulen. Nicht für dich. Für Wuk.]
    ~ hilfe += 1
    „Ashka!“, schreist du. „Bitte! Für Wuk!“
    Ashka sieht dich an. Einen langen Augenblick. Dann wirft sie den Kopf in den Nacken und heult. Die anderen Gnolle im Pferch fallen ein. Nicht für dich. Für Wuk.
    -> der_ruf(hilfe)
* [Allein rufen. Mit allem, was du hast.]
    Du schließt die Augen. Du suchst den Funken. Du hältst dich an ihm fest.
    -> der_ruf(hilfe)

= der_ruf(hilfe)
~ temp e = probe(elementstufe + hilfe)
~ probe_zeile("Der große Ruf", e)
Und dann rufst du.

Nicht leise, nicht bittend, nicht einladend. Du schreist. Mit allem, was in dir ist.
{ element:
- "erde":
    # bild: szene/ruf-erde
    Der Boden antwortet. Erst ein Zittern, dann ein Grollen, tief unten, als würde der ganze Hang aufwachen. Steine brechen aus der Erde, einer neben dem anderen, ein Ring aus Fels, der aus dem Gras wächst, mannshoch, zwischen euch und dem Grauen. Und das Graue stößt dagegen wie Wasser gegen einen Damm. Und weicht zurück.
- "wasser":
    # bild: szene/ruf-wasser
    Das Wasser antwortet. Der Tau auf jedem Grashalm, der Bach, der Nebel in den Senken: alles steigt auf, glitzernd, ein silberner Schleier, der sich zwischen euch und das Graue legt. Wo das Graue ihn berührt, beginnt der Schleier zu rauschen, zu tropfen, zu singen. Und das Graue weicht zurück.
- "feuer":
    # bild: szene/ruf-feuer
    Das Feuer antwortet. Alle erloschenen Feuer am Hang flammen gleichzeitig wieder auf, höher als vorher, und aus jeder Flamme springen Funken, Tausende, ein Schwarm aus Licht, der dem Grauen entgegenfliegt. Wo die Funken hinfallen, knistert das Gras wieder. Und das Graue weicht zurück.
- else:
    # bild: szene/ruf-wind
    Der Wind antwortet. Von den Gipfeln herab stürzt ein Sturm, kalt und laut und wild, er heult mit den Gnollen um die Wette, er reißt an deinen Haaren und an deinem Mantel und fegt über den Hang. Er bläst das Graue vor sich her wie Rauch. Und das Graue weicht zurück.
}
~ schweigen_zurueck = true
~ kraftfunken = 0
{ elementstufe < 2:
    ~ elementstufe = 2
}
{ e:
- ERFOLG:
    Es weicht zurück bis an den Fuß der Berge, dorthin, woher es gekommen ist. Die Schlafwandler bleiben stehen, blinzeln, sehen sich verwirrt um.
    Wuk steht drei Schritte vor der grauen Grenze. Er dreht sich um, sieht dich, und rennt dir in die Arme.
    -> wer_gerettet(true)
- JA_ABER:
    Es weicht zurück. Langsam, widerwillig, Schritt für Schritt. Die Schlafwandler bleiben stehen, blinzeln.
    Aber nicht alle rechtzeitig. Drei von Jorrits Ziegen und ein paar Schafe sind schon zu weit gelaufen. Als das Graue sich zurückzieht, nimmt es sie mit. Sie werden grau, dann blasser und blasser, bis man sie nicht mehr vom Hang unterscheiden kann. Sie tauchen nicht wieder auf.
    Wuk steht zwei Schritte vor der grauen Grenze. Er dreht sich um, sieht dich, und rennt dir in die Arme.
    -> wer_gerettet(true)
- else:
    Es weicht zurück. Du spürst es weichen, Stück für Stück, und du hältst den Ruf, so lange du kannst. Länger, als du kannst.
    Das Letzte, was du siehst, bevor dir schwarz vor Augen wird: Wuk, der sich umdreht und auf dich zurennt.
    -> wer_gerettet(false)
}

= wer_gerettet(wach)
{ gnolle_verraten:
    ~ strell_schuldet = true
    { wach:
        Strell steht oben am Hang, nur einen Schritt vor dem Grauen. Er sieht an sich herunter, als wüsste er nicht, wie er hierhergekommen ist. Dann sieht er dich an. Er sagt nichts. Aber er sieht dich sehr lange an.
    - else:
        Später erzählt man dir, dass Hauptmann Strell nur einen Schritt vor dem Grauen stehen geblieben ist. Und dass er dich selbst den Hang hinuntergetragen hat.
    }
}
{ not wach:
    -> ohnmacht
}
Der Wind kommt zurück. Ein Feuer knistert. Irgendwo zirpt eine Grille, ganz zaghaft, als müsste sie erst wieder üben.

Du sinkst ins Gras. Es ist grün.

Und tief in dir glüht etwas, das vorher nicht da war. Größer als ein Funke. Wie ein Strom, der unter der Erde fließt.
->->

= ohnmacht
{ gnolle_verraten:
    Als du aufwachst, liegst du auf einer Decke in Strells Zelt. Die Sonne scheint durch den Eingang. Ein Söldner reicht dir einen Becher Wasser, ohne etwas zu sagen. Draußen hörst du, wie jemand sagt: „Das Kind hat gerufen. Und das Graue ist zurückgekrochen. Wegen dem Kind.“
- else:
    Als du aufwachst, liegst du auf einer Decke in Jorrits Hütte. Die Sonne scheint durch die Tür. Wuk schläft auf deinen Füßen.
    „Du warst weg“, sagt Jorrit. „Die ganze Nacht. Aber du hast geatmet.“ Er reicht dir eine Schale mit Ziegenmilch. „Das Graue ist zurück an den Berg gekrochen. Wegen dir.“
}

Tief in dir glüht etwas, das vorher nicht da war. Größer als ein Funke. Wie ein Strom, der unter der Erde fließt.
->->


=== p4_morgen_danach
# bild: szene/morgen-danach
Am Morgen siehst du es von oben: Das Graue ist geschrumpft. Es liegt jetzt nur noch als schmaler Streifen am Fuß der Berge, wie Asche am Rand eines erloschenen Feuers. Aber es ist noch da.
~ rasten()
Als du nach {element_dativ(element)} greifst, ist es sofort da. Näher als je zuvor. Stärker. Du spürst, dass du jetzt mehr rufen kannst als früher, öfter, weiter.
# tutorial: elementstufe
(Deine Elementstufe ist auf zwei gestiegen. Du hast jetzt {zahl(kraftfunken)} Kraftfunken.)
{
- gnolle_verraten:
    -> strell_morgen
- else:
    -> ashka_morgen
}

= ashka_morgen
~ gnollstein = true
~ aendern(ruf_gnolle, 1)
Ashka kommt zu dir, Wuk auf dem Rücken. Sie nimmt einen Stein von ihrer Kette, glatt und grün wie Gras nach dem Regen, mit einem Loch in der Mitte.

„Ein Stein aus unserem Land“, sagt sie. „Wenn du je über die Berge gehst, zeig ihn. Jeder Gnoll wird wissen: Freund. Zweimal Freund.“
{ gnolle_vermittelt:
    ~ aendern(ruf_hirten, 1)
    Hinter ihr stehen Merla und ihre Hirten. Merla nickt dir zu. „Die Schafe bleiben ab heute in Wollmark“, sagt sie. „Und die Gnolle in der Schlucht. Die Gnolle halten Wache. Wir bringen Brot.“ Sie verzieht den Mund. „Seltsame Zeiten.“
}
{ strell_getroffen:
    { gnolle_vermittelt:
        Gegen Mittag kommt Strells Patrouille die Schlucht herauf. Die Gnolle sind längst zwischen den Felsen verschwunden, lautlos wie Schatten. Am Feuer sitzen nur Merla und ihre Hirten und kauen Brot. „Hier sind nur Hirten“, sagt Merla und sieht Strell nicht einmal an.
    - else:
        Gegen Mittag kommt Strells Patrouille die Schlucht herauf. Sie findet ein kaltes Feuer, zertrampeltes Gras und sonst nichts.
    }
    { magie_registriert == "waage":
        ~ von_waage_notiert = true
        Strell sieht dich an. „Nichts gefunden, Rufer?“
        „Nichts.“
        Er notiert etwas. „Seltsam“, sagt er nur. „In der Nacht hat jemand am Hang gerufen. Laut. Sehr laut.“
    - else:
        Strell sieht dich kurz an, im Vorbeigehen. Er sagt nichts. Aber er hat das grüne Gras gesehen, mitten im Grauen. Und er ist nicht dumm.
    }
}
-> heimweg

= strell_morgen
Am Morgen steht Strell vor dem Pferch. Er sieht die Gnolle an. Dann dich.

„Ich habe Befehle“, sagt er. „Die Gnolle gehen nach Vardholm.“ Er macht eine Pause. „Aber ich schulde dir etwas. Mir hat noch nie jemand das Leben gerettet. Ich weiß nicht genau, wie man das zurückzahlt.“

Er dreht sich um und geht zu seinem Zelt. „Der Knoten am Pferch ist schlecht gebunden“, sagt er im Gehen, laut genug, dass alle es hören. „Sehr schlecht. Das sollte jemand heute Nacht nachsehen.“

Am nächsten Morgen ist der Pferch leer.

Ashka hat sich nicht von dir verabschiedet. Aber als die Gnolle in der Nacht davonschlichen, hat Wuk sich noch einmal umgedreht. Er hat dich angesehen. Lange.
-> heimweg

= heimweg
{ jorrit_getroffen && not gnolle_verraten:
    Jorrit begleitet dich bis zum Rand seiner Weide. „Wenn du hinauswillst“, sagt er, „gibt es den Wolfspfad. Ich bring dich hoch, wenn es so weit ist.“ Er kaut auf seiner Pfeife. „Aber wenn du wissen willst, woher das Graue kommt, frag nicht mich. Frag die Kobolde. Die graben da, wo es brummt.“
}
{ kompass:
    Du klappst Tickworts Kompass auf. Die Nadel zittert. Dann zeigt sie nach Nordosten. Dorthin, wo der Orin aus den Bergen kommt. Zu den Minen.
}
{ ausloeser == "verschwunden":
    Zu den Minen. Zur Tiefen Stiege. Dorthin, wo {bp()} ist.
}

Auf dem Rückweg nach Wollmark denkst du an alles, was Ashka gesagt hat. Das Graue kommt nicht über die Berge. Es kommt aus ihnen.

Es ist Zeit, unter den Berg zu gehen.
->->


=== p4_tagebuch
# bild: tagebuch/perle-4
# tagebuch: Die Weiden
In Wollmark schläfst du einen ganzen Tag und eine ganze Nacht. Dann schlägst du dein Buch auf.

Du zeichnest die Weiden, die Steinmauern, die Schafe. Ein krummes Haus mit fünfzig Ziegen. Eine Schlucht mit Zelten aus Fell. Und am Fuß der Berge einen grauen Streifen, den du nicht ausmalst, sondern leer lässt.
# karte: ginsterhof
# karte: das-graue

Darunter schreibst du: # handschrift

„Heute habe ich das Schweigen gesehen.
Es nimmt den Elementen die Stimme. Wer darin schläft, geht fort.
{ wuk_gerettet:
    Ich bin hineingegangen und habe Wuk herausgeholt.
}
{ fremder_p4:
    Der Fremde war da. Er sagt: Rufen. So laut du kannst.
}
Ich habe gerufen, und {element_artikel(element)} hat geantwortet, lauter als je zuvor.
{
- gnolle_vermittelt:
    Die Gnolle und die Hirten halten jetzt zusammen Wache. Merla und Ashka haben sich die Hand gegeben.
- gnolle_verraten:
    Ich habe die Gnolle an Strell verraten. Fünf Silberlinge. Wuk hat mich angesehen.
- gnolle_geholfen:
    Ich habe den Gnollen geholfen, sich zu verstecken.
}
{ gnollstein:
    Ashka hat mir einen grünen Stein geschenkt. Zweimal Freund.
}
{ freund_heimgeholt:
    {freund()} wurde nach Hause gebracht. Befehl von ganz oben. Wer ist ganz oben?
}
{ freund_mutter_angst:
    {freund()}s Mutter hat Angst. ‚Wenn es über die Berge kommt, brauchen wir jede Kugel.‘ Weiß sie vom Schweigen?
}
Ashka sagt: Das Graue kommt nicht über die Berge. Es kommt aus ihnen.
Der Berg brummt.
Ich gehe zu den Minen.“ # tagebuch_ende

Kraftfunken: {kraftfunken}
->->
