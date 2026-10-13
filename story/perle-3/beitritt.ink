// =====================================================================
// Perle 3 – Abend: Gespräch mit Liora/Cassian, Gildenbeitritt,
// Heimweg, Tagebuch
// =====================================================================

=== p3_beitritt
# bild: szene/brunnen-abend
# karte: marktplatz
Als die Sonne untergeht, zünden die Gilden Laternen an. Rote an der Phiole, blaue an der Tuchhalle, silberne vor dem Haus der Weiten Feder. Vor dem Zelt der Waage brennen goldene. Bis Mitternacht kann jeder, der ein Angebot hat, beitreten.
{ not (angebot_webstuhl || angebot_feder || angebot_phiole || angebot_hand):
    -> dritte_chance
}
-> freund_erklaert

= dritte_chance
Du hast kein einziges Angebot. Zwei Prüfungen, zweimal nicht gut genug. Du sitzt auf dem Brunnenrand und starrst in das dunkle Wasser.

Da räuspert sich jemand. Meister Kettrich, die Dreifachbrille auf der Nasenspitze, eine Laterne in der Hand.

„Regel siebenundzwanzig“, sagt er. „Wer zweimal scheitert und trotzdem bis zum Abend bleibt, statt nach Hause zu laufen, bekommt eine dritte Chance.“ Er schnaubt. „Die Regel habe ich mir gerade ausgedacht. Aber sie gefällt mir.“

Er hält dir eine Karte hin. „Probejahr bei Webstuhl und Amboss. Erst arbeiten, dann gehören. Viel Arbeit. Ein Angebot. Bis Mitternacht.“
~ angebot_webstuhl = true
-> freund_erklaert

= freund_erklaert
„Da bist du.“

{freund()} setzt sich neben dich auf den Brunnenrand. {Fr_er()} hat die Samtjacke ausgezogen und trägt nur noch das weiße Hemd. Die Ärmel sind hochgekrempelt, die Locken wieder durcheinander. So sieht {fr_er()} mehr aus wie {freund()}.

Eine Weile sagt keiner von euch etwas.

„Du wolltest mir etwas erklären“, sagst du schließlich.
-> fragen

= fragen
* {freund_hat_gedeckt} [„Warum gehorchen dir die Söldner der Waage?“]
    {freund()} zieht die Schultern hoch. „Sie gehorchen nicht mir. Sie gehorchen meinen Eltern. Und meine Eltern …“ {Fr_er()} sucht nach Worten. „… arbeiten für die Waage. Ziemlich weit oben. Das ist alles.“
    ~ freund_ausrede = true
    -> fragen
* {freund_auf_tribuene} [„Warum hast du heute auf der Tribüne gestanden?“]
    „Weil ich musste“, sagt {freund()}. „Meine Eltern sind … wichtig in der Waage. Nicht die Wichtigsten. Aber wichtig. Und an solchen Tagen muss die ganze Familie dastehen und lächeln.“ {Fr_er()} verzieht das Gesicht. „Ich hab nicht gelächelt. Hast du gesehen?“
    ~ freund_ausrede = true
    -> fragen
* {pell_versprecher} [„Wie heißt du eigentlich mit Familiennamen?“]
    {freund()} sieht in den Brunnen. Sehr lange.
    „Ist das wichtig?“, fragt {fr_er()} leise.
    „Pell hat angefangen, ihn zu sagen. Arv…“
    „Pell redet viel.“ {freund()} schlingt die Arme um die Knie. „Ich bin {freund()}. Einfach {freund()}. Das hab ich dir doch gesagt. Bei dir will ich nur das sein.“
    -> fragen
* {goldknopf_gefunden} [Einen goldenen Knopf erwähnen, der im Zelt der Waage lag]
    { freund_hat_gedeckt:
        {freund()} sieht auf {fr_sein()}en Ärmel, wo ein Knopf fehlt. „Ja“, sagt {fr_er()}. „Der ist mir abgerissen. Als ich da drin warten musste. Den ganzen Nachmittag. Im Zelt.“ {Fr_er()} lacht, aber es klingt nicht fröhlich. „Sehr spannend, so ein Zelt.“
    - else:
        {freund()} sieht schnell auf {fr_sein()}en Ärmel. Dann zieht {fr_er()} ihn über das Handgelenk. „Goldknöpfe gibt es in der Oberstadt wie Sand am Meer“, sagt {fr_er()}. Etwas zu schnell.
    }
    -> fragen
