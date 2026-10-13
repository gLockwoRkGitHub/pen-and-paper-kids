// =====================================================================
// Perle 3 – Der Morgen des Gildentags, die Wahl der Prüfungen
// und mittags das Magiergesetz
// =====================================================================

=== p3_morgen
~ rasten()
# bild: entdeckung/gildentag
# karte: marktplatz
Am Morgen des Gildentags ist Lysmara nicht wiederzuerkennen.

Über jeder Straße hängen Banner: das Webschiffchen mit dem Hammer, die silberne Feder, eine rote Phiole mit goldenem Rauch, eine Münze mit einer Kerbe, die goldene Waage. Trommler ziehen durch die Gassen. Es riecht nach gebrannten Mandeln, nach Tinte, nach Rauch und nach Aufregung.

Auf dem Marktplatz, direkt vor der Ratshalle, haben Zimmerleute über Nacht eine Tribüne gebaut. Sie ist mit schwarzem und goldenem Tuch bespannt. Die Stühle darauf sind noch leer.
{ gildentag_regeln:
    Du weißt, wie es läuft. Tickwort hat es dir erklärt, in vier Punkten und einem geheimen fünften. Zwei Prüfungen. Bis Mitternacht.
- else:
    Ein Ausrufer erklärt die Regeln, so laut, dass die Tauben auffliegen: Jede Gilde stellt eine Prüfung. Jeder darf an zwei teilnehmen. Wer besteht, bekommt ein Angebot. Bis Mitternacht.
}
-> freund_kommt

= freund_kommt
„Da bist du!“

{freund()} drängt sich durch die Menge. Heute ist nichts mit Verkleidung. {Fr_er()} trägt die dunkelgrüne Samtjacke mit den kleinen Goldknöpfen, ein frisch gestärktes Hemd und Schuhe, die so blank geputzt sind, dass sich der Himmel darin spiegelt. {Fr_sein()}e Locken sind gekämmt. Fast.

„Ich kann nicht lange“, sagt {fr_er()} atemlos. „Heute ist … Familientag. Ich muss den ganzen Tag stillsitzen und lächeln.“ {Fr_er()} verdreht die Augen. „Aber ich habe dir etwas mitgebracht.“

{Fr_er()} drückt dir ein gefaltetes Blatt in die Hand. Darauf steht in sauberer Schrift, welche Gilde wo prüft:

Webstuhl und Amboss – in der Tuchhalle.
Gesellschaft der Weiten Feder – unter dem Markt.
Zirkel der Glühenden Phiole – im Haus der Phiole am Hafen.

„Woher weißt du das alles?“

„Meine Familie bekommt jedes Jahr eine Liste“, sagt {freund()} schnell. „Weil sie … viel mit den Gilden zu tun hat.“

Da taucht hinter {fr_ihm()} ein dünner Mann mit Brille auf. Magister Pell. Er ist rot im Gesicht und schnauft.

„{fr_ist_m():Junker|Fräulein} Arv…“ Er bricht ab, als hätte er sich auf die Zunge gebissen. Sein Blick springt zu dir. „… {freund()}. Wir werden erwartet. Sofort. Ihre Mutter …“

„Ich komme ja schon.“ {freund()} rollt mit den Augen und drückt deinen Arm. „Viel Glück. Du schaffst das. Wir sehen uns heute Abend!“
~ pell_versprecher = true

Dann zieht Pell {fr_ihn()} in die Menge, Richtung Ratshalle.
* [Dich wundern, wie Pell {freund()} eigentlich nennen wollte]
    „{fr_ist_m():Junker|Fräulein} Arv…“, murmelst du. Arv-was? {freund()} hat dir nie einen Familiennamen gesagt. Einfach {freund()}, hat {fr_er()} am ersten Tag gesagt. Einfach {freund()}.
    Du nimmst dir vor, {fr_ihn()} heute Abend zu fragen.
* [Dich auf die Liste konzentrieren]
    Du faltest die Liste auseinander und wieder zusammen. Später. Jetzt zählt der Gildentag.
- -> unterwegs

