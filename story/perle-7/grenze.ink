// =====================================================================
// Perle 7 – Jenseits der Berge: das Grenzland, Dornfurt, der Fremde
// =====================================================================

=== p7_draussen
# bild: entdeckung/jenseits-der-berge
Vor dir liegt ein anderes Land.

Neben dem Weg steht ein alter Grenzstein, halb im Gras versunken, mit Moos auf der Kante. Auf der Seite, die nach Westen zeigt, ist eine Muschel mit einer Perle eingemeißelt, das Wappen von Lysmara. Auf der anderen Seite ist nichts. Nur Stein.

Du drehst dich ein letztes Mal um. Der Kamm. Dahinter die Weiden, die Stadt, das Meer. Alles, was du kennst.
* [Laut „Auf Wiedersehen“ sagen]
    „Auf Wiedersehen“, sagst du. Es klingt lächerlich, so allein auf einem Hügel. Aber es tut gut. {freund_kommt_mit:{freund()} sagt es auch, leiser, und dann nehmt ihr euch kurz an der Hand.}
* [Den Grenzstein in dein Buch zeichnen]
    Du setzt dich ins Gras und zeichnest den Stein, die Muschel, die Perle. Und auf die leere Seite malst du einen kleinen Pfeil. Nach Osten.
* [Einen Kiesel aufheben und mitnehmen]
    Du hebst einen Kiesel vom Weg auf, einen von der Westseite des Steins, und steckst ihn in die Tasche. Ein Stück Meridel. Für unterwegs.
-
Dann gehst du weiter. Der Stein bleibt hinter dir zurück, und mit ihm die Muschel und die Perle.


Braune Hügel statt grüner Weiden, lang gezogene Täler, Birkenwälder, und weit im Osten ein Fluss, der in der Sonne glitzert. Hinter dir der Kharvan-Kamm, von dieser Seite aus noch höher, noch steiler. Du hast ihn noch nie von hinten gesehen. Niemand, den du kennst, hat das.
{ p7_erschoepft:
    Du bist so müde, dass jeder Schritt wehtut. Aber du gehst.
}
{ freund_kommt_mit:
    {freund()} steht neben dir und sagt lange nichts. Dann: „Es ist so groß.“
}

Am Nachmittag kommst du durch ein Dorf.
# bild: szene/leeres-dorf
Ein Dutzend Häuser, ein Brunnen, ein kleiner Tempel. Die Türen stehen offen. Auf einem Tisch steht ein Teller mit Brot, hart wie Stein. Eine Wäscheleine mit Hemden, die niemand abgenommen hat. Kein Hund bellt. Kein Huhn gackert.
{ grumak_gewarnt:
    Genau wie Grumak erzählt hat. Damals am Brunnen, als es noch klang wie eine Geschichte.
}
Auf den Feldern hinter dem Dorf liegen graue Flecken im Gras, wie verschüttete Asche. Klein, nicht viele. Aber das Schweigen war hier.

Am Brunnen steht eine Ziege. Sie ist an einer Seite grau und starrt nach Osten, ohne zu blinzeln.
* [Die Ziege wecken]
    ~ ziege_folgt = true
    Du klatschst in die Hände, pfeifst, rufst. {element == "erde":Du lässt den Boden unter ihren Hufen summen.}{element == "wasser":Du spritzt ihr eine Handvoll Brunnenwasser ins Gesicht.}{element == "feuer":Du lässt einen Funken vor ihrer Nase tanzen.}{element == "wind":Du bläst ihr einen Windstoß ins Ohr.} Die Ziege zuckt zusammen, blökt empört und sieht dich an, als wärst du schuld an allem. Dann trottet sie dir hinterher. Den ganzen Weg.
    ~ aendern(ruf_hirten, 1)
* [Weitergehen. Du kannst nicht jede Ziege retten.]
    Du gehst weiter. Als du dich nach einer Weile umdrehst, steht die Ziege immer noch da. Grau. Still.
-
Der Fluss ist weiter weg, als er aussah. Als die Sonne hinter dem Kamm versinkt, bist du noch lange nicht da.
->->


=== p7_dornfurt
# bild: entdeckung/dornfurt
Dornfurt liegt an einer Furt im Fluss, hinter einem Zaun aus angespitzten Pfählen. Und Dornfurt ist laut.

Glocken läuten, nicht nur zur vollen Stunde, sondern ständig, mal hier, mal dort. Auf dem Marktplatz schlägt jemand eine große Trommel, langsam und gleichmäßig wie ein Herz. Hunde bellen, Händler schreien, Kinder rennen mit Rasseln durch die Gassen.

