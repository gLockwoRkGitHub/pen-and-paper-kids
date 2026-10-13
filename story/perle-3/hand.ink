// =====================================================================
// Perle 3 – Die geheime Prüfung der Leisen Hand: Das Kleingedruckte
// Im Zelt der Waage den Mustervertrag des Registers holen.
// Dort liegt ein Goldknopf … und hinter einem Vorhang sitzt jemand.
// =====================================================================

=== p3_hand
~ pruefungen += 1
# karte: brunnen
Am Brunnen fragst du nach Fink. Ein Wasserträger zeigt wortlos auf eine Hofeinfahrt. Dort, im Schatten, wartet er.

{ ruf_leise_hand > 0:
    „Wusste ich doch, dass du kommst“, sagt Fink.
- else:
    „Mutig“, sagt Fink. „Oder dumm. Nach dem, was du getan hast.“ Er zuckt mit den Schultern. „Egal. Die Hand rechnet. Wenn du das hier schaffst, sind wir quitt.“
}

Er zieht dich tiefer in die Einfahrt. „Die Prüfung der Hand ist einfach. Das Zelt der Waage neben der Ratshalle. Da drin liegt ein Stapel Verträge. Jeder Rufer, der sich einschreibt, muss so einen unterschreiben.“ Er senkt die Stimme. „Die Hand will wissen, was draufsteht. Alles. Auch das, was sehr klein geschrieben ist. Hol uns einen.“

„Das ist Diebstahl.“

„Das ist ein Blatt Papier“, sagt Fink. „Die Waage druckt hundert davon am Tag. Und die Leute, die es unterschreiben, sollen wissen, was sie unterschreiben. Oder?“
* [„Gut. Ich hole ihn.“]
    -> hinein
* [„Erst will ich wissen, was die Hand damit vorhat.“]
    Fink sieht dich überrascht an. Dann grinst er. „Abschreiben. Hundertmal. Und heute Nacht an jede Ecke kleben. Wenn die Waage ehrlich ist, schadet es ihr nicht.“ Er hält dir die Hand hin. „Wenn nicht, dann schon.“
    -> hinein

= hinein
# bild: szene/zelt-der-waage
Das Zelt der Waage ist groß und schwarz, mit goldenen Fransen an jeder Kante. Vor dem Eingang stehen zwei Söldner. Drinnen hörst du Schreiber, die Papier stapeln.
* [Dich als Botenkind mit einer Lieferung ausgeben (Ausstrahlung)]
    { hintergrund == "botenlaeufer":
        Du weißt genau, wie ein Bote geht: schnell, gelangweilt, mit einem Gesicht, das sagt: Ich habe noch zwölf andere Wege heute.
        ~ temp e = probe(ausstrahlung + 1)
        ~ probe_zeile("Ausstrahlung +1", e)
        -> drinnen(e)
    - else:
        ~ temp e2 = probe(ausstrahlung)
        ~ probe_zeile("Ausstrahlung", e2)
        -> drinnen(e2)
    }
* [Hinten unter der Zeltwand hindurchkriechen (Geschick)]
    { hintergrund == "strassenkind":
        Unter Zeltwänden durchkriechen hast du schon gemacht, als du noch nicht richtig laufen konntest.
        ~ temp e3 = probe(geschick + 1)
        ~ probe_zeile("Geschick +1", e3)
        -> drinnen(e3)
    - else:
        ~ temp e4 = probe(geschick)
        ~ probe_zeile("Geschick", e4)
        -> drinnen(e4)
    }
* {kann_zaubern(0) && element == "wind"} [Den Wind bitten, die Zeltplane am Eingang hochzuwehen, während du hindurchschlüpfst (Zauber)]
    -> zauber_hinein
* {kann_zaubern(1) && element == "erde"} [Einen Zeltpflock bitten, sich zu lockern, damit die Wache hinläuft (Zauber)]
    -> zauber_hinein
* {kann_zaubern(-1) && element == "wasser"} [Mit Wasser aus deinem Schlauch die Teekanne der Wachen umkippen lassen (Zauber, Quelle)]
    -> zauber_hinein
* {kann_zaubern(-1) && element == "feuer"} [Mit Glut aus deiner Laterne die Laterne am Eingang ausgehen lassen (Zauber, Quelle)]
    -> zauber_hinein

