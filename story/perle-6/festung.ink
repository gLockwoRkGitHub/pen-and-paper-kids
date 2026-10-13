// =====================================================================
// Perle 6 – Nachts in Vardholm: die Kugelhalle und das Werk.
// Am Abend darauf: die Vorführung und die Wahrheit über Liora/Cassian.
// =====================================================================

=== p6_festung
# bild: entdeckung/vardholm-hof
Der Hof von Vardholm ist voller Menschen, und keiner von ihnen redet. Eingeschriebene Rufer sitzen auf Strohsäcken an den Mauern, müde, mit leeren Gesichtern. Eine alte Frau hält die Hände über einen Becher Tee, als wollte sie sich daran wärmen, aber ihre Finger zittern. Ein Junge schläft im Sitzen.
{ talin_hilft || vardholm_zugang == "talin":
    Talin lässt sich neben dir auf einen Strohsack fallen. „Morgen“, sagt er, „nehmen sie uns nicht einen Funken. Morgen nehmen sie alles, was wir haben. Für die Vorführung. Hat der Schreiber gesagt.“ Er reibt sich die Augen. „Und danach dürfen wir uns ausruhen. Eine Woche. Dann geht es wieder.“
}
{ yrsa_in_vardholm:
    Yrsa lädt ihre Körbe ab, langsam, Stück für Stück. Dabei sieht sie sich alles genau an. Als sie an dir vorbeigeht, flüstert sie: „Die Körbe gehen in eine Halle unter dem Nordturm. Heute Nacht schläft dort nur ein Wächter. Und der schnarcht.“
}

Über dem Hof ragt der höchste Turm in den Nachthimmel. Ganz oben glänzt das riesige Auge, das du von der Straße aus gesehen hast. Von nahem ist es ein Spiegel. Rund, aus Glas und Bronze, so groß wie ein Mühlrad. Von ihm aus laufen dicke Bronzeröhren an der Turmwand hinunter und verschwinden im Boden.

Unter dem Nordturm.
* [Heute Nacht in die Halle unter dem Nordturm schleichen (Geschick)]
    ~ temp e = probe(geschick)
    ~ probe_zeile("Geschick", e)
    -> halle(e)
* {kann_zaubern(0) && element == "wind"} [Den Wind bitten, alle Fackeln im Gang auszublasen, während du hindurchschlüpfst (Zauber)]
    ~ temp z = zauber(0)
    ~ probe_zeile("Zauber", z)
    -> halle(z)
* {kann_zaubern(0) && element == "feuer"} [Die Fackeln im Gang klein und dunkel brennen lassen (Zauber)]
    ~ temp z2 = zauber(0)
    ~ probe_zeile("Zauber", z2)
    -> halle(z2)
* {kann_zaubern(1) && element == "erde"} [Den Steinboden bitten, deine Schritte zu schlucken (Zauber)]
    ~ temp z3 = zauber(1)
    ~ probe_zeile("Zauber", z3)
    -> halle(z3)
* {kann_zaubern(0) && element == "wasser"} [Nebel aus dem Brunnen im Hof aufsteigen lassen (Zauber)]
    ~ temp z4 = zauber(0)
    ~ probe_zeile("Zauber", z4)
    -> halle(z4)

= halle(e)
{ e == KEINE_KRAFT:
    Deine Kraft ist zu schwach. Du musst schleichen wie alle anderen.
}
{ e == MISSERFOLG:
    -> pell
}
-> kugelhalle

= pell
Du bist fast an der Treppe zum Nordturm, als eine Tür aufgeht. Ein dünner Mann mit Brille tritt heraus, eine Kerze in der Hand, im Schlafrock.

Magister Pell.

Er sieht dich. Du siehst ihn. Eine lange Sekunde lang sagt keiner von euch etwas.

„Du bist das Kind“, sagt Pell schließlich. „Das Kind vom Obstkarren. Vom Färberturm. Von dem {freund()} jeden Abend erzählt.“ Er seufzt, so tief, dass die Kerze flackert. „{fr_ist_m():Er|Sie} redet von nichts anderem. Ich höre seit Wochen nur deinen Namen und Wörter wie ‚Abenteuer‘ und ‚Gerechtigkeit‘.“

Er schaut den Gang hinauf, dann hinunter. „Ich habe dich nicht gesehen“, sagt er. „Ich habe heute Nacht überhaupt nichts gesehen. Ich bin ein alter Mann mit schlechten Augen.“ Er geht zurück in sein Zimmer. Bevor die Tür zufällt, hörst du ihn murmeln: „Rechenstunde. Ich wollte doch nur Rechenstunde geben.“
-> kugelhalle

= kugelhalle
~ kugelhalle_gesehen = true
# bild: szene/kugelhalle
Die Halle unter dem Nordturm ist in den Fels gehauen, lang und hoch wie eine Kirche. Und sie ist voller Licht.

