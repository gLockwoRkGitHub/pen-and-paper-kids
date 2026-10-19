// =====================================================================
// Perle 1 – Die Nacht (Start-Fragen) und Der Morgen (Auslöser)
// Fünf kleine Szenen. Sie verteilen Punkte auf die vier Auslöser,
// legen unsichtbare Element-Neigungen an und schreiben die ersten
// Einträge ins Weltgedächtnis.
// =====================================================================

=== p1_nacht
-> abend

= abend
# bild: szene/sonnenuntergang-hafen
Die Sonne versinkt hinter dem Meer und färbt die Segel im Hafen orange. Die Glocken der Ratshalle schlagen zur siebten Stunde.

Wo verbringst du diesen Abend?
* [Unten am Kai, wo die Wellen gegen die Mauer schlagen]
    ~ neigung_wasser += 1
    Du sitzt auf der Kaimauer und lässt die Beine baumeln. Unter dir schmatzt das Wasser gegen die Steine, dunkel und kühl. Manchmal kommt es dir vor, als würde das Meer atmen. Ein, aus. Ein, aus. Du atmest mit.
* [Am Feuer im Hinterhof des Rostigen Ankers]
    ~ neigung_feuer += 1
    Im Hinterhof des Gasthauses brennt ein Feuer in einer alten Tonne. Du hältst die Hände über die Flammen und siehst den Funken nach, wie sie in den Himmel steigen und verlöschen. Die Wärme kriecht dir bis in die Fingerspitzen. Du könntest stundenlang zusehen.
* [Oben auf den Dächern, wo der Wind an deinen Haaren zerrt]
    ~ neigung_wind += 1
    Über eine Regenrinne kletterst du aufs Dach der alten Seilerei. Hier oben pfeift der Wind vom Meer herein und zerrt an deiner Kleidung. Die ganze Stadt liegt unter dir: Lichter, Rauch, Masten. Du breitest die Arme aus. Einen Moment lang fühlt es sich an, als könntest du dich einfach hineinlehnen.
* [In den alten Gewölben unter dem Markt, wo es nach Stein riecht]
    ~ neigung_erde += 1
    Unter dem Markt liegen Gewölbe, die älter sind als die Stadt. Es riecht nach kaltem Stein und feuchter Erde. Du legst die Hand an die Wand. Der Stein ist ruhig. Geduldig. Als hätte er schon tausend Jahre gewartet und könnte noch tausend weitere warten.
- -> sorge

= sorge
# bild: szene/bezugsperson-packt-{hintergrund}
Als du {zuhause()} zurückkehrst, ist {bp()} dort und stopft hastig Sachen in eine Tasche: einen Mantel, einen Kanten Brot, ein zusammengerolltes Seil.

{Bp_er()} zuckt zusammen, als {bp_er()} dich sieht.

„Ach, du bist es.“ {bp()} versucht ein Lächeln. Es misslingt. „Hör zu. Ich muss weg. Nur kurz. Und wenn ich bis übermorgen nicht zurück bin …“

{bp()} schweigt einen Moment zu lang.

„… dann wartest du nicht auf mich. Versprochen?“
* [„Wohin gehst du? Sag es mir!“]
    ~ pkt_verschwunden += 2
    ~ bp_nachgefragt = true
    {bp()} hält inne. Dann sagt {bp_er()} leise: „Zum Nyrrspalt. Da ist etwas, das ich mit eigenen Augen sehen muss.“
    „Was denn?“
    Aber {bp_er()} schüttelt nur den Kopf. „Je weniger du weißt, desto besser.“
* [„Ich komme mit.“]
    ~ pkt_verschwunden += 1
    „Nein.“ Das Wort kommt so schnell und so hart, dass du einen Schritt zurückweichst. Dann wird der Blick von {bp()} weicher. „Nicht dieses Mal. Bitte.“
* [Nicken. Du weißt, dass {bp_er()} sowieso nichts verraten wird.]
    Du nickst. {bp()} sieht erleichtert aus. Und ein bisschen traurig.
- {bp()} drückt kurz deine Schulter, schultert die Tasche und geht. Die Tür fällt ins Schloss.