= zauber_hinein
~ temp u = 0
{
- element == "erde":
    ~ u = 1
- element == "wasser" || element == "feuer":
    ~ u = -1
}
{ u >= 0:
    ~ u = u + tipp_bonus()
}
~ temp z = zauber(u)
~ probe_zeile("Zauber", z)
{ z == ERFOLG || z == JA_ABER:
    { element:
    - "wind":
        Eine Böe fährt über den Platz und reißt die Plane am Eingang hoch. Beide Wachen springen hinterher. Als sie die Plane wieder festgezurrt haben, bist du längst drinnen.
    - "erde":
        Mit einem Ruck springt ein Zeltpflock aus dem Pflaster. Die ganze Ecke des Zeltes sackt ein. „Pflock!“, brüllt eine Wache, und beide rennen hin.
    - "wasser":
        Die Teekanne der Wachen kippt um, als hätte sie jemand angestoßen. Heißer Tee läuft einem Söldner in den Stiefel. Er hüpft und flucht, und der andere lacht.
    - else:
        Die Laterne am Eingang flackert und erlischt. Im Halbdunkel suchen die Wachen nach Zunder.
    }
    { z == JA_ABER:
        ~ magie_gildentag = true
        Ein Wasserträger am Brunnen hat genau gesehen, wie du die Hand bewegt hast. Er starrt dich an. Hoffentlich hält er den Mund.
    }
    -> drinnen(ERFOLG)
- else:
    { z == KEINE_KRAFT:
        Du greifst nach deiner Kraft, aber da ist nichts mehr. Du musst es anders versuchen.
    - else:
        Nichts geschieht. Oder fast nichts: Einer der Söldner niest.
    }
    ~ temp e = probe(geschick)
    ~ probe_zeile("Geschick", e)
    -> drinnen(e)
}

= drinnen(e)
{ e == MISSERFOLG:
    Fast. Du bist schon halb drin, da dreht sich ein Schreiber um. Du erstarrst und drückst dich hinter einen Stapel Kisten. Er hat dich nicht gesehen. Noch nicht. Aber jetzt sitzt du in der Falle.
- else:
    Du bist drin. Niemand hat dich bemerkt.
}

Das Zelt ist innen größer, als es außen aussieht. Ein Schreibtisch mit Stapeln von Papier. Kisten mit Kreide, Tinte und Siegellack. Eine Waage aus Gold auf einem Tisch, die sich kein bisschen bewegt. Hinten trennt ein schwerer schwarzer Vorhang einen zweiten Raum ab.

Neben einem gepolsterten Stuhl am Schreibtisch liegt etwas auf dem Boden und glänzt. Ein kleiner, runder Knopf aus Gold.

Du kennst diesen Knopf. Genau solche Knöpfe hat {freund()} an der dunkelgrünen Samtjacke.
~ goldknopf_gefunden = true
* [Den Knopf aufheben und einstecken]
    Du steckst ihn ein. Er ist kühl und schwer. Vielleicht gibt es hundert solche Knöpfe in der Oberstadt. Vielleicht.
* [Den Knopf liegen lassen]
    Du lässt ihn liegen. Aber du vergisst nicht, wo er lag.
- -> vertrag(e)

= vertrag(e)
Auf dem Schreibtisch liegt der Stapel mit den Verträgen. Oben drauf sitzt ein Schreiber mit dem Rücken zu dir und spitzt eine Feder.
{ e == MISSERFOLG:
    -> erwischt
}
* [Ein Blatt vorsichtig unter seinem Ellbogen hervorziehen (Geschick)]
    ~ temp e2 = probe(geschick)
    ~ probe_zeile("Geschick", e2)
    { e2:
    - ERFOLG:
        Du ziehst ein Blatt aus der Mitte des Stapels. Der Schreiber spitzt weiter. Du bist draußen, bevor er die Feder fertig hat.
        -> geschafft
    - JA_ABER:
        -> knapp
    - else:
        -> erwischt
    }
* [Warten, bis der Schreiber Tee holen geht (Verstand)]
    ~ temp e3 = probe(verstand)
    ~ probe_zeile("Verstand", e3)
    { e3:
    - ERFOLG:
        Du zählst. Schreiber trinken viel Tee. Nach dem dritten Gähnen steht er auf und geht hinaus. Du nimmst ein Blatt und bist weg.
        -> geschafft
    - JA_ABER:
        -> knapp
    - else:
        -> erwischt
    }

