// =====================================================================
// Perle 5 – Das Herz des Berges, die Flucht, der Abschied von
// Glimmhalde und das Tagebuch
// =====================================================================

=== p5_herz
# bild: szene/herz-des-berges
# karte: herz-des-berges
{ bp_gefunden:
    {bp()} bleibt mit den geretteten Kobolden auf der Treppe. „Ich warte hier“, sagt {bp_er()}. „Und wenn du in einer Stunde nicht zurück bist, komme ich dich holen. Diesmal folge ich dir.“
- else:
    Die geretteten Kobolde bleiben auf der Treppe. Sie wollen nicht noch einmal in die Nähe des Grauen.
}
Du gehst weiter. {grisk_begleitet:Grisk|Mirk} geht neben dir, ganz dicht.

Der Gang öffnet sich zu einer Höhle, die so groß ist, dass deine Lampe ihre Wände nicht erreicht. Der Boden ist glatt wie poliert. In den Boden sind Linien aus hellem Stein eingelassen, so groß wie der ganze Marktplatz von Lysmara: vier Ringe, ineinander verschlungen.

Und in der freien Mitte zwischen den vier Ringen schwebt etwas.

Eine Kugel aus Kristall, so groß wie ein Haus. In ihr kreisen vier Lichter, langsam, umeinander, wie Fische in einem Teich. Ein braunes, ein blaues, ein rotes, ein weißes. Erde, Wasser, Feuer, Wind. Das Brummen kommt aus ihr. Es ist ein Lied, merkst du plötzlich. Ein uraltes Lied mit vier Stimmen.
~ herz_gesehen = true

Und für einen Augenblick, einen einzigen Herzschlag lang, hörst du nicht nur {element_artikel(element)}. Du hörst alle vier. Die Erde, geduldig. Das Wasser, beweglich. Das Feuer, ungeduldig. Den Wind, frei. So, als stündest du mitten in ihnen.
{ spirale_im_gewoelbe:
    Die vier Gestalten im Mosaik unter der Ratshalle. Stein, Welle, Flamme, Feder. Sie haben diesen Ort gekannt.
}
{ brief_erhalten:
    Unter deiner Jacke glüht der Brief. So warm, dass er fast brennt.
}

Dann siehst du den Riss.

Er zieht sich von der Seite durch den Kristall, eine dunkle, gezackte Linie. Und wo er ist, sind die Lichter blass. Von seinem Ende aus wird der helle Stein der Ringe grau, Stück für Stück, als würde jemand die Farbe aus dem Boden trinken.

Das Schweigen. Es kommt von hier.
-> stollen

= stollen
Du folgst dem Riss mit den Augen bis zur Höhlenwand. Dort ist ein Loch in der Wand. Kein alter Gang wie die Tiefe Stiege. Ein frischer, roher Stollen, mit Spitzhacken gehauen, die Spuren noch hell im Stein. Er führt geradewegs auf den Kristall zu. Der Riss beginnt genau dort, wo der Stollen auf die Höhle trifft.

Im Stollen stehen Kisten. Auf jeder Kiste ist mit Kreide ein Zeichen gemalt: eine Waage. In den Kisten liegen dunkle Brocken, die leise summen, wenn du die Hand darüberhältst. Stimmerz.
~ waage_stollen_gesehen = true

„Hier haben wir gegraben“, flüstert {grisk_begleitet:Grisk|Mirk}. „Für die Waage. Tiefer und tiefer. Weil hier das beste Stimmerz liegt.“ Die Stimme bricht. „Wir haben den Berg kaputt gemacht. Und es nicht gewusst.“

Du verstehst. Die Waage wollte Stimmerz für ihre Kugeln. Die Kobolde haben gegraben. Der Stollen hat das Herz getroffen. Seit dem Winter brummt der Berg. Im Frühling kam das Graue, erst drüben bei den Gnollen, jetzt auch hier.

Und die Waage sammelt Kraft in Kugeln, um sich vor dem Grauen zu schützen. Vor dem Grauen, das sie selbst geweckt hat. Ohne es zu wissen.
{ freund_mutter_angst:
    Wenn es über die Berge kommt, brauchen wir jede Kugel. {freund()}s Mutter glaubt, es kommt über die Berge. Aber es kommt aus dem Berg. Aus dem Stollen der Waage.
}

Da wird das Brummen lauter. Der graue Fleck unter dem Riss wächst, schneller jetzt, als hätte der Kristall gespürt, dass jemand da ist.