Draußen beginnt es zu regnen.
-> fremder

= fremder
# bild: szene/fremder-im-regen
Du hältst es drinnen nicht aus. Du läufst durch den Regen, ohne zu wissen wohin, bis du unter dem Torbogen des Alten Zollhauses Schutz suchst.

Du bist nicht allein.

Im Schatten steht jemand in einem langen grauen Mantel, die Kapuze tief ins Gesicht gezogen. Du hast ihn nicht kommen hören. Unter der Kapuze schimmern zwei Augen, hell wie Mondlicht auf Wasser.
~ fremder_getroffen = true

„Du siehst aus wie jemand, der Wege kennt“, sagt der Fremde. Seine Stimme klingt wie trockenes Laub.

Er hält dir einen Brief hin. Das Siegel ist aus dunkelgrünem Wachs, und darin ist ein Zeichen eingedrückt: vier Ringe, ineinander verschlungen.

„Dieser Brief muss auf die andere Seite der Berge. Gib ihn dem Ersten, der dir dasselbe Zeichen zeigt. Und öffne ihn nicht.“
* [Den Brief annehmen]
    ~ pkt_brief += 2
    ~ brief_erhalten = true
    Das Papier ist schwerer, als es aussieht.
    -> siegel
* {hintergrund == "botenlaeufer"} [(Botenläufer) „Ein Botengang über die Berge? Der kostet.“]
    ~ pkt_brief += 2
    ~ brief_erhalten = true
    ~ silber += 1
    Der Fremde lacht leise. Er legt eine Silbermünze auf den Brief. „Für den ersten Schritt. Den Rest zahlt dir jemand anderes.“
    -> siegel
* [„Was steht darin? Und wer bist du?“ (Verstand)]
    ~ fremder_ausgefragt = true
    ~ temp e = probe(verstand)
    ~ probe_zeile("Verstand", e)
    { e:
    - ERFOLG:
        Du siehst genauer hin. Der Mantel des Fremden ist nass vom Regen, aber seine Stiefel sind voller grauem Staub. Bergstaub. Den gibt es nur oben im Kharvan-Kamm.
        Er ist nicht von hier. Er ist von draußen gekommen. Obwohl jeder Wagen am Nyrrspalt kontrolliert wird.
        Der Fremde bemerkt deinen Blick und lächelt. „Gute Augen“, sagt er. „Die wirst du brauchen.“
    - JA_ABER:
        „Wer ich bin, ist nicht wichtig“, sagt der Fremde. „Wichtig ist, wohin der Brief geht.“
        Mehr bekommst du nicht aus ihm heraus. Aber dir fällt auf, dass seine Stiefel voller grauem Staub sind.
    - else:
        Der Fremde lacht leise. „Fragen, Fragen. Die Antworten findest du nicht hier.“
    }
    ~ pkt_brief += 1
    ~ brief_erhalten = true
    Bevor du noch etwas sagen kannst, drückt er dir den Brief in die Hand.
    -> siegel
* [Ablehnen und weitergehen]
    „Ich bin kein Bote für Fremde“, sagst du.
    Der Fremde nickt, als hätte er genau diese Antwort erwartet. „Wir sehen uns wieder“, sagt er.
    -> fremder_weg

= siegel
Als deine Finger das Siegel berühren, spürst du etwas Seltsames.
{ staerkste_neigung():
- "wasser":
    Das Wachs fühlt sich kühl und glatt an, wie ein Kiesel aus einem Bach.
- "feuer":
    Das Wachs ist warm, als hätte es eben noch über einer Flamme gelegen.
- "wind":
    Ein kühler Hauch streicht über deine Hand, obwohl es unter dem Torbogen windstill ist.
- else:
    Das Wachs ist schwer und ruhig, wie ein Stein, der lange in der Sonne gelegen hat.
}
Dann ist das Gefühl vorbei.
-> fremder_weg

= fremder_weg
Hinter dir rumpelt ein Karren über das Pflaster. Du drehst dich um. Als du wieder hinsiehst, ist der Torbogen leer.
-> eintreiber