= knapp
Du hast das Blatt. Doch als du dich umdrehst, raschelt hinter dem schwarzen Vorhang Stoff.

„Wer ist da?“, fragt eine Stimme.

Du rennst. Aber die Stimme bleibt dir im Ohr. Du kennst sie. Du kennst sie sehr gut. Heute Morgen hat sie dir noch Glück gewünscht.

Oder hast du dich verhört?
-> geschafft

= erwischt
„He! Was machst du da?“

Der Schreiber springt auf. Am Eingang drehen sich die Söldner um. Einer greift nach deinem Kragen.

Da wird der schwarze Vorhang zurückgeschoben.

„Lasst {anrede() == "junge Dame":sie|ihn}.“

{freund()} steht im Durchgang, in {fr_sein()}er grünen Samtjacke. Am Ärmel fehlt ein Knopf. {Fr_sein()} Gesicht ist blass, aber {fr_sein()}e Stimme ist ganz ruhig.

„{anrede() == "junge Dame":Sie|Er} gehört zu mir. Ich habe {anrede() == "junge Dame":sie|ihn} hergebeten. Gibt es ein Problem?“

Der Söldner lässt deinen Kragen los, als hätte er sich verbrannt. Der Schreiber verbeugt sich. Tief. Sehr tief. „Natürlich nicht. Verzeihung. Wir wussten nicht …“
~ freund_hat_gedeckt = true
~ aendern(beziehung_freund, 1)

{freund()} nimmt dich am Arm und zieht dich hinaus, an den Söldnern vorbei, um das Zelt herum, bis ihr allein seid.

„Was hast du da drin gemacht?“, zischt {fr_er()}. „Weißt du, was passiert wäre, wenn …“ {Fr_er()} bricht ab.

„Und was machst du da drin?“, fragst du zurück.

{freund()} öffnet den Mund. Schließt ihn wieder. „Ich muss zurück“, sagt {fr_er()} schließlich. „Heute Abend. Ich erkläre es dir heute Abend. Versprochen.“

Dann ist {fr_er()} verschwunden. Den Vertrag hast du nicht. Aber du hast etwas anderes gesehen. Wie ein Söldner der Goldenen Waage vor {freund()} den Blick gesenkt hat.
-> zurueck_ohne

= geschafft
-> bei_fink(true)

= zurueck_ohne
-> bei_fink(false)

= bei_fink(mit_vertrag)
Fink wartet in der Hofeinfahrt.
{ mit_vertrag:
    ~ register_geheimnis = true
    ~ angebot_hand = true
    { ruf_leise_hand < 1:
        ~ ruf_leise_hand = 1
    - else:
        ~ aendern(ruf_leise_hand, 1)
    }
    Ihr lest den Vertrag zusammen. Oben steht in großen, schönen Buchstaben: SCHUTZ UND OBHUT FÜR ALLE ELEMENTRUFER. Darunter viele Zeilen über Ordnung und Sicherheit.

    Und ganz unten, so klein, dass ihr die Köpfe zusammenstecken müsst: „Der Eingeschriebene überlässt dem Bund der Goldenen Waage zum Wohle der Stadt an jedem Neumond einen Funken seiner Kraft. Die Kraft wird in Gefäßen der Waage verwahrt.“

    Gefäße. Glaskugeln.

    Fink pfeift leise durch die Zähne. „Die wollen sie anzapfen“, sagt er. „Wie ein Fass.“ Er rollt den Vertrag zusammen. „Gute Arbeit. Die Hand vergisst nicht.“ Diesmal klingt es nicht wie eine Drohung. „Ein Angebot. Bis Mitternacht. Du weißt, wo du mich findest.“
- else:
    { freund_hat_gedeckt:
        „Ich hab's gesehen“, sagt Fink. „Von hier aus.“ Er mustert dich mit schmalen Augen. „Erwischt werden und trotzdem rausspazieren, weil dich jemand aus der Oberstadt kennt. Das schafft nicht jeder.“
        Er kratzt sich am Kopf. „Kein Vertrag, kein Angebot. So sind die Regeln. Aber du hast nichts verraten. Die Hand merkt sich das.“
        ~ aendern(ruf_leise_hand, 1)
    }
}
->->
