// =====================================================================
// Perle 5 – Der Eingang zu den Minen, die Grubenstadt der Kobolde
// und die Neumondnacht
// =====================================================================

=== p5_eingang
# bild: entdeckung/minentor
# karte: kobold-minen
Der Eingang zu den Minen ist ein Tor im Berg, so hoch wie die Ratshalle von Lysmara. Zwerge haben es gehauen, vor dreihundert Jahren, das sieht man an den kantigen Zeichen, die in den Stein gemeißelt sind. Aus dem Tor rollen Loren voller Erz auf Schienen bis zum Fluss.

Vor dem Tor steht ein Holzhaus mit dem Zeichen von Webstuhl und Amboss: dem Webschiffchen, gekreuzt mit einem Hammer. Davor ein dicker Gnom mit einem Klemmbrett. Und daneben, an einer Bank lehnend, zwei Söldner in schwarzen Mänteln mit der goldenen Waage.

„Gildenaufseher Dorn“, stellt sich der Gnom vor, ohne aufzusehen. „Hier kommt nur rein, wer zur Gilde gehört. Und ab übermorgen, ab Neumond, zeigt jeder Rufer zusätzlich seine Einschreibung.“
{
- gilde == "webstuhl_amboss":
    -> mit_gilde
- magie_registriert == "waage":
    -> mit_plakette
- kobold_gerettet || erzmarke:
    -> mit_grisk
- ruf_kobolde > 0:
    -> mit_mirk
- else:
    -> ohne
}

= mit_gilde
~ minen_zugang = "gilde"
Du zeigst das Abzeichen mit dem Webschiffchen. Dorn sieht auf, nickt und macht einen Haken auf seinem Klemmbrett. „Ein Mitglied. Von Kettrich angemeldet, ich weiß. Erst arbeiten, dann gehören.“ Er sieht dich über sein Klemmbrett hinweg an. „Aber nicht unter den zweiten Schacht. Da unten ist es nicht mehr sicher. Befehl von mir.“
-> drinnen

= mit_plakette
~ minen_zugang = "waage"
Einer der Söldner sieht die Messingplakette und stößt sich von der Bank ab. „Ein Rufer der Waage? Herein, herein.“ Er grinst. „Wir brauchen Rufer da unten. Die Kobolde graben zu langsam, und das dunkle Erz liegt tief.“

Dorn verzieht das Gesicht, sagt aber nichts.
-> drinnen

= mit_grisk
~ minen_zugang = "grisk"
~ grisk_wiedergesehen = true
Bevor Dorn noch etwas sagen kann, springt hinter einer Lore ein kleiner grauschuppiger Kobold hervor. Die Grubenlampe auf seinem Helm wackelt.

„FREUND VON GRISK!“, kreischt er und rennt auf dich zu. „Der hat Grisk aus dem Netz geholt! Der darf rein! Grisk bürgt!“

Dorn seufzt tief. „Grisk bürgt“, wiederholt er. „Natürlich.“ Er macht einen Haken. „Aber nicht unter den zweiten Schacht.“
-> drinnen

= mit_mirk
~ minen_zugang = "mirk"
Hinter Dorn taucht eine alte Koboldin mit einer gesprungenen Brille auf. Mirk. Sie erkennt dich sofort. „{geschlecht == "w":Die Starke|Der Starke} von der Erzlände“, sagt sie zu Dorn. „Mirk braucht Hilfe beim Schleppen. {geschlecht == "w":Die|Der} kommt mit.“

Dorn seufzt. „Mirk braucht Hilfe. Natürlich.“ Er macht einen Haken. „Aber nicht unter den zweiten Schacht.“
-> drinnen