„Es wird mehr!“, ruft {grisk_begleitet:Grisk|Mirk}. „Wir müssen weg! Gleich!“

Du hast Zeit für eine Sache. Nur eine.
* [Den Stollen zum Einsturz bringen, damit niemand mehr am Herz gräbt und der Riss zur Ruhe kommt]
    -> versiegeln
* [Einen Splitter vom Kristall und eine Kiste mit dem Zeichen der Waage als Beweis mitnehmen]
    -> beweis

= versiegeln
„Die Stützbalken!“, rufst du. „Wenn wir die Balken im Stollen umwerfen, kommt die Decke herunter.“

{grisk_begleitet:Grisk|Mirk} nickt. „Dann gräbt hier keiner mehr. Nie mehr.“
* [Die Stützbalken mit aller Kraft umreißen (Kraft)]
    ~ temp e = probe(kraft)
    ~ probe_zeile("Kraft", e)
    -> versiegelt(e)
* [Den einen Balken finden, der alles trägt (Verstand)]
    ~ temp e2 = probe(verstand)
    ~ probe_zeile("Verstand", e2)
    -> versiegelt(e2)
* {kann_zaubern(1) && element == "erde"} [Den Berg bitten, den Stollen zu schließen (Zauber)]
    ~ temp z = zauber(1)
    ~ probe_zeile("Zauber", z)
    { z == KEINE_KRAFT:
        Leer. Du musst es mit den Händen versuchen.
        ~ temp e3 = probe(kraft)
        ~ probe_zeile("Kraft", e3)
        -> versiegelt(e3)
    }
    Du legst beide Hände an die Wand des Stollens. Bitte, denkst du. Schließ dich. Und der Berg, der so lange geduldig war, antwortet. Die Wände rücken zusammen, langsam, knirschend, wie zwei Hände, die sich falten.
    -> versiegelt(z)
* {kann_zaubern(0) && element != "erde"} [{element == "wasser":Wasser aus dem Fels in den Stollen strömen lassen, bis die Balken wegschwimmen}{element == "feuer":Mit Feuer aus deiner Lampe die Stützbalken in Brand setzen}{element == "wind":Einen Sturm durch den Stollen jagen, der die Balken umreißt} (Zauber)]
    ~ temp z2 = zauber(0)
    ~ probe_zeile("Zauber", z2)
    { z2 == KEINE_KRAFT:
        Leer. Du musst es mit den Händen versuchen.
        ~ temp e4 = probe(kraft)
        ~ probe_zeile("Kraft", e4)
        -> versiegelt(e4)
    }
    -> versiegelt(z2)

= versiegelt(e)
~ stollen_versiegelt = true
~ aendern(ruf_kobolde, 1)
{ e:
- ERFOLG:
    Ein Balken kippt. Dann der nächste. Dann kommt die Decke herunter, mit einem Donnern, das durch den ganzen Berg rollt. Staub wallt auf. Als er sich legt, ist der Stollen fort. Nur noch Geröll, bis an die Decke.
    Das Brummen wird leiser. Nicht still. Aber leiser. Der Riss im Kristall ist noch da. Aber der graue Fleck darunter wächst nicht mehr, als hätte das Herz aufgehört, sich zu wehren.
- JA_ABER:
    Die Decke kommt herunter. Aber schneller als gedacht. Ein Brocken streift deine Schulter, du stolperst, {grisk_begleitet:Grisk|Mirk} reißt dich zur Seite. Der Stollen ist zu. Deine Schulter wird morgen blau sein.
    Das Brummen wird leiser.
- else:
    Die Decke kommt herunter, viel zu früh. Staub, Lärm, Dunkelheit. Du weißt nicht, wie lange du am Boden liegst. Dann zieht dich {grisk_begleitet:Grisk|Mirk} am Ärmel, hustend, grau vor Staub.
    „Zu“, keucht {grisk_begleitet:Grisk|Mirk}. „Stollen ist zu. {grosse_figur(false)} ist ganz. Fast.“
    Das Brummen wird leiser.
}
->->

= beweis
„Wenn die Leute in Lysmara das sehen“, sagst du, „wenn sie wissen, dass die Waage das Graue selbst geweckt hat …“

{grisk_begleitet:Grisk|Mirk} sieht dich an, dann den Stollen, dann den Riss. „Dann gräbt hier vielleicht keiner mehr“, sagt {grisk_begleitet:er|sie} langsam. „Vielleicht.“