= unterwegs
{ ausloeser == "verschwunden" && not bp_spur:
    ~ bp_nachricht = true
    Am Stand von Webstuhl und Amboss stehen ein paar Kobolde in sauberen Westen. Ein ganz junger Kobold löst sich aus der Gruppe, als er dich sieht, und drückt dir einen zerknitterten Zettel in die Hand.
    „Von {bp_ist_m():dem Mann|der Frau} mit dem Seil“, flüstert er. „Hat {bp_er()} mir gegeben. Vor fünf Tagen. Ich sollte warten. Bis Gildentag.“ Dann ist er wieder zwischen den anderen verschwunden.
    Du erkennst die Schrift sofort. {bp()}.
    „Bin in der Tiefe Stiege. Es ist schlimmer, als ich dachte. Folge mir nicht.“
    Dir wird kalt, mitten in der Sonne. Die Tiefe Stiege. Unter dem Berg. Dort, wo der Berg brummt.
}
{ ausloeser == "verschwunden" && bp_spur:
    ~ bp_nachricht = true
    Am Stand von Webstuhl und Amboss stehen ein paar Kobolde in sauberen Westen und sehen sehr unglücklich darüber aus. Einer von ihnen ist {kobold_gerettet:Grisk|Mirk, die alte Koboldin mit der gesprungenen Brille}. Als {kobold_gerettet:er|sie} dich sieht, winkt {kobold_gerettet:er|sie} dich heran.
    „{bp_ist_m():Der Mann|Die Frau} mit dem Seil“, flüstert {kobold_gerettet:Grisk|Mirk}. „{bp_ist_m():Er|Sie} ist in die Tiefe Stiege gegangen. Vor fünf Tagen. Allein. Ein Kobold hat {bp_ihn()} gesehen, unten am dritten Schacht.“ Eine Pause. „Nicht zurückgekommen.“
    Dir wird kalt, mitten in der Sonne.
    „Wenn du in die Minen willst“, sagt {kobold_gerettet:Grisk|Mirk}, „dann brauchst du das Zeichen der Gilde. Oder viel Glück. Lieber das Zeichen.“
}
{ ausloeser == "schulden" || schulden_versprochen || fesk_getaeuscht:
    Zwischen den Ständen steht ein kleines, sehr ordentliches Zelt mit silbernen Wimpeln. Silbermark-Kontor. Davor sitzt Fesk an einem Klapptisch und blättert in seinem Buch.
    Er sieht dich und hebt grüßend den Federkiel. „Ah. Mein Lieblingsschuldner auf dem Gildentag. Wie passend.“ Sein dünnes Lächeln wird ein wenig breiter. „Kleiner Hinweis, kostenlos, was bei mir selten ist: Ein Gildenmitglied ist kreditwürdig. Ein Niemand nicht. Denk darüber nach, bevor der Neumond kommt.“
}
{ ruf_leise_hand > -2:
    -> fink
}
->->

= fink
Am Brunnen lehnt jemand mit tief ins Gesicht gezogener Mütze. Fink. Er tut so, als würde er dich nicht sehen. Dann geht er dicht an dir vorbei.

{ ruf_leise_hand > 0:
    „Die Hand prüft auch“, sagt er, ohne den Kopf zu drehen. „Nicht in einer Halle. Wenn du willst, frag am Brunnen nach mir.“
- else:
    „Die Hand hat nicht vergessen, was du getan hast“, sagt er, ohne den Kopf zu drehen. „Aber die Hand rechnet. Heute kannst du deine Schuld abarbeiten. Wenn du willst, frag am Brunnen nach mir.“
}

Dann ist er weg.
->->


// ---------------------------------------------------------------------
// Die Wahl der Prüfung (zweimal am Gildentag)
// ---------------------------------------------------------------------
=== p3_pruefung
{ pruefungen == 0:
    Die Glocken schlagen neun. Die Hallen öffnen. Wohin gehst du zuerst?
- else:
    Die Glocken schlagen zwei. Der Nachmittag gehört der zweiten Prüfung. Wohin gehst du?
}
+ {not p3_webstuhl} [Zur Tuchhalle: Webstuhl und Amboss]
    -> p3_webstuhl
+ {not p3_feder} [Unter den Markt: die Gesellschaft der Weiten Feder]
    -> p3_feder
+ {not p3_phiole} [Zum Hafen: der Zirkel der Glühenden Phiole]
    -> p3_phiole
+ {not p3_hand && ruf_leise_hand > -2} [Zum Brunnen: Fink und die Leise Hand]
    -> p3_hand


// ---------------------------------------------------------------------
// Mittags: Der Rat beschließt das Magiergesetz
// ---------------------------------------------------------------------
=== p3_gesetz
# bild: entdeckung/magiergesetz
# karte: marktplatz
Um zwölf läuten alle Glocken der Stadt. Genau wie vor vier Tagen, als der Nyrrspalt geschlossen wurde.

Der Marktplatz ist so voll, dass man kaum atmen kann. Auf der schwarz-goldenen Tribüne sitzen jetzt Leute. Ratsherren in Pelzkragen. Gildenmeister mit ihren Abzeichen. Kettrich mit seiner Dreifachbrille, der aussieht, als hätte er in eine Zitrone gebissen. Meister Orwin, der gar nicht hinsieht und etwas in ein Notizbuch zeichnet.

Und in der Mitte, auf dem höchsten Stuhl, eine große Frau in Schwarz. Um den Hals trägt sie eine schwere goldene Kette mit einer kleinen Waage daran. Neben ihr sitzt ein Mann mit grauen Schläfen, der unentwegt in einem Buch blättert.