= eintreiber
# bild: szene/eintreiber-fesk
Als du durchnässt zurückkommst, wartet jemand {hintergrund == "schiffsjunge":unten an der Laufplanke|vor der Tür}.

Ein dürrer Mann in einem silbergrauen Mantel, mit einem dicken Buch unter dem Arm und einer Nase, die aussieht, als könnte sie Münzen riechen. Auf seinem Kragen glänzt eine kleine Silbermünze: das Zeichen des Silbermark-Kontors.

„Fesk“, sagt er. „Eintreiber. Ich suche {bp()}.“

„Nicht da.“

„Wie bedauerlich.“ Fesk schlägt sein Buch auf. „Vierzig Silberlinge. Geliehen vor einem Jahr, fällig seit gestern. Ist das Geld bis zum nächsten Neumond nicht da, nimmt das Kontor {pfand()}.“

Er klappt das Buch zu und mustert dich. „Und weil {bp()} nicht da ist, rede ich eben mit dir.“
* [„Ich werde bezahlen. Irgendwie.“]
    ~ pkt_schulden += 2
    ~ schulden_versprochen = true
    Fesk lächelt dünn und schreibt etwas in sein Buch. „Ein Versprechen. Wie rührend. Das Kontor wird sich daran erinnern.“
    Dann beugt er sich vor. „Übrigens: Wer nicht zahlen kann, kann auch liefern. Das Kontor sucht Leute, die Waren von jenseits der Berge holen. Denk darüber nach.“
    -> kisten
* [Ihn mit einer guten Geschichte hinhalten (Ausstrahlung)]
    -> fesk_hinhalten(0)
* {hintergrund == "schausteller"} [(Schausteller) Eine kleine Vorstellung geben, bis er die Fassung verliert (Ausstrahlung +1)]
    -> fesk_hinhalten(1)
* [{hintergrund == "schiffsjunge":Über die Bordwand verschwinden|{hintergrund == "schausteller":Hinten aus dem Wagen springen und verschwinden|Durch die Hintertür verschwinden}}]
    ~ pkt_flucht += 1
    ~ vor_fesk_geflohen = true
    ~ aendern(ruf_silbermark, -1)
    Du drehst dich um und rennst. Hinter dir hörst du Fesk rufen: „Davonlaufen ist auch eine Antwort! Eine teure!“
    -> kisten

= fesk_hinhalten(bonus)
~ temp e = probe(ausstrahlung + bonus)
~ probe_zeile("Ausstrahlung", e)
{ e:
- ERFOLG:
    ~ fesk_getaeuscht = true
    { bonus > 0:
        Du ziehst drei schrumpelige Äpfel aus der Tasche und jonglierst. Dazu erzählst du von einem Grafen, einem Dackel und einem sehr unglücklichen Missverständnis mit einer Torte. Fesks Mundwinkel zucken. Dann prustet er los.
    - else:
        Du erzählst Fesk, {bp()} sei unterwegs, um ein großes Geschäft abzuschließen. Ein sehr großes. Eines, an dem das Kontor ganz sicher gut verdienen wird.
    }
    „Nun gut“, sagt Fesk schließlich. „Bis zum Neumond. Keinen Tag länger.“
    Er geht. Du atmest aus.
- JA_ABER:
    ~ pkt_schulden += 1
    Fesk hört dir zu, ohne eine Miene zu verziehen. Dann schreibt er deinen Namen in sein Buch, gleich unter den von {bp()}.
    „Hübsche Geschichte“, sagt er. „Jetzt kenne ich auch dich.“
- else:
    ~ pkt_schulden += 2
    ~ aendern(ruf_silbermark, -1)
    Mitten in deiner Geschichte klappt Fesk das Buch zu. „Genug. Lügen kosten beim Kontor extra.“
    Er schreibt deinen Namen auf. Zweimal. Und unterstreicht ihn.
}
-> kisten

= kisten
# bild: szene/nordkai-kisten
Später in der Nacht, als der Regen nachlässt, kommst du am Nordkai vorbei. Eigentlich ist hier nachts niemand.

Heute schon.

Vor einem Lagerhaus stehen Karren, Laternen schaukeln im Wind. Männer und Frauen in schwarzen Mänteln laden Kisten auf. Auf ihren Brustplatten glänzt eine goldene Waage. Söldner der Goldenen Waage.

