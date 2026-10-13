// =====================================================================
// Perle 4 – Der Südhang: Jorrit in Ginsterhof, die Schafe am Grauen,
// das Schweigen und der Fremde
// =====================================================================

=== p4_suedhang
# karte: ginsterhof
# bild: szene/ginsterhof
Allein gehst du nach Süden. Ohne {freund()} ist der Weg doppelt so lang und halb so lustig.

Die Hügel werden steiler, die Mauern seltener. Gelber Ginster blüht zwischen grauen Felsen. Über dir wächst der Kharvan-Kamm in den Himmel, so nah jetzt, dass du einzelne Schneefelder erkennst. Und hoch oben, wie ein dünner Faden, der sich in Kehren den Berg hinaufzieht: die Ziegenstiege.

Ginsterhof ist kein Dorf. Es ist ein einziges krummes Haus mit einem Stall, einer Bank vor der Tür und ungefähr fünfzig Ziegen. Auf der Bank sitzt ein alter Mann mit weißen Bartstoppeln, einer Pfeife und einem Gesicht wie ein verschrumpelter Apfel.

„Nein“, sagt er, bevor du etwas gesagt hast.
~ jorrit_getroffen = true
{ erster_auftrag == "ginsterhof":
    -> paeckchen
}
-> ziege

= paeckchen
Du knöpfst die Jacke auf und zeigst ihm das eingenähte Zeichen im Futter. Eine Hand, die einen Finger an die Lippen legt.

Der Alte nimmt die Pfeife aus dem Mund. „Ah“, sagt er. „Dann ja.“

Er öffnet Finks Päckchen. Darin liegt eine Landkarte, mit dünner Tinte gezeichnet, und ein Zettel mit einem einzigen Wort: Ashka.

„Jorrit“, sagt der Alte und tippt sich an die Brust. „Die Hand und ich, wir kennen uns lange. Ich bringe Leute über die Berge. Leute, die die Waage nicht durchlässt.“ Er tippt auf die Karte. „Das hier ist ein Weg zu einem Versteck. Und Ashka ist die, die es braucht.“
~ auftrag_p4 = 2
~ wolfspfad_bekannt = true
-> jorrit_erzaehlt

= ziege
Hinter dem Haus meckert es kläglich. Eine junge Ziege ist auf einen Felsvorsprung über dem Bach geklettert und traut sich nicht mehr herunter.

Der Alte seufzt. „Die Dumme. Jeden Tag dasselbe.“
* [Zur Ziege hinaufklettern und sie herunterholen (Geschick)]
    ~ temp e = probe(geschick)
    ~ probe_zeile("Geschick", e)
    { e == MISSERFOLG:
        Du kletterst hinauf, greifst nach der Ziege, und die Ziege springt. Elegant, mühelos, direkt an dir vorbei nach unten. Du bleibst oben sitzen.
        Der Alte lacht, bis er husten muss. „So machen die das“, keucht er. „Erst rufen, dann allein runterkommen.“
    - else:
        Du kletterst hinauf, packst die Ziege und trägst sie herunter. Sie meckert dir die ganze Zeit ins Ohr.
    }
* {kann_zaubern(1) && element == "erde"} [Den Felsen bitten, eine Stufe für die Ziege zu formen (Zauber)]
    ~ temp z = zauber(1)
    ~ probe_zeile("Zauber", z)
    { z == MISSERFOLG || z == KEINE_KRAFT:
        Der Fels knirscht. Dann springt die Ziege herunter, bevor er sich entschieden hat.
    - else:
        Der Fels knirscht und schiebt eine kleine Stufe heraus. Die Ziege tippelt vorsichtig hinunter, als hätte es diese Stufe schon immer gegeben.
        Der Alte nimmt langsam die Pfeife aus dem Mund.
    }
* {kann_zaubern(1) && element == "wind"} [Den Wind bitten, die Ziege sanft herunterzutragen (Zauber)]
    ~ temp z2 = zauber(1)
    ~ probe_zeile("Zauber", z2)
    { z2 == MISSERFOLG || z2 == KEINE_KRAFT:
        Eine Böe fährt über den Felsen. Die Ziege legt die Ohren an und springt freiwillig. Vermutlich aus Empörung.
    - else:
        Ein sanfter Wind hebt die Ziege an, ein kleines Stück nur, und setzt sie neben dem Bach ab. Sie schüttelt sich, meckert und frisst weiter, als wäre nichts gewesen.
        Der Alte nimmt langsam die Pfeife aus dem Mund.
    }