* [„Weißt du, wofür die Waage die Glaskugeln braucht?“]
    { register_geheimnis:
        Du erzählst {fr_ihm()}, was du gehört hast. Einen Funken jeden Mond. Für Gefäße der Waage.
        {freund()} wird bleich. „Das …“ {Fr_er()} schluckt. „Davon weiß ich nichts. Ich schwöre. Beim Abendessen reden sie über Zahlen. Immer nur über Zahlen. Tausend. Bis zum Winter.“ {Fr_er()} starrt dich an. „Tausend Kugeln?“
    - else:
        {freund()} schüttelt den Kopf. „Beim Abendessen reden sie über Zahlen. Immer nur über Zahlen. Tausend, bis zum Winter. Tausend was, hab ich nie gefragt.“ {Fr_er()} runzelt die Stirn. „Vielleicht hätte ich fragen sollen.“
    }
    -> fragen
* [Genug gefragt.]
    -> antwort

= antwort
{freund()} atmet tief durch.

„Ich hab Angst gehabt, dass du mich nicht mehr magst“, sagt {fr_er()}. „Wenn du weißt, wer meine Familie ist. Die Waage hat den Spalt zugemacht. Die Waage will das Gesetz. Und du bist …“ {Fr_er()} macht eine kleine Bewegung mit der Hand. Ein Rufer. „Und ich hab dich gern. Du bist {geschlecht == "w":meine erste richtige Freundin|mein erster richtiger Freund}.“
* [„Es ist mir egal, wer deine Eltern sind.“]
    ~ aendern(beziehung_freund, 1)
    {freund()} sieht dich an, als hättest du gerade die Sonne zurück an den Himmel gehängt. „Wirklich?“
    „Wirklich. Du bist nicht deine Eltern.“
    {Fr_er()} lächelt, und zum ersten Mal an diesem Tag ist es ein echtes Lächeln.
* [„Du hättest es mir früher sagen müssen.“]
    ~ aendern(beziehung_freund, -1)
    {freund()} zuckt zusammen. Dann nickt {fr_er()}. „Ja“, sagt {fr_er()} leise. „Hätte ich.“ {Fr_er()} pult an einem Faden des Hemdes. „Ich sag es dir jetzt. Ein bisschen. Ist ein bisschen besser als gar nicht?“
* [„Ich weiß noch nicht, was ich davon halten soll.“]
    „Das ist ehrlich“, sagt {freund()}. „Ehrlich ist gut. Ehrlich ist besser als das, was ich den ganzen Tag gehört habe.“
- „Und noch etwas“, sagt {freund()}, und {fr_sein()}e Stimme wird ernst. „Was du heute auch wählst: Geh nicht ins Zelt der Waage. Bitte. Ich weiß nicht genau, warum. Ich weiß nur, dass meine Mutter dabei so lächelt, wie sie lächelt, wenn sie ein gutes Geschäft gemacht hat.“

Dann steht {fr_er()} auf. „Ich warte hier. Geh. Bis Mitternacht.“
-> waehlen

= waehlen
# bild: szene/gildenlaternen
Du gehst über den Marktplatz. Die Laternen leuchten. Du denkst an Yrsa: Eine Gilde ist wie ein Mantel. Er wärmt. Aber du trägst auch seine Farbe.

Wohin gehst du?
* {angebot_webstuhl} [Zur blauen Laterne: Webstuhl und Amboss. Die Gilde mit dem Weg in die Minen.]
    -> webstuhl
* {angebot_feder} [Zur silbernen Laterne: die Gesellschaft der Weiten Feder. Die Gilde, die zeichnet, was ist.]
    -> feder
* {angebot_phiole} [Zur roten Laterne: der Zirkel der Glühenden Phiole. Die Gilde, die keine Register mag.]
    -> phiole
* {angebot_hand} [In die dunkle Hofeinfahrt: die Leise Hand. Die Gilde, die es offiziell nicht gibt.]
    -> hand
* [Zum goldenen Zelt: Dich bei der Waage einschreiben. Schutz und Obhut.]
    -> waage
* [Nirgendwohin. Du gehörst niemandem.]
    -> niemand