Und hinter den beiden, sehr gerade, sehr still, in einer dunkelgrünen Samtjacke: {freund()}.
~ freund_auf_tribuene = true

Du blinzelst. Aber {fr_er()} ist es. Ganz sicher.
* [{freund()} zuwinken]
    Du hebst die Hand. {freund()} sieht dich. Einen Herzschlag lang leuchtet {fr_sein()} Gesicht auf. Dann schüttelt {fr_er()} ganz leicht den Kopf, kaum sichtbar, und schaut auf {fr_sein()}e blanken Schuhe.
* [Die Leute neben dir fragen, wer die Frau mit der goldenen Kette ist]
    „Das?“ Ein Fischhändler sieht dich an, als kämst du vom Mond. „Das ist die Waagmeisterin. Seraphine Arvelle. Ihrer Familie gehört die halbe Oberstadt und die andere Hälfte schuldet ihr Geld.“
    Arvelle. Du denkst an Magister Pell. {fr_ist_m():Junker|Fräulein} Arv…
    Nein. Das kann Zufall sein. Viele Namen fangen so an.
* [Nur zusehen]
    Du siehst zu. {freund()} steht hinter der Frau in Schwarz, als hätte {fr_er()} dort schon tausendmal gestanden. Und als hätte {fr_er()} es jedes Mal gehasst.
- Der Herold tritt vor. Derselbe wie vor vier Tagen, im selben roten Mantel. Er entrollt ein Pergament.

„Bürger von Lysmara! Der Rat hat beschlossen: Ab dem kommenden Neumond muss jeder, der ein Element ruft, Mitglied einer Gilde sein. Die Gilde bürgt für ihn und verzeichnet ihn.“

Ein Raunen.

„Wer keiner Gilde angehört, schreibt sich beim Bund der Goldenen Waage ein. Die Waage bietet allen Elementrufern Schutz und Obhut.“ Der Herold hebt die Stimme. „Wer sich weder bei einer Gilde noch bei der Waage einschreibt, gilt ab dem Neumond als ungeprüft und wird von der Stadtwache in Gewahrsam genommen.“

Diesmal wird es nicht still. Diesmal brüllt der Platz. Manche jubeln. Andere pfeifen. Irgendwo ruft jemand: „Endlich! Mein Nachbar hat letzten Winter mein Fass gefrieren lassen!“ Und jemand anderes: „Schämt euch!“

Die Waagmeisterin erhebt sich. Sofort wird es leiser.

„Niemand muss sich fürchten“, sagt sie. Ihre Stimme ist sanft und trägt trotzdem über den ganzen Platz. „Weder die Bürger vor den Elementrufern noch die Elementrufer vor den Bürgern. Wir wollen nur Ordnung. Ordnung ist Sicherheit.“ Sie lächelt. „Unser Zelt steht ab heute neben der Ratshalle. Die Tür ist offen.“
{ register_geheimnis:
    Du weißt, was hinter dieser offenen Tür wartet. Ein Buch mit Namen. Und für jeden Namen eine Kugel aus Glas, die gefüllt werden will. Jeden Mond ein Funke.
    Dir wird schlecht.
}
-> yrsa

= yrsa
Neben dir sagt eine raue Stimme leise: „Schutz und Obhut.“

Yrsa. Sie hat das Tuch tief in die Stirn gezogen. Ihre Hände sind zu Fäusten geballt, so fest, dass der Ruß in den Falten weiß aussieht.

„Fünfzig Jahre habe ich geschwiegen“, sagt sie, ohne dich anzusehen. „Fünfzig Jahre habe ich für die Gilde geschmiedet und nie gesagt, was ich bin. Und jetzt soll ich mich einschreiben wie ein Sack Mehl.“ Sie spuckt aus. „Ich schreibe mich nirgends ein.“

„Und was passiert dann?“

Yrsa sieht dich endlich an. Ihr Blick ist müde. „Dann muss ich mich entscheiden, ob ich in dieser Stadt alt werden will. Und du, Kind, musst dich heute entscheiden, zu wem du gehören willst. Mit Bedacht. Eine Gilde ist wie ein Mantel. Er wärmt. Aber du trägst auch seine Farbe.“
-> mittag

= mittag
Als sich der Platz leert, setzt du dich auf den Brunnenrand und isst etwas.{p3_besuch == "grumak": Grumaks Nüsse schmecken nach Zimt und machen dich ruhiger.} Die Sonne wärmt dir den Rücken.
~ rasten()
{ elementstufe > 0:
    Langsam spürst du, wie die Kraft in dir zurückkehrt. Wie Wasser, das in einen leeren Brunnen sickert.
}

Oben auf der Tribüne ist {freund()} verschwunden.
->->