* [Mit einem Büschel Gras locken (Ausstrahlung)]
    ~ temp e2 = probe(ausstrahlung)
    ~ probe_zeile("Ausstrahlung", e2)
    { e2 == MISSERFOLG:
        Die Ziege sieht dich an. Sieht das Gras an. Sieht dich wieder an. Und dreht dir das Hinterteil zu.
    - else:
        Du hältst der Ziege ein Büschel Klee hin und redest leise mit ihr. Nach einer Weile kommt sie herunter, Schritt für Schritt, und frisst dir aus der Hand.
    }
- „Jorrit“, sagt der Alte schließlich und tippt sich an die Brust. „Was willst du hier?“
-> jorrit_erzaehlt

= jorrit_erzaehlt
Du erzählst ihm von den Schafen, vom Lamm auf der Straße, von den Feuern in den Hügeln.

Jorrit zieht lange an seiner Pfeife. „Gnolle“, sagt er dann. „Ja. Da oben sind welche. Ich weiß es. Ich hab sie heruntergebracht.“
{ not wolfspfad_bekannt:
    Er sieht dich an, als wollte er abschätzen, ob er weiterreden darf. Dann zuckt er die Schultern. „Bist kein Söldner. Riechst nicht danach.“
    ~ wolfspfad_bekannt = true
}
„Neben der Ziegenstiege gibt es einen zweiten Pfad. Den Wolfspfad. Den kennen nur meine Ziegen und ich. Und jetzt die Gnolle. Oben auf der Stiege brennen die Fackeln der Waage. Aber auf dem Wolfspfad brennt nichts.“

„Und warum hast du ihnen geholfen?“

„Weil sie vor etwas weglaufen“, sagt Jorrit. „Hab nie Gnolle so laufen sehen. Mit ihren Jungen auf dem Rücken. Halb verhungert.“ Er deutet mit der Pfeife nach Süden, wo der Hang unter den Bergen in eine flache Senke übergeht. „Und weil das, wovor sie weglaufen, jetzt auch hier ist. Komm. Ich zeig's dir.“
-> grau

= grau
~ schweigen_gesehen = true
# bild: szene/das-graue
# karte: das-graue
Hinter dem nächsten Hügel bleibt Jorrit stehen. Er geht keinen Schritt weiter.

Vor dir liegt eine Senke voller Gras. Aber das Gras ist nicht grün. Es ist grau. Grau wie Asche, wie altes Papier, wie ein Bild, aus dem jemand alle Farben herausgewaschen hat. Der graue Fleck ist so groß wie der Marktplatz von Lysmara, und an seinem Rand stehen Schafe. Ein Dutzend. Sie stehen ganz still und starren in die Mitte.

Und es ist still. So still, dass du dein eigenes Herz hörst. Kein Vogel, kein Insekt, kein Wind. Selbst deine Schritte klingen, als würdest du durch Watte gehen.
{ erster_auftrag == "mondklee":
    Am Rand der Senke wächst Klee. Auf der einen Seite grün und frisch. Auf der anderen Seite grau und spröde wie Asche.
}
{ elementstufe > 0:
    Du greifst nach {element_dativ(element)}, ganz vorsichtig, so wie {element == "erde":Borrik}{element == "wasser":Nerelle}{element == "feuer":Yrsa}{element == "wind":Vael} es dir beigebracht hat.

    Nichts.

    Zum ersten Mal, seit es in dir erwacht ist, antwortet {element_artikel(element)} nicht. Es ist nicht fort. Es ist nur … still. Als hätte ihm jemand die Hand auf den Mund gelegt.
}
-> schafe

= schafe
„Da kommen sie hin“, flüstert Jorrit. „Alle. Jede Nacht ein paar mehr. Und wer zu lange am Rand steht …“ Er beendet den Satz nicht.
* [Die Schafe eins nach dem anderen aus dem Grauen ziehen (Kraft)]
    ~ temp e = probe(kraft)
    ~ probe_zeile("Kraft", e)
    { e:
    - ERFOLG:
        ~ schafe_gefunden = true
        ~ aendern(ruf_hirten, 1)
        Du packst das erste Schaf an der Wolle und ziehst. Es ist schwer, als wäre es mit dem Boden verwachsen. Dann, kaum hat es den grünen Rand erreicht, zuckt es zusammen, blökt und rennt davon. Du holst eines nach dem anderen. Am Ende sind es zwölf.
    - JA_ABER:
        ~ schafe_gefunden = true
        Du schaffst neun Schafe. Beim zehnten wirst du so müde, dass du dich setzen musst. Einfach nur hinsetzen. Nur kurz. Ins weiche graue Gras …
        Jorrit packt dich am Kragen und zerrt dich zurück. „Nicht hinsetzen“, sagt er. „Nie hinsetzen.“
    - else:
        Du ziehst das erste Schaf heraus. Beim zweiten wird dir so schwer in den Beinen, dass du stehen bleibst. Und stehst. Und stehst.
        Jorrit zerrt dich zurück ins Grüne. Du blinzelst. Die Sonne ist ein ganzes Stück weitergewandert.
    }