Die Pferde vor den Karren stehen nach Osten. Richtung Berge. Richtung Nyrrspalt.

Dann rutscht einem der Söldner eine Kiste aus den Händen. Der Deckel springt auf, und etwas rollt über das nasse Pflaster.

Eine Glaskugel, so groß wie ein Apfel. In ihrem Inneren zuckt ein Licht hin und her wie ein gefangener Blitz.

„Pass doch auf!“, zischt jemand. Hände greifen nach der Kugel.
* [Näher heranschleichen und lauschen (Geschick)]
    ~ temp e = probe(geschick)
    ~ probe_zeile("Geschick", e)
    -> kisten_ergebnis(e)
* {hintergrund == "strassenkind"} [(Straßenkind) Über die Dächer zum Oberlicht des Lagerhauses]
    Du kennst dieses Lagerhaus. Über die Regentonne, den Fenstersims und die Dachrinne bist du in wenigen Atemzügen oben. Durch das Oberlicht siehst du alles. Und niemand sieht dich.
    -> kisten_ergebnis(ERFOLG)
* [Umdrehen. Das geht dich nichts an.]
    Du ziehst den Kopf ein und gehst weiter. Hinter dir hörst du, wie die Karren anrollen. Nach Osten.
    -> nacht_ende

= kisten_ergebnis(e)
~ kisten_gesehen = true
{ e:
- ERFOLG:
    ~ pkt_flucht += 1
    Gut versteckt hörst du zwei Söldner flüstern.
    „… Hunderte von den Dingern. Was will die Waage bloß damit?“
    „Nicht unsere Sache. Bis zum Neumond muss alles in Vardholm sein. Und dann wird der Spalt dichtgemacht.“
    Der Spalt dichtgemacht? Du hältst die Luft an, bis die Karren verschwunden sind.
- JA_ABER:
    ~ pkt_flucht += 2
    ~ gesehen_worden = true
    Du schleichst dich an und hörst gerade noch: „… muss alles in Vardholm sein. Und dann wird der Spalt …“
    Da knirscht Glas unter deinem Schuh. Eine Laterne schwenkt herum. „Wer ist da?“
    Du rennst. Hinter dir Schritte, Rufe, dann nichts mehr. Ob sie dein Gesicht gesehen haben? Du weißt es nicht.
- else:
    ~ pkt_flucht += 3
    ~ gesehen_worden = true
    Du schleichst los, rutschst auf dem nassen Pflaster aus und landest der Länge nach im Licht einer Laterne.
    Eine Söldnerin starrt dich an. Du starrst zurück. Einen Herzschlag lang bewegt sich niemand.
    Dann rennst du. Und diesmal weißt du ganz genau: Sie hat dein Gesicht gesehen.
}
-> nacht_ende

= nacht_ende
Erschöpft kriechst du unter deine Decke. Draußen tropft der Regen von den Dächern. Du denkst an {bp()} und an den Fremden mit den Mondlicht-Augen.{brief_erhalten: Der Brief liegt unter deinem Kissen.}{kisten_gesehen: Und immer wieder siehst du das zuckende Licht in der Glaskugel vor dir.}

Irgendwann schläfst du ein.
->->


// =====================================================================
// Der Morgen: Welcher Auslöser schickt die Figur auf die Reise?
// =====================================================================

=== p1_morgen
// Der Hintergrund gibt einen kleinen Schubs in eine Richtung.
{ hintergrund:
- "schausteller":
    ~ pkt_schulden += 1
- "schiffsjunge":
    ~ pkt_schulden += 1
- "botenlaeufer":
    { brief_erhalten:
        ~ pkt_brief += 1
    - else:
        ~ pkt_verschwunden += 1
    }
- else:
    ~ pkt_verschwunden += 1
}
// Den Brief gibt es nur, wenn man ihn angenommen hat.
{ not brief_erhalten:
    ~ pkt_brief = 0
}
// Höchste Punktzahl gewinnt. Gleichstand: verschwunden, Brief, Schulden, Flucht.
~ ausloeser = "verschwunden"
~ temp beste = pkt_verschwunden
{ pkt_brief > beste:
    ~ ausloeser = "brief"
    ~ beste = pkt_brief
}
{ pkt_schulden > beste:
    ~ ausloeser = "schulden"
    ~ beste = pkt_schulden
}
{ pkt_flucht > beste:
    ~ ausloeser = "flucht"
}