= webstuhl
~ gilde = "webstuhl_amboss"
~ magie_registriert = "gilde"
~ erster_auftrag = "wollmark"
~ aendern(ruf_webstuhl_amboss, 1)
# bild: szene/beitritt-webstuhl
# tagebuch: Webstuhl und Amboss
In der Tuchhalle stehen die Webstühle still, aber die Lampen brennen. Kettrich steht auf seinem Podest, so feierlich, wie ein sehr kleiner Gnom auf einem sehr großen Podest aussehen kann.

„Regel eins der Gilde“, sagt er. „Sprich mir nach.“

„Erst arbeiten, dann gehören“, sagst du.

„Und jetzt gehörst du.“ Er steckt dir ein Abzeichen an die Jacke: ein Webschiffchen, gekreuzt mit einem Hammer. „Damit kommst du in die Minen. Und in die Kantine.“ Er räuspert sich. „Und dein Ruf steht in unserem Buch. Unser Buch, nicht das der Waage. Die Waage bekommt einen Namen und ein Siegel. Sonst nichts. Regel einunddreißig.“

Dann reicht er dir einen Brief. „Dein erster Auftrag. Die Wollhändler in Wollmark, draußen an der Spaltstraße, haben seit zwei Wochen nicht geliefert. Sie sagen, Gnolle schleichen um ihre Weiden. Geh hin. Finde heraus, was los ist.“
->->

= feder
~ gilde = "weite_feder"
~ magie_registriert = "gilde"
~ erster_auftrag = "weiden_karte"
~ aendern(ruf_weite_feder, 1)
# bild: szene/beitritt-feder
# tagebuch: Die Weite Feder
Ganz oben im Haus der Weiten Feder, unter den Fernrohren, wartet Meister Orwin. Durch die Dachluke siehst du die Sterne.

„Bei uns gibt es nur einen Schwur“, sagt er. „Wir zeichnen, was ist.“

„Wir zeichnen, was ist“, sagst du.

Er steckt dir eine kleine silberne Feder an den Kragen. „Damit darfst du jedes Archiv der Gesellschaft betreten. Auch das, in dem die alten Karten liegen.“ Er zwinkert über beide Brillen hinweg. „Auch die ganz alten. Und dein Name steht in unserem Buch. Wer zaubert, steht darin wie jeder andere. Mit Tinte, die nicht verrät, wofür.“

Dann rollt er eine Karte auf dem Tisch aus. Die Weiden, bis an den Fuß des Kharvan-Kamms. Sie ist voller Lücken. „Dein erster Auftrag. Unsere Karte der Weiden ist zwanzig Jahre alt. Die Hirten erzählen von Feuern in den Hügeln, wo keine sein sollten. Geh hinaus. Zeichne, was ist.“
->->

= phiole
~ gilde = "phiole"
~ magie_registriert = "gilde"
~ erster_auftrag = "mondklee"
~ aendern(ruf_phiole, 1)
# bild: szene/beitritt-phiole
# tagebuch: Die Glühende Phiole
Im Hof der Phiole brodeln die Kessel noch. Meisterin Ambra hält dir einen Becher hin, in dem etwas Goldenes blubbert.

„Unser Schwur“, sagt sie, „ist ein Schluck. Er schmeckt nach Honig. Meistens.“

Du trinkst. Es schmeckt nach Honig. Und dann nach Pfeffer. Und dann, für einen kurzen Moment, siehst du alles in leuchtenden Farben.

„Willkommen“, sagt Meisterin Ambra und hängt dir ein winziges Fläschchen an einem Lederband um den Hals. „Das Zeichen der Phiole. Und dein Name steht in unserem Buch.“ Sie klopft auf einen dicken Band. „Das wir übrigens gleich wieder vergessen haben.“

„Dein erster Auftrag: Mondklee. Er wächst nur an den Hängen über Ginsterhof, ganz am Rand der Weiden. Wir brauchen einen Korb voll. Die Nächte dort draußen sind dunkel. Nimm Leuchttrank mit.“
->->

= hand
~ gilde = "leise_hand"
~ magie_registriert = "gilde"
~ erster_auftrag = "ginsterhof"
~ aendern(ruf_leise_hand, 1)
# bild: szene/beitritt-hand
# tagebuch: Die Leise Hand
In der Hofeinfahrt ist es so dunkel, dass du Fink erst siehst, als er schon vor dir steht.