Am Fuß des Kristalls liegen Splitter, die abgebrochen sind, als der Riss entstand. Sie glimmen schwach, in allen vier Farben.
* [Einen Splitter greifen und die Kiste aus dem Stollen schleppen (Geschick)]
    ~ temp e = probe(geschick)
    ~ probe_zeile("Geschick", e)
    -> genommen(e)
* [Vorsichtig mit dem Seil einen großen Splitter heranziehen (Verstand)]
    ~ temp e2 = probe(verstand)
    ~ probe_zeile("Verstand", e2)
    -> genommen(e2)

= genommen(e)
~ herzsplitter = true
{ e:
- ERFOLG:
    Du hebst einen Splitter auf, so lang wie deine Hand. Er ist warm und summt leise, und in ihm kreisen winzige Lichter, braun, blau, rot, weiß. {grisk_begleitet:Grisk|Mirk} schleppt die Kiste mit dem Kreidezeichen der Waage heraus. Darauf steht in einer Schreiberhand: „Stimmerz. Für Vardholm. Dritter Schacht, tiefste Sohle.“
- JA_ABER:
    Du bekommst einen Splitter zu fassen. Als du ihn aufhebst, kriecht das Grau über den Boden bis an deine Finger, und für einen Moment wird dein Arm farblos und taub bis zur Schulter. Dann ist es vorbei. Die Kiste schleppt {grisk_begleitet:Grisk|Mirk}.
- else:
    Du greifst nach einem Splitter, aber das Grau ist schneller. Es frisst sich über den Boden, und die Splitter werden stumpf und farblos. Im letzten Moment erwischst du einen kleinen, kaum größer als ein Daumen. Er glimmt nur noch schwach. Die Kiste müsst ihr zurücklassen.
}
->->


=== p5_flucht
# bild: szene/flucht-tiefe-stiege
Ihr rennt.

Hinter euch kriecht das Graue die Treppe hinauf. Nicht schnell, aber stetig, und wo es hinkommt, werden die Lampen blass. {stollen_versiegelt:Es ist weniger als vorhin. Aber es ist noch da.}
{ bp_gefunden:
    Auf den Stufen wartet {bp()} mit den Kobolden. {Bp_er()} sieht dein Gesicht und fragt nichts. {Bp_er()} packt nur deine Hand. „Lauf.“
- else:
    Auf den Stufen warten die Kobolde. Sie sehen dein Gesicht und fragen nichts. „Lauf“, sagt der Älteste.
}

Auf halber Höhe der Treppe kommt ihr an einer Abzweigung vorbei, die du beim Abstieg nicht bemerkt hast. Ein alter Gang, schnurgerade, nach Osten. Aus ihm weht ein Luftzug, kalt und frisch. Und ganz weit hinten, so weit, dass es nur ein Stecknadelkopf ist: ein winziger Punkt aus Licht.
~ tiefe_stiege_weg = true

„Der alte Weg“, keucht {grisk_begleitet:Grisk|Mirk}. „Ganz durch den Berg. Bis auf die andere Seite. Das da hinten ist Himmel.“

Für einen Herzschlag bleibst du stehen. Draußen. Jenseits der Berge. Ganz nah.

Dann zieht dich jemand weiter.
* [Weiterrennen, so schnell du kannst (Geschick)]
    ~ temp e = probe(geschick)
    ~ probe_zeile("Geschick", e)
    -> oben(e)
* {kann_zaubern(1) && element == "erde"} [Hinter euch eine Wand aus Fels wachsen lassen (Zauber)]
    -> zauber_flucht(1)
* {kann_zaubern(0) && element != "erde"} [Dich umdrehen und das Graue mit deinem Element zurückschreien (Zauber)]
    -> zauber_flucht(0)

= zauber_flucht(u)
~ temp z = zauber(u)
~ probe_zeile("Zauber", z)
{ z == KEINE_KRAFT:
    Leer. Ihr müsst rennen.
    ~ temp e = probe(geschick)
    ~ probe_zeile("Geschick", e)
    -> oben(e)
}
{ z == MISSERFOLG:
    {element_artikel(element) == "die Erde":Der Fels bewegt sich, aber nur ein bisschen.|Dein Ruf kommt, aber er ist dünn hier unten.} Das Graue zögert nur einen Augenblick.
- else:
    { element:
    - "erde":
        Hinter euch schiebt sich der Fels zusammen, eine Wand, von der Treppe bis zur Decke. Das Graue stößt dagegen und bleibt dahinter.
    - "wasser":
        Aus den Wänden bricht Wasser und rauscht die Treppe hinunter, ein Bach, dann ein Fluss, laut und lebendig. Das Graue weicht vor dem Rauschen zurück.
    - "feuer":
        Du schreist, und alle Lampen auf allen Helmen flammen auf einmal auf, hell wie Mittag. Das Graue zuckt zurück vor dem Licht.
    - else:
        Ein Sturm braust die Treppe hinunter, heult durch den Berg wie durch eine riesige Flöte. Das Graue wird zurückgeblasen.
    }
}
-> oben(z)