Regale, vom Boden bis zur Decke, Reihe um Reihe. In den Regalen eiserne Körbe, Yrsas Körbe, Tausende. Und in jedem Korb eine Kugel aus Glas, so groß wie ein Apfel, und in jeder Kugel ein Licht. Braun wie Erde. Blau wie Wasser. Rot wie Glut. Weiß wie Wind. Sie flackern, als wollten sie hinaus.

Und sie summen. Tausende kleine Stimmen, ganz leise, durcheinander. Wie ein Schwarm Bienen in einem Glas.

Am Ende der Halle führen die Bronzeröhren in die Decke, hinauf zum Spiegel.
{ neumond_funke:
    Als du an einem Regal vorbeigehst, wird eine der Kugeln plötzlich heller. {element == "erde":Braun}{element == "wasser":Blau}{element == "feuer":Rot}{element == "wind":Weiß}. Sie flackert dir entgegen wie ein Hund, der seinen Besitzer erkennt.
    Dein Funke. Der, den sie dir an Neumond genommen haben.
}
Ein Wächter schläft auf einem Stuhl neben der Tür und schnarcht.
-> arbeitszimmer

= arbeitszimmer
~ werk_gesehen = true
# bild: szene/modell-des-walls
Neben der Halle steht eine Tür einen Spalt offen. Dahinter ein Arbeitszimmer mit Karten an den Wänden, und auf einem großen Tisch steht ein Modell aus Holz und Glas.

Es ist Lysmara. Der Hafen, der Markt, das Räderviertel, alles winzig klein und genau. Und über dem Hügel der Oberstadt, nur über der Oberstadt, wölbt sich eine Glocke aus dünnem Glas. Ein zweites, kleineres Modell zeigt Vardholm, ebenfalls unter einer Glocke.

Der Hafen liegt außerhalb der Glocke. Der Markt. Das Räderviertel. Das Zwergenviertel. {zuhause() == "in die Garküche am Fischmarkt":Der Fischmarkt, wo Mutter Kessels Garküche steht.|Fast die ganze Stadt.}

Neben dem Modell liegt ein Blatt, in einer schönen, sauberen Schrift: „Die Kraft reicht für die Oberstadt und Vardholm. Für mehr reicht sie nicht. Wir können nicht alle retten. Also retten wir die, die die Stadt am Leben halten. S. A.“

Du stehst lange vor dem Modell. Dann schleichst du zurück in den Hof und liegst die ganze Nacht wach.
->->


=== p6_wahrheit
# bild: entdeckung/vorfuehrung-{freund_kurz()}
Am Abend des nächsten Tages ist der Hof von Vardholm voller Fackeln.

Auf einer Tribüne vor dem Turm sitzen die Mächtigen von Lysmara. Ratsherren mit Pelzkragen. Kettrich mit seiner Dreifachbrille. Meister Orwin, der wie immer etwas zeichnet. Meisterin Ambra, die aussieht, als hätte sie den Zirkel nur widerwillig verlassen. Hauptmann Strell steht an der Treppe, die Hände hinter dem Rücken.

Vor der Tribüne, in langen Reihen, stehen die Eingeschriebenen. Vor jedem von ihnen ragt eine Bronzeplatte aus dem Boden, und von jeder Platte führt ein dünnes Rohr zum Turm.
{ magie_registriert == "waage":
    Auch vor dir. Ein Söldner schiebt dich an deinen Platz.
}

Dann steigt eine große Frau in Schwarz auf die Tribüne. Die goldene Kette mit der kleinen Waage glänzt im Fackellicht. Neben ihr der Mann mit den grauen Schläfen. Und hinter ihnen, in einer dunkelgrünen Samtjacke mit Goldknöpfen, an der einer fehlt: {freund()}.

„Freunde“, sagt Seraphine Arvelle, und ihre sanfte Stimme trägt über den ganzen Hof. „Etwas kommt über die Berge. Die Dörfer jenseits des Kamms sind leer. Die Gnolle fliehen. Und wir werden nicht warten, bis es an unsere Türen klopft.“

Sie hebt die Hand zum Turm. „Das ist das Werk. Ein Wall aus der Kraft der Elemente. Unsichtbar, undurchdringlich. Heute zeigen wir Ihnen, was er kann.“

Dann legt sie {freund()} eine Hand auf die Schulter. „Und ich möchte Ihnen jemanden vorstellen, der eines Tages die Waage führen wird. {fr_ist_m():Mein Sohn|Meine Tochter}. {freund()} Arvelle.“
~ wahrheit_freund = true

Applaus.

{freund()} steht da, gerade, steif, und sucht mit den Augen den Hof ab. Bis {fr_er()} dich findet.

Einen Herzschlag lang sieht {fr_er()} dich an. Dann senkt {fr_er()} den Blick.
-> vorfuehrung

= vorfuehrung
„Rufer“, sagt Seraphine. „Die Hände auf die Platten.“