„Die Hand schwört nicht“, sagt er. „Die Hand schweigt.“ Er legt einen Finger an die Lippen. Du tust es ihm nach.

Dann nimmt er deine Jacke, dreht sie um und näht mit drei schnellen Stichen ein kleines Stück Stoff in das Futter. Eine Hand, die einen Finger an die Lippen legt. Niemand wird es je sehen, der nicht weiß, wo er suchen muss.

„Und das Gesetz?“, fragst du. „Ich muss in einer Gilde sein. In einer, die es gibt.“

Fink grinst. „Die Hand hat Freunde in jeder Gilde. Morgen stehst du im Buch der Kartografen. Als Kartenträger. Auf dem Papier.“ Er zuckt die Schultern. „Papier ist geduldig.“

„Dein erster Auftrag: ein Päckchen. Nach Ginsterhof, am Fuß der Ziegenstiege. Jemand dort wartet darauf.“ Er hält inne. „Diesmal darfst du reinschauen. Es ist eine Landkarte. Und ein Name.“
->->

= waage
# bild: szene/zelt-register
Im goldenen Zelt sitzt ein freundlicher Schreiber hinter einem Stapel Verträge. Er lächelt, als hätte er auf dich gewartet. „Ah. Das Kind vom Färberturm. Schön, dass du von selbst kommst. Die meisten müssen wir holen.“

Er schiebt dir einen Vertrag hin und eine Feder.
{ register_geheimnis:
    Du weißt, was ganz unten steht, in winzigen Buchstaben. Jeden Neumond ein Funke.
}
-> vertrag_waage

= vertrag_waage
* {register_geheimnis} [Auf das Kleingedruckte zeigen: „Was heißt das hier?“]
    Der Schreiber lächelt weiter. „Das ist nur eine Formalität. Ein kleiner Beitrag zum Wohl der Stadt. Du spürst es kaum.“ Er tippt auf die Linie. „Ohne Unterschrift kein Schutz.“
    -> vertrag_waage
+ [Unterschreiben]
    Du unterschreibst. Die Feder kratzt.
    -> eingeschrieben
+ [Aufstehen und doch wieder gehen]
    Du legst die Feder hin. „Ich … überlege es mir noch.“
    Der Schreiber lächelt weiter. „Natürlich. Die Tür ist offen. Bis Neumond.“
    -> waehlen

= eingeschrieben
~ magie_registriert = "waage"
~ erster_auftrag = "waage_wollmark"
~ aendern(ruf_goldene_waage, 1)
~ aendern(beziehung_freund, -1)
# tagebuch: Das Register
„Willkommen in der Obhut der Waage“, sagt der Schreiber und gibt dir eine kleine Plakette aus Messing mit einer Nummer darauf. „Eingeschriebene Rufer, die sich bewähren, dürfen im Dienst der Waage reisen.“ Er zwinkert. „Auch durch den Spalt.“

„Dein erster Dienst: Morgen fährt ein Wagen der Waage nach Wollmark, an der Spaltstraße. Du begleitest ihn. Die Hirten dort sind unruhig. Gnolle. Ein Rufer im Wagen beruhigt die Leute.“

Als du hinausgehst, steht {freund()} auf der anderen Seite des Platzes am Brunnen. {Fr_er()} sieht das goldene Zelt. Dann dich. Dann dreht {fr_er()} sich um und geht.
->->

= niemand
~ magie_registriert = ""
~ erster_auftrag = "eigener_weg"
# bild: szene/brunnen-nacht
# tagebuch: Niemandes Mantel
Du gehst an allen Laternen vorbei. An der blauen, der silbernen, der roten. Am goldenen Zelt. Bis du wieder am Brunnen stehst.

„Keine?“, fragt {freund()}.

„Keine.“

{freund()} sieht dich lange an. „Ab dem Neumond bist du dann …“

„Ungeprüft“, sagst du. „Ich weiß.“