* [Ein lautes Hirtenlied singen, das die Schafe weckt (Ausstrahlung)]
    ~ temp e2 = probe(ausstrahlung)
    ~ probe_zeile("Ausstrahlung", e2)
    { e2 == MISSERFOLG:
        Du singst. Im Grauen klingt deine Stimme dünn und weit weg, als käme sie aus einem anderen Zimmer. Die Schafe rühren sich nicht.
    - else:
        ~ schafe_gefunden = true
        ~ aendern(ruf_hirten, 1)
        Du singst, so laut du kannst, ein altes Lied vom Hafen, das {bp()} immer gesungen hat. Im Grauen klingt es dünn. Aber die Schafe heben die Köpfe. Eins nach dem anderen dreht sich um und trottet auf deine Stimme zu, heraus ins Grüne, wo sie blökend davonspringen.
        Jorrit sieht dich an. „Nicht schlecht. Für ein Stadtkind.“
    }
* [Jorrits Ziegen holen. Ziegen sind lauter als jedes Lied.]
    ~ schafe_gefunden = true
    ~ aendern(ruf_hirten, 1)
    Jorrit sieht dich an, als hättest du etwas sehr Dummes und sehr Kluges gleichzeitig gesagt. Dann pfeift er. Fünfzig Ziegen kommen über den Hügel gesprungen und fangen am Rand des Grauen an zu meckern, alle gleichzeitig. Es ist der furchtbarste Lärm, den du je gehört hast.
    Und es wirkt. Die Schafe zucken, drehen sich um und rennen, als wäre ihnen ein Wolf auf den Fersen.
- { erster_auftrag == "wollmark" && schafe_gefunden:
    ~ auftrag_p4 = 2
}
-> wuk

= wuk
Da siehst du es.

Mitten im Grauen, weiter drinnen als alle Schafe, steht noch etwas. Klein. Mit rundem Bauch, großen Ohren und einem struppigen Fell voller Flecken. Ein Junges. Ein Gnollenjunges, kaum größer als ein Hund. Es steht da, die Augen offen, und rührt sich nicht.
* [Hineingehen und das Junge holen (Kraft)]
    -> hinein(true)
* [Hineingehen und dich dabei mit einem Seil an Jorrit binden lassen (Verstand)]
    -> hinein(false)
* [Nicht hineingehen. Es ist zu gefährlich.]
    -> fremder(4)

= hinein(mit_kraft)
Du gehst hinein.

Mit jedem Schritt wird es leiser. Dann wird es leer. Nicht nur um dich herum, auch in dir. Du vergisst, warum du hier bist. Du vergisst {freund()}. Du vergisst {bp()}. Du willst dich nur hinlegen. Ins graue Gras. Ganz kurz.
{ mit_kraft:
    ~ temp e = probe(kraft)
    ~ probe_zeile("Kraft", e)
    -> drinnen(e)
- else:
    ~ temp e2 = probe(verstand + 1)
    ~ probe_zeile("Verstand +1", e2)
    -> drinnen(e2)
}

= drinnen(e)
{ e:
- ERFOLG:
    ~ wuk_gerettet = true
    Du beißt dir auf die Zunge, so fest, dass es wehtut. Der Schmerz ist das Einzige, was nicht grau ist. Du hältst dich daran fest. Noch ein Schritt. Noch einer. Dann hast du das Junge im Arm, drehst dich um und gehst zurück. Jeder Schritt ist wie durch Honig.
    Am Rand fallt ihr beide ins grüne Gras. Das Junge blinzelt. Dann fängt es an zu wimmern, laut und kläglich und sehr lebendig.
    -> fremder(1)
- JA_ABER:
    ~ wuk_gerettet = true
    Du schaffst es bis zu dem Jungen. Du hebst es hoch. Und dann bleibst du stehen, mit dem Jungen im Arm, und weißt nicht mehr, in welche Richtung du gehen wolltest.
    Eine Hand legt sich auf deine Schulter. Eine Hand in einem grauen Lederhandschuh.
    -> fremder(2)
- else:
    Du kommst bis auf drei Schritte an das Junge heran. Dann setzt du dich hin. Einfach so. Das Gras ist weich und grau, und alles ist egal.
    Eine Hand legt sich auf deine Schulter. Eine Hand in einem grauen Lederhandschuh.
    -> fremder(3)
}

= fremder(fall)
~ fremder_p4 = true
# bild: szene/fremder-am-grauen
{ fall == 1:
    Als du aufsiehst, steht neben dir jemand, wo eben noch niemand war.
}
Der Fremde.