= ohne
Du hast kein Gildenzeichen, keine Einschreibung, keinen Kobold, der für dich bürgt.
{ kobold_ignoriert:
    Hinter einer Lore siehst du einen kleinen grauschuppigen Kobold. Grisk. Er sieht dich auch. Er dreht sich um und geht.
    { grisk_wiedergesehen:
        Dann bleibt er stehen. Du hast dich an der Erzlände bei ihm entschuldigt. Er hat es nicht vergessen. Er kommt zurück, ganz langsam, und sagt zu Dorn: „Grisk bürgt.“ Er sieht dich nicht an. „Einmal.“
        ~ minen_zugang = "grisk"
        -> drinnen
    }
}
* [Dorn erklären, warum du hinunter musst (Ausstrahlung)]
    ~ temp e = probe(ausstrahlung)
    ~ probe_zeile("Ausstrahlung", e)
    { e == MISSERFOLG:
        -> abgewiesen
    - else:
        ~ minen_zugang = "geschlichen"
        Dorn hört zu. Als du vom Grauen erzählst, legt er das Klemmbrett weg. „Ich hab Kobolde verloren“, sagt er leise. „Sieben. Und die Waage fragt nur nach Erz.“ Er sieht zu den Söldnern hinüber. Dann winkt er dich unauffällig zum Seiteneingang. „Ich hab dich nicht gesehen.“
        -> drinnen
    }
* [Dich hinter einer Lore verstecken und mit ihr in den Berg rollen (Geschick)]
    ~ temp e2 = probe(geschick)
    ~ probe_zeile("Geschick", e2)
    { e2 == MISSERFOLG:
        -> abgewiesen
    - else:
        ~ minen_zugang = "geschlichen"
        Du duckst dich in eine leere Lore, die gerade in den Berg zurückgeschoben wird. Sie rumpelt durch das Tor, an Dorn vorbei, an den Söldnern vorbei. Nach hundert Schritten Dunkelheit springst du heraus.
        -> drinnen
    }

= abgewiesen
~ minen_zugang = "geschlichen"
„Raus“, sagt Dorn und zeigt zum Fluss. „Kein Zeichen, kein Zutritt.“

Du setzt dich ans Ufer und starrst auf das Tor. Es wird dunkel. Dann zupft jemand an deinem Ärmel. Ein ganz junger Kobold, die Lampe auf dem Helm abgedeckt.

„Mirk sagt: komm“, flüstert er. „Durch den Luftschacht. Mirk sagt: Wer das Graue zurückgeschrien hat, darf rein.“ Er grinst. „Kobolde hören alles. Auch von den Weiden.“

Ihr kriecht durch einen engen Schacht, der nach Rauch und Moos riecht, bis er sich zu einer riesigen Höhle öffnet.
-> drinnen

= drinnen
->->


=== p5_grubenstadt
# bild: entdeckung/glimmhalde
# karte: glimmhalde
Mitten im Berg liegt eine Stadt.

Die Kobolde nennen sie Glimmhalde. Eine Höhle, so groß, dass die Decke im Dunkeln verschwindet. An den Wänden kleben Häuser wie Schwalbennester, verbunden durch Leitern, Stege und Hängebrücken. Hunderte Grubenlampen glimmen in allen Farben, gelb, grün, blau. In der Mitte liegt ein unterirdischer See, schwarz und still, und auf ihm treiben Flöße mit Pilzgärten.

Es ist wunderschön. Und es ist zu leise. Viel zu leise für eine Stadt.
{ minen_zugang == "waage":
    Hinter dir sagt der Söldner, der dich hereingebracht hat: „Morgen früh gehst du mit dem Vorarbeiter runter. Dunkles Erz. Wir brauchen jedes Stück.“ Dann geht er zurück zum Tor. In Glimmhalde will kein Söldner länger bleiben als nötig.
}

Mirk empfängt dich in ihrem Haus, das an einer Felswand hängt. Sie wirkt älter als an der Erzlände, die Brille ist inzwischen zweimal gesprungen.
{ grisk_wiedergesehen || kobold_gerettet:
    Grisk sitzt neben ihr und schnitzt an einem Stück Holz. Als er dich sieht, springt er auf.
}