„Hier ist es nie still“, sagt eine Frau am Tor, als sie dein Gesicht sieht. „Nie. Nicht bei Tag und nicht bei Nacht. Das ist Absicht.“

In den Gassen drängen sich Menschen, die nicht von hier sind. Leute aus den leeren Dörfern, mit Karren und Bündeln. Orks aus dem Osten. Ein paar Zwerge. Und am Fluss, in einem eigenen Lager, eine Gruppe Gnolle, die niemand verjagt.
-> p7_markt ->
{ grumak_ring:
    -> halber_hauer
}
Du findest einen Platz zum Schlafen unter dem Dach der Markthalle, zwischen zwei Familien aus dem Osten, die dir von ihrem Brot abgeben.
-> erledigen

= halber_hauer
# bild: szene/zum-halben-hauer
Das Gasthaus Zum Halben Hauer ist leicht zu finden. Über der Tür hängt ein riesiger Orkzahn, der in der Mitte abgebrochen ist.

Der Wirt ist ein Ork, kleiner als Grumak, aber mit denselben Augen. Einer seiner unteren Hauer ist nur ein Stumpf. Als du ihm den eisernen Ring zeigst, lässt er den Krug fallen, den er gerade spült.

„Grumaks Ring“, sagt er. „Dann lebt der alte Nussknacker also noch.“ Er lacht, so laut, dass die Gläser klirren. „Durgash. Setz dich. Iss. Das Essen ist schlecht, aber es ist viel.“

Das Essen ist tatsächlich schlecht. Das Bett ist tatsächlich gut.

Beim Essen erzählt Durgash. Die Dörfer sind leer, den ganzen Weg nach Osten, bis nach Kar Duun. „Kar Duun steht noch“, sagt er. „Sie schlagen dort Tag und Nacht die Trommeln. Die Trolle singen auf den Mauern. Solange es laut ist, kommt es nicht herein.“ Er sieht dich an. „Aber man kann nicht ewig singen, Kind. Irgendwann wird jeder heiser.“
-> erledigen

= erledigen
{ fesk_auftrag:
    # bild: szene/silbermark-stube
    Am nächsten Morgen suchst du die Stube des Silbermark-Kontors. Ein schmales Haus mit einem silbernen Schild. Ein dünner Schreiber nimmt das Päckchen, prüft das Siegel und schneidet die Schnur auf.
    Darin liegt ein Stein. Ein ganz gewöhnlicher Flusskiesel. Und ein Zettel.
    Der Schreiber liest ihn, zieht die Augenbrauen hoch und liest ihn dir vor: „Wer diesen Stein über einen geschlossenen Pass trägt, ohne nachzusehen, was darin ist, der zahlt seine Schulden. Schuld erlassen. – F.“
    Der Schreiber stempelt ein Papier und gibt es dir. „Quittiert“, sagt er. „Das hab ich auch noch nie gesehen.“
    Du stehst lange vor dem Haus und weißt nicht, ob du lachen oder dich ärgern sollst. Am Ende lachst du.
}
-> p7_gnolllager ->
{ brief_erhalten:
    -> brief
}
-> ausklang

= brief
# bild: szene/faehrfrau
Am Fluss liegt eine Fähre, ein breites Floß an einem Seil, und darauf steht eine alte Frau mit einer langen Stange. Sie stakt Leute hinüber und herüber, den ganzen Tag.

Du willst schon weitergehen, als du es siehst. In das Holz der Stange, ganz oben, ist ein Zeichen geschnitzt. Vier verschlungene Ringe.

Gib ihn dem Ersten, der dir dasselbe Zeichen zeigt. Auf der anderen Seite der Berge.

Du ziehst den Brief aus dem Bündel. Wochen hast du ihn getragen. Das Siegel ist noch ganz.

Die Fährfrau sieht das Siegel und wird blass. Sie nimmt den Brief, ganz vorsichtig, als könnte er zerbrechen. „Von wem hast du den?“

„Von einem Fremden. Im grauen Mantel. In einer Regennacht.“

Sie bricht das Siegel und liest. Einmal. Zweimal. Dann faltet sie den Brief zusammen und steckt ihn in ihr Hemd, direkt über dem Herzen.

„Dann ist es also wahr“, sagt sie leise. Sie sieht dich an, lange. „Du hast keine Ahnung, was du getragen hast. Oder?“

Du schüttelst den Kopf.

„Gut“, sagt sie. „Das war klug von ihm.“ Sie stößt die Stange ins Wasser. „Komm heute Nacht an den Steg. Jemand will dich sehen.“
~ brief_uebergeben = true
-> ausklang

