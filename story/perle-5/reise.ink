// =====================================================================
// Perle 5 – Ein Brief von Liora/Cassian und die Reise den Orin hinauf
// =====================================================================

=== p5_brief
# bild: szene/brief-in-wollmark
Am Morgen, als du aus dem Gasthaus Zum Krummen Stab trittst, sitzt jemand auf dem Brunnenrand und isst einen Apfel.
{ ruf_leise_hand >= 0:
    Fink. Die Mütze tief im Gesicht, die Stiefel staubig von der Spaltstraße.
    „Post“, sagt er und hält dir einen gefalteten Brief hin. „Aus der Oberstadt. Die Hand liefert auch Briefe. Wenn das Trinkgeld stimmt.“ Er grinst. „Und das Trinkgeld hat sehr gestimmt.“
- else:
    Ein Botenjunge mit einer Tasche voller Briefe. „Für dich“, sagt er und hält dir einen gefalteten Brief hin. „Aus der Oberstadt. Ganz eilig. Jemand hat mir einen Goldling dafür gegeben.“ Er schaut, als hätte er noch nie einen Goldling gesehen. Vermutlich hat er das auch nicht.
}

Das Papier ist teuer und riecht nach Rosen. Die Schrift ist schief und hastig.

„Ich darf nicht mehr aus dem Haus. Magister Pell schläft jetzt auf einem Stuhl vor meiner Tür. Er schnarcht. Sie sagen, du bist gefährlich. Ich glaube das nicht.

Ich habe noch etwas gehört. Meine Mutter reist in vier Tagen nach Vardholm. Sie sagt, es geht um ‚das Werk‘. Ich soll mitkommen. Ich will nicht. Aber vielleicht ist es gut. Dann kann ich sehen, was sie da baut.

Pass auf dich auf. Und finde heraus, wovor sie wegrennen.

{freund()}

PS: Hast du den Knopf noch?“
~ mutter_nach_vardholm = true
* [Den Knopf aus der Tasche holen und ihn eine Weile ansehen]
    ~ aendern(beziehung_freund, 1)
    Du hältst den kleinen goldenen Knopf in der Sonne. Er ist warm geworden in deiner Tasche. Du steckst ihn wieder weg, ganz vorsichtig.
* [Fink oder dem Botenjungen eine Antwort mitgeben]
    ~ aendern(beziehung_freund, 1)
    Du reißt eine Seite aus deinem Tagebuch und schreibst: „Ich gehe unter den Berg. Da kommt es her. Ich hab den Knopf noch. Pass du auch auf dich auf.“ Du faltest den Zettel klein zusammen.
    { ruf_leise_hand >= 0:
        Fink steckt ihn ein. „Gratis“, sagt er. „Ausnahmsweise.“
    - else:
        Du gibst dem Botenjungen deinen letzten Kupferling dazu. Er rennt los.
    }
* [Den Brief einstecken und an die Arbeit denken]
    Du steckst den Brief ein. Später. Erst der Berg.
- ->->


=== p5_orin
# bild: entdeckung/orin-treidelpfad
# karte: orin-oberlauf
Von Wollmark aus gehst du nach Norden, quer über die Weiden, bis du den Orin erreichst. Hier draußen ist er ein schneller, kalter Fluss, grün wie Flaschenglas. Am Ufer zieht sich ein Treidelpfad flussaufwärts, zu den Bergen.

Auf dem Pfad ziehen Maultiere flache Kähne gegen die Strömung. Leere Erzkähne, auf dem Rückweg zu den Minen. Auf jedem Kahn sitzen Kobolde mit Grubenlampen auf den Helmen und lassen die Beine baumeln.
{ kompass:
    Du klappst Tickworts Kompass auf. Die Nadel zeigt genau den Fluss hinauf.
}
* [Einen Kobold fragen, ob du mitfahren darfst (Ausstrahlung)]
    ~ temp e = probe(ausstrahlung + MAX(0, ruf_kobolde))
    ~ probe_zeile("Ausstrahlung", e)
    { e == MISSERFOLG:
        Der Kobold sieht dich lange an. „Großer Mensch ist schwer“, sagt er. „Maultier ist müde.“ Dann zeigt er auf das letzte Boot. „Da. Aber du ziehst mit.“ Den halben Tag gehst du neben dem Maultier her und ziehst am Seil.
    - else:
        Der Kobold rückt zur Seite. „Steig ein. Kostet nichts. Kostet eine Geschichte.“
        Du erzählst die Geschichte von Grumak, von den leeren Dörfern und vom Grauen auf den Weiden. Am Ende ist es auf dem Kahn sehr still.
    }