Er steht am Rand des Grauen, groß und schlank, im grauen Reisemantel, die Kapuze tief im Gesicht. Unter der Kapuze schimmern die Augen wie Mondlicht auf Wasser. Am Hals glänzt die Bronzeschließe: eine Spirale aus vier Linien.
{
- fall == 2:
    Er führt dich mit dem Jungen im Arm die letzten Schritte hinaus ins Grüne, eine Hand auf deiner Schulter. Seine Hand ist ganz leicht. Und mit jedem Schritt kommen die Farben zurück.
- fall == 3:
    Er hebt dich am Arm hoch und führt dich hinaus ins Grüne. Dann geht er noch einmal hinein, ruhig, als wäre das Graue ein ganz gewöhnliches Feld, hebt das Junge auf und trägt es heraus. Er legt es dir in die Arme. Es blinzelt und fängt an zu wimmern.
- fall == 4:
    Er geht ins Graue hinein, ruhig, als wäre es ein ganz gewöhnliches Feld, und es scheint ihm nichts anhaben zu können. Er hebt das Junge auf, trägt es heraus und legt es dir in die Arme. Es blinzelt und fängt an zu wimmern.
}

Jorrit hat die Pfeife fallen lassen.

„Gut“, sagt der Fremde. „Du lebst. Das Junge auch.“ Seine Stimme klingt wie trockenes Laub. Dasselbe Laub wie in der Regennacht unter dem Torbogen.
{
- brief_erhalten:
    Sein Blick wandert zu deiner Jacke, dorthin, wo der Brief steckt. „Du trägst ihn noch“, sagt er. „Gut.“
- fremder_getroffen:
    „Wir sehen uns wieder, habe ich gesagt“, sagt er. „Ich halte, was ich sage.“
- else:
    „Wir kennen uns noch nicht“, sagt er. „Aber ich kenne dich.“
}
-> fragen

= fragen
* [„Was ist das? Das Graue?“]
    „Die Alten haben es das Schweigen genannt“, sagt der Fremde. „Es nimmt den Elementen die Stimme. Und den Lebenden den Wunsch zu bleiben. Sie gehen einfach fort. Mit offenen Augen.“
    Du denkst an Grumak. An die leeren Dörfer hinter den Bergen. Die Türen offen, das Essen auf dem Tisch.
    -> fragen
* [„Wer bist du?“]
    Unter der Kapuze siehst du ein schmales Lächeln. „Jemand, der zuhört“, sagt er. „Allen vier.“
    Mehr sagt er nicht. Aber du hast das Gefühl, dass er nicht gelogen hat. Nur sehr viel nicht gesagt.
    -> fragen
* [„Woher kommt es?“]
    Der Fremde sieht zu den Bergen hinauf. Lange.
    „Das“, sagt er, „solltest du die fragen, die davor weglaufen.“ Er nickt zu dem Gnollenjungen in deinen Armen.
    -> fragen
* [„Warum hilfst du mir?“]
    „Weil du Wege kennst“, sagt er. „Das habe ich dir in der ersten Nacht gesagt. Damals war es eine Vermutung.“
    -> fragen
* [Genug gefragt.]
    -> abschied

= abschied
„Heute Nacht wird es wachsen“, sagt der Fremde. „Dort, wo die Gnolle sind. Es folgt ihnen. Es folgt allem, was eine Stimme hat.“ Er sieht dich an, und das Silber in seinen Augen wird für einen Moment ganz klar. „Sie werden dich brauchen. Und du sie.“

„Was soll ich tun?“

„Rufen“, sagt er. „So laut du kannst. Diesmal darfst du schreien.“

Jorrit bückt sich nach seiner Pfeife. Als er sich wieder aufrichtet, ist der Fremde fort. Nur am Rand des Grauen, im grünen Gras, sind noch zwei Fußspuren zu sehen. Und daneben, mit dem Stab in die Erde gezeichnet, eine kleine Spirale aus vier Linien.
{ erster_auftrag == "weiden_karte":
    ~ auftrag_p4 = 2
    Mit zitternden Fingern zeichnest du den Rand des Grauen in deine Karte. Ein Loch in der Weide. Und du schreibst daneben, was Orwin dir beigebracht hat: Wir zeichnen, was ist.
}
{ erster_auftrag == "mondklee":
    ~ auftrag_p4 = 2
    Bevor ihr geht, pflückst du Mondklee vom grünen Rand, bis der Korb voll ist. Und einen Stängel vom grauen, ganz vorsichtig, in ein eigenes Tuch gewickelt. Meisterin Ambra wird ihn sehen wollen.
}

Das Gnollenjunge in deinen Armen hat aufgehört zu wimmern. Es schnüffelt an deinem Kinn. Dann zappelt es, springt herunter und läuft ein paar Schritte den Hang hinauf, nach Osten. Bleibt stehen. Sieht sich nach dir um.

„Es will, dass du mitkommst“, sagt Jorrit. „Nach Hause.“
->->