= ausklang
{ ausloeser == "verschwunden":
    Am Nachmittag schreibst du {bp()} einen Brief. { p7_route == "meer" && hintergrund == "schiffsjunge":Ein Fischer, der morgen zur Küste fährt, nimmt ihn mit, zu Rhea, die dort noch auf ihrem Schiff wartet.|Ein Händler, der nächsten Monat übers Meer nach Westen fahren will, verspricht, ihn mitzunehmen.} Du schreibst: „Ich bin angekommen. Es ist größer, als wir dachten. Mach dir keine Sorgen. Ich mache mir genug für uns beide.“
}
{ ausloeser == "flucht":
    Niemand in Dornfurt kennt dich. Niemand sieht dir nach. Niemand hat je von der Goldenen Waage gehört. Du gehst über den Markt, mitten durch die Menge, und musst nicht über die Schulter sehen. Es fühlt sich an wie Fliegen.
}
{ freund_kommt_mit:
    {freund()} kauft auf dem Markt einen Hut, der viel zu groß ist, und lacht. „Hier weiß keiner, wer meine Mutter ist“, sagt {fr_er()}. „Hier bin ich einfach {freund()}.“ {Fr_er()} setzt den Hut auf. Er rutscht {fr_ihm()} über die Augen. „Einfach {freund()} mit einem sehr großen Hut.“
}
->->


// ---------------------------------------------------------------------
// Der Fremde am Steg
// ---------------------------------------------------------------------
=== p7_ithren
# bild: szene/fremder-am-steg
In der Nacht gehst du hinunter an den Fluss. Hinter dir dröhnt die Trommel, langsam und gleichmäßig. Die Fackeln am Steg spiegeln sich im schwarzen Wasser.

Am Ende des Stegs sitzt jemand. Ein langer grauer Mantel. Ein heller Stab aus Treibholz, quer über den Knien. Und unter der Kapuze, als er den Kopf hebt, ein Schimmer wie Mondlicht auf Wasser.

Der Fremde.
{ brief_uebergeben:
    „Du hast ihn gebracht“, sagt er. „Den ganzen Weg. Durch alles hindurch.“ Er nickt langsam. „Gehofft habe ich es. Gewusst nicht. Niemand weiß so etwas vorher.“
- else:
    „Du hast meinen Brief nicht genommen“, sagt er. „Damals, im Regen. Und bist trotzdem hier.“ Ein leises Lächeln unter der Kapuze. „Das ist fast noch besser.“
}
{ fremder_p4:
    „Wir sind uns schon auf den Weiden begegnet. Du warst damals mutiger, als gut für dich war. Das bist du immer noch.“
}
Du setzt dich neben ihn. Die Bretter sind kalt.
- (fragen)
{ fragen > 4:
    -> schluss
}
* [„Wer bist du?“]
    ~ ithren_name = true
    Er ist eine Weile still. Dann schiebt er die Kapuze ein Stück zurück. Ein schmales, blasses Gesicht. Alt und jung zugleich. Und die Augen, silbrig, als spiegelten sie einen Mond, der gar nicht am Himmel steht.
    „Ithren“, sagt er. „Das ist mein Name. Ich habe ihn lange niemandem gesagt.“
    -> fragen
* [„Was ist das Schweigen?“]
    „Das weiß ich nicht“, sagt er. „Noch nicht. Ich lüge nie, also sage ich dir das: Ich weiß es nicht.“ Er sieht nach Osten. „Aber ich weiß, wo es herkommt. Du weißt es auch. Du warst dort, unter dem Berg.“
    -> fragen
* [„Warum ausgerechnet ich?“]
    „In der ersten Nacht am Zollhaus“, sagt er, „da hast du gesummt. Ganz leise. Wie ein Kessel, kurz bevor das Wasser kocht. Du hast es nicht gehört. Ich schon.“ Er klopft mit dem Stab auf die Bretter. „Ich höre so etwas. Das ist meine Gabe. Nicht laut, nicht stark. Aber ich höre es.“
    -> fragen
* [„Kommst du jemals zurück nach Meridel?“]
    Ithren lächelt. „Ich war oft in Meridel. Öfter, als irgendwer dort weiß. Am Hafen, auf den Weiden, einmal sogar in der Ratshalle, bei einer sehr langweiligen Sitzung.“ Er sieht nach Westen, zu den Bergen, die man im Dunkeln nicht sieht. „Ich komme wieder, wenn das Herz mich ruft. Das ist kein Versprechen. Aber es ist wahr.“
    -> fragen