Die Eingeschriebenen legen die Hände auf die Bronze. Ein Summen geht durch den Hof, dann ein Ziehen, das du bis in die Zähne spürst. Aus den Händen der Rufer fließt Licht in die Platten, braun, blau, rot, weiß, durch die Röhren hinauf zum Turm, und tief unten in der Halle singen tausend Kugeln mit.
{ magie_registriert == "waage":
    Auch du legst die Hände auf die Platte. Du musst. Und du spürst, wie es zieht. Nicht ein Funke. Viel mehr. Dir wird schwarz vor Augen, und als du wieder sehen kannst, kniest du auf dem Pflaster.
    ~ kraftfunken = 0
}

Der Spiegel auf dem Turm beginnt zu leuchten. Er dreht sich, langsam, und dann breitet sich von ihm etwas aus. Eine Kuppel aus Licht, durchsichtig wie Seifenblasenhaut, die sich über die ganze Festung wölbt. Sie schimmert in allen vier Farben.

Die Ratsherren springen auf und klatschen. Kettrich nimmt die Brille ab. Ambra murmelt etwas, das wie ein Fluch klingt.

Und in den Reihen der Eingeschriebenen sinken Menschen auf die Knie. Eine alte Frau kippt zur Seite. {talin_hilft:Talin fängt sie auf, bevor sie auf das Pflaster schlägt. Er selbst ist grau im Gesicht.}

Die Kuppel hält vier Atemzüge lang. Dann verblasst sie.

„Eine erste Probe“, sagt Seraphine. „Mit allen Kugeln werden es Tage sein. Wochen.“

Wieder Applaus. Lauter diesmal.
-> gespraech

= gespraech
# bild: szene/hinter-dem-stall-{freund_kurz()}
Später, als die Mächtigen zum Festmahl in die große Halle gehen, zieht dich jemand hinter den Stall.

{freund()}. Ohne die Samtjacke, nur im weißen Hemd. Die Augen rot.

„Ich wollte es dir sagen“, sagt {fr_er()} sofort. „Tausendmal. Am Brunnen. Auf den Weiden. In dem Brief. Jedes Mal hab ich den Mund aufgemacht und nichts kam raus.“
* [„Du hast mich die ganze Zeit angelogen.“]
    ~ aendern(beziehung_freund, -1)
    {freund()} zuckt zusammen, als hättest du {fr_ihn()} geschlagen. „Ja“, sagt {fr_er()} leise. „Hab ich.“ {Fr_er()} wischt sich über die Augen. „Nicht über alles. Nicht darüber, dass ich dich gern hab. Nur über das.“
* [„Ich hab es mir gedacht. Seit dem Goldknopf.“]
    ~ aendern(beziehung_freund, 1)
    {freund()} lacht, halb erstickt. „Natürlich hast du das“, sagt {fr_er()}. „Du hast gute Augen. Hat dir mal jemand gesagt, oder?“
* [Nichts sagen. Einfach zuhören.]
    {freund()} redet. Von einem Haus mit hundert Zimmern, in denen nie jemand lacht. Von einer Mutter, die immer recht hat. Von einem Vater, der Zahlen mehr liebt als Menschen. „Und dann bist du aus dem Nichts gekommen“, sagt {fr_er()}, „und ich bin vom Baum gefallen. Und das war der beste Tag meines Lebens.“
- -> wahrheit_berg

= wahrheit_berg
Dann erzählst du {fr_ihm()} vom Berg.

Vom Herz aus Kristall mit den vier Lichtern. Vom Riss. Vom Stollen, mit Spitzhacken gehauen, und den Kisten mit dem Kreidezeichen der Waage. Vom Grauen, das aus dem Riss sickert.
{ herzsplitter:
    Du holst den Splitter aus der Tasche und wickelst ihn aus dem Tuch. Er summt. In ihm kreisen vier winzige Lichter. {freund()} starrt darauf.
}
{ werk_gesehen:
    Und vom Modell im Arbeitszimmer. Von der Glocke aus Glas, die nur über der Oberstadt steht.
}

{freund()} ist sehr still geworden. Weiß wie die Wand des Stalls.

„Sie weiß es nicht“, flüstert {fr_er()}. „Ich schwöre, sie weiß es nicht. Sie glaubt, es kommt über die Berge. Sie hat das Stimmerz bestellt, weil die Kugeln sonst nicht halten. Sie hat nie gefragt, wo es herkommt. Sie fragt nie, wo etwas herkommt. Nur, was es kostet.“

{ not werk_gesehen:
    ~ werk_gesehen = true
    {Fr_er()} schluckt. „Und der Wall … der reicht nicht für alle. Sie hat es selbst gesagt, beim Abendessen. ‚Wir können nicht alle retten. Also retten wir die, die die Stadt am Leben halten.‘ Die Oberstadt. Nur die Oberstadt.“
}

{freund()} sieht dich an. „Was machen wir jetzt?“
->->