# bild: szene/morgen
Du wachst auf, weil draußen eine Möwe kreischt, als ginge es um ihr Leben.

{ ausloeser:
- "verschwunden":
    # ausloeser: verschwunden
    {bp()} ist nicht zurückgekommen.
    Nicht in der Nacht und nicht im Morgengrauen. Die Decke liegt unberührt da. Auf dem Tisch findest du einen Zettel, in Eile geschrieben:
    „Nyrrspalt. Folge mir nicht. Ich komme zurück, sobald ich kann.“
    Du liest den Zettel dreimal.{bp_nachgefragt: Etwas, das {bp_er()} mit eigenen Augen sehen muss, hat {bp_er()} gesagt.}
    Folge mir nicht. Als ob du das könntest.
- "brief":
    # ausloeser: brief
    Der Brief liegt neben dir, als hätte er die ganze Nacht über dich gewacht. Das Ringsiegel glänzt im Morgenlicht.
    Gib ihn dem Ersten, der dir dasselbe Zeichen zeigt. Auf der anderen Seite der Berge.
    Du hättest Nein sagen können. Du hast es nicht getan. Und je länger du den Brief ansiehst, desto sicherer bist du: Er ist wichtig. Wichtiger als alles, was du je in den Händen gehalten hast.
- "schulden":
    # ausloeser: schulden
    An der Tür klebt ein Zettel mit einem silbernen Stempel.
    „MAHNUNG. Vierzig Silberlinge bis Neumond. Andernfalls Pfändung: {pfand()}.“
    Darunter steht kleiner: „Alternativ: Lieferauftrag jenseits des Nyrrspalts. Auskunft im Kontor.“
    Vierzig Silberlinge. So viel Geld hast du noch nie auf einem Haufen gesehen. Aber eine Lieferung von jenseits der Berge … das ist eine Möglichkeit. Vielleicht die einzige.
- "flucht":
    # ausloeser: flucht
    { hintergrund:
    - "schiffsjunge":
        Stiefelschritte auf dem Kai. Viele. Du spähst über die Reling.
        Söldner der Goldenen Waage gehen von Schiff zu Schiff.
    - "schausteller":
        Stiefelschritte vor dem Wagen. Viele. Du schiebst den Vorhang einen Spalt zur Seite.
        Söldner der Goldenen Waage gehen von Wagen zu Wagen.
    - else:
        Stiefelschritte vor dem Haus. Viele. Du schiebst den Vorhang einen Spalt zur Seite.
        Söldner der Goldenen Waage gehen von Tür zu Tür.
    }
    { gesehen_worden:
        „Wir suchen jemanden, der letzte Nacht am Nordkai war“, hörst du einen sagen. „Jung. Schnell. Nass bis auf die Knochen.“
    - else:
        Sie stellen Fragen über letzte Nacht am Nordkai. Du hast nichts getan. Aber du hast etwas gesehen. Und das reicht vielleicht schon.
    }
    In Lysmara kannst du dich eine Weile verstecken. Aber nicht für immer. Die Waage hat überall Augen. Außer vielleicht auf der anderen Seite der Berge.
}

{ ausloeser != "verschwunden":
    {bp()} ist irgendwann in der Nacht zurückgekommen, früher als angekündigt, mit Schlamm an den Stiefeln. Als du fragst, wo {bp_er()} war, sagt {bp_er()} nur: „Nirgends. Vergiss es.“
}

Du sitzt auf der Bettkante und denkst nach. Wie du es auch drehst und wendest, alle Wege führen zum selben Ort.

Zum Nyrrspalt.

Und wer durch den Nyrrspalt will, muss Zoll zahlen. Zehn Silberlinge, so heißt es. Du hast {silber == 0:keinen einzigen|genau einen}.
->->