* [Nichts mehr fragen. Einfach dasitzen.]
    -> schluss

= schluss
{ not ithren_name:
    ~ ithren_name = true
    Nach einer Weile sagt er, ohne dass du gefragt hast: „Ithren. So heiße ich. Falls du mich einmal rufen musst.“
}
{ herz_beruhigt:
    „Du hast den Splitter zurückgegeben“, sagt Ithren. „Das Herz hat es gespürt. Ich auch. Den ganzen Weg bis hierher.“
}
{ herzsplitter:
    Er sieht auf deine Tasche, in der der Splitter summt. „Pass gut auf ihn auf. Er weiß, wo er hingehört. Vielleicht zeigt er dir eines Tages den Weg.“
}

Ithren sieht lange auf den Fluss hinaus. Hinter euch schlägt die Trommel.

„Das Herz in eurem Berg ist nicht das einzige“, sagt er. „Es gibt noch andere. Tief unter anderen Bergen, unter anderen Meeren.“ Er macht eine Pause. „Und eines davon ist schon still.“

Du spürst, wie dir kalt wird. Nicht vom Fluss.
{ freund_kommt_mit:
    Hinter dir knarren die Bretter. {freund()} steht am Anfang des Stegs, den viel zu großen Hut in der Hand. {Fr_er()} hat alles gehört. Und {fr_er()} läuft nicht weg.
}

Ithren steht auf. „Ich gehe morgen nach Osten“, sagt er. „Du kannst mitkommen. Oder du gehst nach Hause, zu den Menschen, die auf dich warten. Beides ist richtig. Das ist das Schwierige daran.“

Er geht den Steg entlang, an dir vorbei, in die Fackeln, in die Dunkelheit, in den Lärm der Stadt. Als du dich umdrehst, ist er fort.

Nur auf den nassen Brettern, wo er gesessen hat, ist ein Zeichen. Mit dem Stab ins Holz gedrückt. Vier verschlungene Ringe.

Und daneben, ganz frisch: ein Pfeil. Nach Osten.
->->


// ---------------------------------------------------------------------
// Tagebuch und Ende
// ---------------------------------------------------------------------
=== p7_tagebuch
# bild: tagebuch/perle-7
# tagebuch: Der Weg hinaus
# karte: meridel-ganz
Im Gasthaus, beim Licht einer einzelnen Kerze, schlägst du dein Buch ein letztes Mal für dieses Abenteuer auf.

Du zeichnest die ganze Karte von Meridel. Lysmara am Meer, die Weiden, den Orin, die Minen, Vardholm in seiner Schlucht. Und dann, zum ersten Mal, malst du über den Rand des Kamms hinaus. Einen Fluss. Eine Stadt mit Pfählen. Einen Pfeil nach Osten.

Darunter schreibst du: # handschrift

„Ich bin draußen.
{ p7_route:
- "spalt":
    Ich bin durch den Nyrrspalt gegangen. Durch das Tor, wie es sich gehört.
- "gipfel":
    Ich bin über die Gipfel gegangen. Oben war der Wind.
- "tiefe":
    Ich bin unter dem Berg hindurchgegangen, am Herz vorbei.
- "meer":
    Ich bin übers Meer gefahren, nachts, ohne Laterne.
}
{ herz_beruhigt:
    Ich habe dem Herz seinen Splitter zurückgegeben.
}
{ brief_uebergeben:
    Ich habe den Brief übergeben. Endlich.
}
{ fesk_auftrag:
    Meine Schulden sind bezahlt. Mit einem Stein.
}
{ ausloeser == "flucht":
    Hier sucht mich niemand.
}
{ freund_kommt_mit:
    {freund()} ist bei mir.
- else:
    {freund()} ist zu Hause geblieben. Ich habe {goldknopf_gefunden:{fr_sein()}en Goldknopf|eine Erinnerung} in der Tasche.
}
Hinter den Bergen sind die Dörfer leer. Die Städte, die noch stehen, sind laut. Das Schweigen kommt aus den Bergen. Aus Herzen aus Kristall. Und es gibt mehr als eins.
Der Fremde heißt Ithren.
Morgen geht er nach Osten.
Der Kompass zeigt nach Westen. Nach Hause.
Ich weiß noch nicht, wohin ich gehe.
Aber ich weiß jetzt, dass ich es kann.“ # tagebuch_ende

Kraftfunken: {kraftfunken}
->->

=== p7_ende
# ende: erstes-abenteuer
Ende des ersten Abenteuers.
-> END