= oben(e)
{ e:
- MISSERFOLG:
    Auf den letzten Stufen geben deine Beine nach. Du willst dich nur kurz hinsetzen. Aber kleine Hände packen dich{bp_gefunden:, dazu {bp()}s Arme}, und tragen dich die letzten Stufen hinauf, bis zum dritten Schacht, bis die Farben zurückkommen.
- else:
    Ihr erreicht den dritten Schacht. Hinter euch bleibt das Graue zurück, unten in der Tiefe, wo es hergekommen ist. Ihr lehnt euch an die Wand und keucht und lacht, alle gleichzeitig, Kobolde und Menschen, weil ihr noch da seid.
}
->->


=== p5_danach
# bild: szene/glimmhalde-fest
In Glimmhalde leuchten in dieser Nacht alle Lampen. Alle. Die Kobolde haben die sieben Vermissten wieder, und sie singen, und ihr Gesang klingt wie Steine, die einen Hang hinunterkollern. Fröhlich und laut.
~ rasten()

{ vermisste_gerettet:
    Ein kleiner Kobold rennt über die Brücke auf dich zu, den viel zu großen Helm in der Hand. Pip. Hinter Pip kommt ein Kobold mit grauen Flecken auf den Schuppen, noch etwas wacklig auf den Beinen: der Onkel.
    { pip_himmel:
        „Er hat gesagt, oben ist alles wahr, was du erzählt hast!“, ruft Pip. „Wenn ich groß bin, geh ich nach oben und guck es mir an.“
    - else:
        „Du hast ihn zurückgebracht“, sagt Pip und hält dir eine winzige, krumme Grubenlampe hin. „Die achte Lampe. Die hab ich für dich angezündet. Sie ist ein bisschen schief.“
    }
}

Mirk setzt sich neben dich. Sie hält eine alte Grubenlampe in den Händen. In ihrem Glas steckt ein kleiner dunkler Splitter, der leise summt.

„Singende Lampe“, sagt sie. „Mit Stimmerz drin. Gutem, altem, nicht aus dem Herz. Die brennt auch im Grauen. Eine Weile. Nicht lange.“ Sie drückt sie dir in die Hand. „Für Freund von Glimmhalde.“
~ singlampe = true
~ aendern(ruf_kobolde, 1)
{ grisk_begleitet:
    Grisk setzt sich auf deine andere Seite. „Grisk kennt jetzt den Weg“, sagt er. „Den alten. Ganz durch.“ Er sieht dich an. „Wenn du hinaus willst: Grisk führt dich. Grisk vergisst nicht.“
}
{ stollen_versiegelt:
    -> nach_versiegeln
- else:
    -> nach_beweis
}

= nach_versiegeln
Am nächsten Morgen tobt Gildenaufseher Dorn. Der Stollen ist eingestürzt, das beste Stimmerz ist verschüttet, und die Waage wird fragen, warum keine Kisten mehr kommen.
{ gilde == "webstuhl_amboss":
    Dann nimmt er dich zur Seite. „Kettrich wird toben“, sagt er leise. „Und dann wird er froh sein. Wir haben den Berg kaputtgegraben. Für Silber von der Waage.“ Er seufzt. „Regel eins: Erst arbeiten, dann gehören. Da steht nicht: Alles ausgraben, was die Waage will.“
- else:
    ~ aendern(ruf_webstuhl_amboss, -1)
    Er sieht dich lange an. Er weiß, dass du unten warst. Er sagt nichts. Aber er streicht deinen Namen von seiner Liste. Ganz dick.
}
{ minen_zugang == "waage":
    Am Tor fragt der Söldner nach dem dunklen Erz. „Verschüttet“, sagst du. „Der Berg wollte nicht mehr.“ Er flucht. Er glaubt dir. Halb.
    ~ von_waage_notiert = true
}
Die Waage wird kein Stimmerz mehr bekommen. Keine neuen Kugeln. Nur die, die sie schon hat. Und die Funken, die sie jeden Neumond einsammelt.
-> heimwaerts