„Sieben“, sagt Mirk. „Sieben von uns sind in den dritten Schacht gestiegen. Vor vier Tagen. Die Waage will dunkles Erz. Stimmerz nennen sie es. Es summt, wenn man es in der Hand hält. Ohne Stimmerz hält das Glas der Kugeln die Kraft nicht fest.“ Sie nimmt die Brille ab. „Je tiefer wir graben, desto mehr Stimmerz. Und desto lauter brummt der Berg.“

„Und die Sieben?“

„Nicht zurückgekommen. Wer runtergeht, um sie zu holen, kommt auch nicht zurück. Zwei schon.“ Sie setzt die Brille wieder auf. „Unten ist es grau, sagen die, die bis zur Treppe gekommen sind. Grau und still.“
{ ausloeser == "verschwunden":
    „Und {bp_ist_m():der Mann|die Frau} mit dem Seil?“, fragst du. Deine Stimme zittert.
    Mirk sieht dich lange an. „Auch runter“, sagt sie. „Vor fünf Tagen. Die Tiefe Stiege hinunter, über den dritten Schacht. Wollte auf die andere Seite.“
}

„Ich gehe runter“, sagst du.

Mirk lacht nicht. „Ja“, sagt sie. „Deshalb hat Mirk dich geholt. Du hast das Graue auf den Weiden zurückgeschrien. Kobolde können nicht schreien wie du.“
-> begleitung

= begleitung
{ kobold_ignoriert && minen_zugang != "grisk":
    Grisk steht in der Tür und hört zu. Als du ihn ansiehst, verschränkt er die Arme. „Grisk geht nicht mit Leuten, die Grisk ins Wasser fallen lassen“, sagt er. Dann geht er.
    Das tut weh. Aber es ist fair.
    Mirk seufzt. „Dann geht Mirk mit. Alte Beine. Aber gute Ohren.“
    ->->
}
* {grisk_wiedergesehen || kobold_gerettet} [Grisk bitten, mitzukommen]
    ~ grisk_begleitet = true
    ~ aendern(ruf_kobolde, 1)
    Grisk hört auf zu schnitzen. „Grisk kennt die Tiefe Stiege“, sagt er. „Bis zur Treppe. Weiter nicht.“ Er steckt das Messer weg. „Bis zur Treppe ist besser als gar nicht.“
* [Mirk bitten, mitzukommen]
    Mirk nickt. „Alte Beine“, sagt sie. „Aber gute Ohren. Mirk hört, wo der Berg hohl ist.“
* [Allein gehen. Du willst niemanden mehr in Gefahr bringen.]
    Mirk schüttelt den Kopf. „Allein ist dumm“, sagt sie. Dann zuckt sie die Schultern. „Aber mutig. Nimm wenigstens das.“ Sie drückt dir eine Rolle Seil und eine Grubenlampe in die Hand.
    Als du dann am dritten Schacht stehst, steht sie trotzdem hinter dir, mit Helm und Lampe. „Mirk hat gesagt: allein ist dumm“, sagt sie. „Mirk hat nicht gesagt, dass Mirk zu Hause bleibt.“
- ->->


=== p5_neumond
# bild: szene/neumond-glimmhalde
Einen Tag lang bereitet ihr den Abstieg vor. Seile, Lampen, Proviant, Kreide, um die Wege zu markieren. Am Nachmittag hast du ein paar Stunden für dich.
* [Mit Mirk die alten Zwergenzeichen studieren, die überall in der Tiefen Stiege stehen (Verstand)]
    ~ temp e = probe(verstand)
    ~ probe_zeile("Verstand", e)
    { e == MISSERFOLG:
        Mirk malt dir die Zeichen mit Kreide auf einen Stein. Kantige Striche, Haken, Kreise. Nach einer Stunde schwirrt dir der Kopf. Ein Zeichen hast du dir gemerkt: das für „Treppe“. Hoffentlich hilft es.
    - else:
        ~ runen_gelernt = true
        Mirk malt dir die Zeichen mit Kreide auf einen Stein. Kantige Striche, Haken, Kreise. Nach einer Weile erkennst du ein Muster. Das hier heißt „Treppe“. Das „Abgrund“. Und das, ein Strich unter einem Bogen, heißt „verborgener Weg“.
        „Kluges Kind“, sagt Mirk. „Die Zwerge haben nie etwas gebaut, ohne einen zweiten Weg.“
    }