* {erzmarke} [Grisks Erzmarke zeigen]
    ~ aendern(ruf_kobolde, 1)
    Der Kobold auf dem ersten Kahn sieht die Marke und reißt die gelben Augen auf. „Freund von Grisk!“, ruft er nach hinten. Die anderen Kobolde stehen auf. Einer macht dir Platz auf dem besten Sack. Einer gibt dir getrockneten Pilz zu essen. Er schmeckt nach Keller. Du isst ihn trotzdem.
* [Allein auf dem Treidelpfad gehen]
    Du gehst allein, den ganzen Tag, neben dem rauschenden Fluss. Abends sind deine Füße wund und dein Kopf ganz klar.
- Unterwegs erzählen die Kobolde. In der Tiefe ist es nicht mehr sicher. Sieben Kobolde sind vor vier Tagen in den dritten Schacht gestiegen. Keiner ist zurückgekommen. Und in zwei Nächten ist Neumond.

„Neumond“, sagt ein alter Kobold und spuckt in den Fluss. „Dann holt die Waage ihre Funken. Hat sie überall angeschlagen. Auch bei uns.“
-> stromschnelle

= stromschnelle
Am Nachmittag, kurz vor den Bergen, wird der Fluss eng und schnell. Weißes Wasser schäumt über Felsen. Das vorderste Maultier rutscht auf dem nassen Pfad aus, das Seil reißt ihm aus dem Geschirr, und der Kahn dreht sich quer in die Strömung. Zwei Kobolde klammern sich an den Rand.
* [Das Seil packen und den Kahn festhalten (Kraft)]
    ~ temp e = probe(kraft)
    ~ probe_zeile("Kraft", e)
    { e == MISSERFOLG:
        Das Seil reißt dir durch die Hände. Der Kahn schlägt gegen einen Felsen, ein Brett splittert. Die Kobolde springen ans Ufer, nass, aber heil. Den Kahn holen sie später mit Haken heraus.
    - else:
        ~ aendern(ruf_kobolde, 1)
        Du stemmst die Füße in den Schlamm und hältst. Das Seil brennt in den Händen, aber der Kahn dreht sich zurück, langsam, bis die Kobolde ihn ans Ufer ziehen können.
    }
* {kann_zaubern(1) && element == "wasser"} [Die Strömung bitten, den Kahn ans Ufer zu schieben (Zauber)]
    ~ temp z = zauber(1)
    ~ probe_zeile("Zauber", z)
    { z == MISSERFOLG || z == KEINE_KRAFT:
        Das Wasser hört dich, aber es ist wild und will nicht. Der Kahn schlägt gegen einen Felsen. Die Kobolde springen heil ans Ufer.
    - else:
        ~ aendern(ruf_kobolde, 1)
        Du legst die Hand in die Strömung. Und das wilde Wasser wird für einen Moment zahm wie ein Hund an der Leine. Es schiebt den Kahn sanft ans Ufer und legt ihn dort ab.
        Die Kobolde starren dich an. Dann klopfen sie dir alle gleichzeitig auf den Rücken.
    }
* {kann_zaubern(1) && element == "erde"} [Einen Felsen bitten, sich aus dem Flussbett zu heben und den Kahn aufzuhalten (Zauber)]
    ~ temp z2 = zauber(1)
    ~ probe_zeile("Zauber", z2)
    { z2 == MISSERFOLG || z2 == KEINE_KRAFT:
        Ein Felsen hebt sich. Leider an der falschen Stelle. Der Kahn kracht dagegen. Die Kobolde springen heil ans Ufer.
    - else:
        ~ aendern(ruf_kobolde, 1)
        Aus dem Flussbett schiebt sich ein flacher Felsen und stemmt sich vor den Kahn wie eine Hand. Der Kahn kommt zum Stehen. Die Kobolde starren dich an. Dann klopfen sie dir alle gleichzeitig auf den Rücken.
    }
* {kann_zaubern(1) && element == "wind"} [Eine Böe gegen den Kahn schicken, die ihn ans Ufer drückt (Zauber)]
    ~ temp z3 = zauber(1)
    ~ probe_zeile("Zauber", z3)
    { z3 == MISSERFOLG || z3 == KEINE_KRAFT:
        Die Böe fegt einem Kobold den Helm vom Kopf. Der Kahn schlägt gegen einen Felsen. Alle springen heil ans Ufer.
    - else:
        ~ aendern(ruf_kobolde, 1)
        Eine kräftige Böe fährt über das Wasser, drückt gegen die Bordwand und schiebt den Kahn zurück zum Ufer. Die Kobolde starren dich an. Dann klopfen sie dir alle gleichzeitig auf den Rücken.
    }
- Bei Sonnenuntergang erreicht ihr den Fuß der Berge.
->->