{freund()} nickt langsam. Dann grinst {fr_er()} schief. „Weißt du was? Das ist das Mutigste, was ich je gesehen hab. Oder das Dümmste.“ {Fr_er()} stößt dich mit der Schulter an. „Wahrscheinlich beides.“
{ gnolle_gesichtet:
    „Und jetzt?“
    „Jetzt gehe ich nach Wollmark“, sagst du. „Grumak sagt, auf den Weiden sind Gnolle. Innerhalb des Kamms. Wenn sie hereingekommen sind, gibt es einen Weg hinaus.“
- else:
    „Und jetzt?“
    „Jetzt gehe ich hinaus auf die Weiden“, sagst du. „Bis zum Neumond bleibt mir eine Woche. In der Stadt finde ich keinen Weg hinaus. Vielleicht da draußen.“
}
->->


=== p3_heimweg
# bild: szene/heimweg-nacht
Es ist fast Mitternacht, als du nach Hause gehst. Die Gassen sind leer, nur die Laternen der Gilden glimmen noch.
{ magie_registriert != "waage":
    {freund()} begleitet dich bis zur Ecke. „Bis bald“, sagt {fr_er()}. „Ich finde dich. Ich finde dich immer.“
}

An der nächsten Ecke stehen zwei schwarze Mäntel. Einer hat ein großes Buch unter dem Arm, der andere eine Laterne. Sie halten jeden an, der vorbeikommt.

„Name? Gilde? Rufst du ein Element?“
{
- magie_registriert == "waage":
    Du zeigst die Messingplakette. Der Söldner hält die Laterne daran, liest die Nummer und nickt. „Eingeschrieben. Gut. Bis Neumond, Rufer.“
    Er sagt Rufer, wie man Fass sagt.
    -> zuhause_an
- gilde == "leise_hand":
    „Kartografen“, sagst du. „Kartenträger. Morgen im Buch.“ Du hältst den Atem an.
    Der Mann blättert. Er findet nichts. Aber es ist spät, und morgen ist morgen. „Morgen im Buch“, wiederholt er. „Sonst übermorgen in Gewahrsam.“
    -> zuhause_an
- gilde != "":
    Du zeigst {gilde == "webstuhl_amboss":das Abzeichen mit dem Webschiffchen}{gilde == "weite_feder":die silberne Feder}{gilde == "phiole":das Fläschchen am Lederband}. Der Söldner schreibt etwas in sein Buch. „Gilde. Gut. Die Gilde bürgt.“ Er klingt fast enttäuscht.
    -> zuhause_an
- else:
    -> kontrolle
}

= kontrolle
{ magie_gildentag || magie_oeffentlich:
    Der Söldner mit dem Buch hebt die Laterne an dein Gesicht. „Moment“, sagt er. „Dich kenne ich. Färberturm.“
}
* [Behaupten, du rufst kein Element (Ausstrahlung)]
    ~ temp e = probe(ausstrahlung)
    ~ probe_zeile("Ausstrahlung", e)
    { e:
    - ERFOLG:
        „Ich? Ich kann nicht mal eine Kerze anzünden, ohne mir die Finger zu verbrennen.“ Du lachst. Der Söldner sieht dich an. Dann zuckt er die Schultern. „Weiter.“
    - else:
        ~ von_waage_notiert = true
        Der Söldner lacht nicht mit. Er schlägt das Buch auf und schreibt etwas hinein. Deinen Namen. Und ein Wort, das du auf dem Kopf nicht lesen kannst.
        „Ab Neumond“, sagt er nur.
    }
* [Umdrehen und durch die Hinterhöfe verschwinden (Geschick)]
    ~ temp e2 = probe(geschick)
    ~ probe_zeile("Geschick", e2)
    { e2:
    - ERFOLG:
        Du bist um die Ecke, über eine Mauer und durch einen Hof, bevor der Mann mit dem Buch auch nur die Feder angesetzt hat.
    - else:
        ~ von_waage_notiert = true
        Du rennst. Du entkommst. Aber hinter dir hörst du, wie der eine zum anderen sagt: „Schreib auf. Kind vom Färberturm. Läuft weg. Ab Neumond.“
    }
* [Die Wahrheit sagen: „Ja. Und ich gehöre niemandem.“]
    ~ von_waage_notiert = true
    Die beiden sehen sich an. Der mit dem Buch schreibt langsam deinen Namen auf. „Mutig“, sagt er. „Bis Neumond ist das noch erlaubt.“ Er klappt das Buch zu. „Danach nicht mehr.“
- -> zuhause_an