* [Den Koboldkindern im Pilzgarten auf dem See helfen]
    ~ aendern(ruf_kobolde, 1)
    Die Pilzgärten treiben auf Flößen über den schwarzen See. Ein Dutzend Koboldkinder zeigt dir, wie man Glimmpilze erntet, ohne dass sie aufhören zu leuchten: ganz langsam, mit zwei Fingern, und dabei summen. Am Ende bist du nass bis zu den Knien und hast elf neue Freunde, die alle gleichzeitig reden.
* [Dich allein ans Ufer des schwarzen Sees setzen und {element_artikel(element)} üben]
    ~ mentor_tipp = true
    Du setzt dich ans Ufer. Es ist still hier unten, aber nicht die graue Stille. Eine gute Stille. Du übst, was {element == "erde":Borrik}{element == "wasser":Nerelle}{element == "feuer":Yrsa}{element == "wind":Vael} dir gezeigt hat, ganz leise, immer wieder, bis {element_artikel(element)} dir antwortet wie ein alter Freund.
- In der zweiten Nacht in Glimmhalde ist Neumond.

Du liegst auf einer Strohmatte in Mirks Haus und kannst nicht schlafen. Durch einen Luftschacht hoch oben siehst du ein kleines Stück Himmel. Kein Mond. Nur Sterne.

Um Mitternacht passiert es.
{ magie_registriert == "waage":
    ~ neumond_funke = true
    ~ kraftfunken = MAX(0, kraftfunken - 1)
    Die Messingplakette an deinem Hals wird plötzlich eiskalt. Dann zieht etwas an dir. Ganz tief innen, dort, wo {element_artikel(element)} wohnt. Es tut nicht weh. Es ist schlimmer: Es fühlt sich an, als würde jemand einen Faden aus dir herausziehen, langsam, ohne zu fragen.
    Ein Funke deiner Kraft löst sich von dir. Durch den Luftschacht siehst du ihn davonfliegen, ein winziges Licht, nach Osten. Nach Vardholm.
    Du liegst noch lange wach und hältst die kalte Plakette in der Faust.
- else:
    Durch den Luftschacht siehst du plötzlich Lichter am Himmel. Winzige Funken, Dutzende, Hunderte, die alle in dieselbe Richtung fliegen, nach Osten, wie Sternschnuppen, die nicht fallen, sondern wandern.
    „Die Funken der Eingeschriebenen“, sagt Mirk leise aus dem Dunkeln. Sie ist auch wach. „Alle, die bei der Waage stehen. Jeden Neumond einer. Nach Vardholm.“
    Sie dreht sich auf die andere Seite. „Schön sieht es aus“, murmelt sie. „Traurig auch.“
}
{ magie_registriert == "":
    Und ab heute Nacht bist du draußen ein Ungeprüfter. In Glimmhalde fragt niemand danach. Aber irgendwann musst du wieder hinaus.
}
~ rasten()
{ neumond_funke:
    Gegen Morgen schläfst du doch noch ein. Als du aufwachst, ist die Kraft zurück. Fast. Ein Funke fehlt. Und jeden Neumond wird die Waage wieder einen holen.
- else:
    Gegen Morgen schläfst du doch noch ein. Als du aufwachst, ist die Kraft in dir voll und ruhig.
}
->->