= nach_beweis
Den Splitter wickelst du in ein Tuch und steckst ihn ganz unten in deine Tasche. Er summt leise, wie eine Biene, die man in der Hand hält.
{ grisk_begleitet:
    Am Tor durchsuchen die Söldner jeden, der herauskommt. Grisk grinst. Er lässt sich den Splitter geben, versteckt ihn in einer Lore voller gewöhnlichem Erz und schiebt sie selbst hinaus. Niemand schaut in eine Lore, die ein Kobold schiebt.
- else:
    Am Tor durchsuchen die Söldner jeden, der herauskommt. Mirk zieht dich zu einem Luftschacht. „Kobolde gehen nie durch das Tor, wenn sie etwas tragen“, sagt sie.
}
Unten im Berg graben sie weiter, die Waage hat ihren Stollen noch. Aber du hast den Beweis.
-> heimwaerts

= heimwaerts
{ bp_gefunden:
    Als ihr aus dem Berg tretet, blinzelt {bp()} in die Sonne, als hätte {bp_er()} sie seit Jahren nicht gesehen. „Ich gehe nach Hause“, sagt {bp_er()}. „Nach Lysmara. Und du?“
    „Nach Vardholm.“
    {bp()} sieht dich lange an. Dann nickt {bp_er()}. „Du bist größer geworden“, sagt {bp_er()}. „Nicht in den Beinen.“
}
{ talin_hilft:
    Talin geht mit euch aus dem Berg. Am Tor hält er die Messingplakette in der Hand und sieht sie lange an. „Sie schicken alle Eingeschriebenen nach Vardholm“, sagt er. „In ein paar Tagen. Für das Werk, sagen sie.“ Er steckt die Plakette weg. „Vielleicht sehen wir uns da.“
}
Du ziehst den Brief von {freund()} aus der Tasche. Meine Mutter reist in vier Tagen nach Vardholm. Drei davon sind vorbei.

Das Herz des Berges hat einen Riss. Die Waage sammelt Kraft gegen etwas, das sie selbst geweckt hat. Und {freund()} wird dabei sein, wenn sie zeigt, was sie in Vardholm baut.

Es ist Zeit, zur Festung am Pass zu gehen.
->->


=== p5_tagebuch
# bild: tagebuch/perle-5
# tagebuch: Unter dem Berg
Abends, am Ufer des Orin, schlägst du dein Buch auf.

Du zeichnest Glimmhalde mit den Häusern wie Schwalbennester. Die Tiefe Stiege, Stufe um Stufe. Und eine riesige Kugel mit vier Lichtern darin und einem Riss quer hindurch.
# karte: kobold-minen
# karte: tiefe-stiege

Darunter schreibst du: # handschrift

„Ich habe das Herz des Berges gesehen.
Darin wohnen alle vier Elemente. Einen Herzschlag lang habe ich alle vier gehört.
Es hat einen Riss. Durch den Riss kommt das Schweigen.
Der Riss kommt von einem Stollen. Die Kobolde haben ihn gegraben. Für die Waage. Für Stimmerz. Für die Kugeln.
{ vermisste_gerettet:
    Wir haben die sieben Kobolde zurückgeholt.
}
{ bp_gefunden:
    Ich habe {bp()} gefunden. {Bp_er()} geht nach Hause.
}
{ neumond_funke:
    An Neumond hat die Waage mir einen Funken genommen. Er ist nach Osten geflogen.
}
{ stollen_versiegelt:
    Wir haben den Stollen zum Einsturz gebracht. Dort gräbt keiner mehr.
}
{ herzsplitter:
    Ich habe einen Splitter vom Herz. Er summt. Das ist der Beweis.
}
{ talin_hilft:
    Talin hat aufgehört, für die Waage zu graben. Sie schicken alle Eingeschriebenen nach Vardholm.
}
{ tiefe_stiege_weg:
    Die Tiefe Stiege führt ganz durch den Berg. Ich habe das Licht am anderen Ende gesehen.
}
{freund()}s Mutter reist nach Vardholm. Ich auch.“ # tagebuch_ende

{
- kraftfunken == 0: Du spürst keinen Funken mehr in dir. Nach einer Rast kommen sie wieder.
- kraftfunken == 1: Du spürst einen kleinen Funken in dir.
- else: Du spürst {zahl(kraftfunken)} kleine Funken in dir.
}
->->