= zuhause_an
{ brief_erhalten:
    ~ spirale_an_tuer = true
    Als du die Tür erreichst, bleibst du stehen. Auf dem Türrahmen, in Augenhöhe, hat jemand mit Kreide ein kleines Zeichen gemalt. Eine Spirale aus vier Linien.
    Die Kreide ist noch frisch. Jemand weiß, wo du wohnst. Und will, dass du es weißt.
    Du wischst das Zeichen weg, bevor es jemand anderes sieht.
}
{ ausloeser == "schulden" || schulden_versprochen:
    { gilde != "":
        ~ fesk_aufschub = true
        Unter der Tür steckt ein Zettel mit silbernem Stempel. „Glückwunsch zum Gildenbeitritt. Das Kontor gewährt Gildenmitgliedern zwei Wochen Aufschub. Hochachtungsvoll, Fesk.“ Darunter, kleiner: „Wir werden uns trotzdem wiedersehen.“
    - else:
        Unter der Tür steckt ein Zettel mit silbernem Stempel. Nur ein Wort: „Neumond.“
    }
}
{ ausloeser == "verschwunden" && bp_nachricht:
    Du zündest die Kerze im Fenster an. Irgendwo da draußen, unter dem Berg, ist {bp()}. Du wirst {bp_ihn()} finden.
}
->->


=== p3_tagebuch
# bild: tagebuch/perle-3
# tagebuch: Die Gildenprobe
In dieser Nacht schläfst du tief. Als du aufwachst, ist die Kraft in dir zurück.
~ rasten()

Du schlägst dein Buch auf. Du zeichnest den Marktplatz mit der schwarz-goldenen Tribüne und die Laternen der Gilden.{p3_webstuhl: Das große Wasserrad.}{p3_feder: Die Gewölbe unter dem Markt.}{p3_phiole: Einen kleinen Kessel mit leuchtendem Trank.}{p3_hand: Ein Zelt mit goldenen Fransen.}
{ spirale_im_gewoelbe:
    Und in eine Ecke, ganz klein: vier Gestalten im Kreis. Stein, Welle, Flamme, Feder.
}
# karte: gewoelbe

Darunter schreibst du:

„Heute war Gildentag.
{
- gilde == "webstuhl_amboss":
    Ich gehöre jetzt zu Webstuhl und Amboss. Erst arbeiten, dann gehören.
- gilde == "weite_feder":
    Ich gehöre jetzt zur Weiten Feder. Wir zeichnen, was ist.
- gilde == "phiole":
    Ich gehöre jetzt zur Glühenden Phiole. Der Schwur hat nach Honig und Pfeffer geschmeckt.
- gilde == "leise_hand":
    Ich gehöre jetzt zur Leisen Hand. Mehr schreibe ich nicht auf.
- magie_registriert == "waage":
    Ich habe mich bei der Waage eingeschrieben. Schutz und Obhut. Ich hoffe, ich habe das Richtige getan.
- else:
    Ich gehöre keiner Gilde. Ab Neumond bin ich ungeprüft.
}
Wer zaubert, muss sich einschreiben. Das ist jetzt Gesetz.
{ register_geheimnis:
    Wer sich bei der Waage einschreibt, muss jeden Neumond einen Funken abgeben. Für die Glaskugeln. Das steht ganz unten im Vertrag, ganz klein.
}
{ sabotage_entdeckt:
    Das Silbermark-Kontor hat das große Rad der Tuchhalle sabotiert. Das Kontor und die Waage. Als hätten sie sich abgesprochen, hat Kettrich gesagt.
}
{ freund_ausrede:
    {freund()}s Eltern sind wichtig in der Waage. Sagt {fr_er()}.
}
{ goldknopf_gefunden:
    Im Zelt der Waage lag ein Goldknopf. Wie die an {freund()}s Jacke.
}
{ pell_versprecher:
    Magister Pell hat {freund()} „Arv…“ genannt.
}
{ gnolle_gesichtet:
    Auf den Weiden sind Gnolle. Innerhalb des Kamms. Wie sind sie hereingekommen?
}
{ bp_nachricht:
    {bp()} ist in die Tiefe Stiege gegangen. Allein.
}
{ spirale_an_tuer:
    Jemand hat die Spirale an meine Tür gemalt.
}
Morgen gehe ich hinaus auf die Weiden.“

Kraftfunken: {kraftfunken}
->->
