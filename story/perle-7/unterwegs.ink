// =====================================================================
// Perle 7 – Unterwegs jenseits der Berge: Nachtlager, die Gnomenfamilie,
// der Markt von Dornfurt und die Lärmwache (Erweiterung 14.10.2026)
// =====================================================================

=== p7_lager
Die Nacht verbringst du in einer leeren Scheune am Rand eines Birkenwalds. Das Dach hat Löcher, durch die man die Sterne sieht. Andere Sterne als zu Hause, kommt es dir vor. Oder dieselben, nur von der anderen Seite.

Du machst ein kleines Feuer aus trockenen Ästen.{element == "feuer": Du brauchst dafür keinen Feuerstein.}
{ freund_kommt_mit:
    -> mit_freund
}
-> allein

= mit_freund
{freund()} sitzt dir gegenüber, die Knie unter dem Kinn, und starrt in die Flammen. Eine Weile sagt keiner etwas.

„Darf ich dich was fragen?“, sagt {fr_er()} dann. „Hast du manchmal Angst?“
* [„Ständig. Aber ich gehe trotzdem.“]
    ~ aendern(beziehung_freund, 1)
    ~ lager_antwort = "angst"
    {freund()} nickt langsam. „Gut“, sagt {fr_er()}. „Ich dachte schon, ich bin {fr_ist_m():der Einzige, der|die Einzige, die} dauernd Angst hat.“
* [„Nein. Angst bringt einen nicht weiter.“]
    ~ lager_antwort = "mut"
    „{geschlecht == "w":Lügnerin|Lügner}“, sagt {freund()} freundlich. „Ich hab dich in Vardholm gesehen, in der Nacht. Deine Knie haben gezittert.“
    Du willst widersprechen. Dann musst du lachen.
* [Statt zu antworten, ein Holzscheit nachlegen]
    ~ lager_antwort = "holz"
    Du legst ein Scheit nach. Die Funken steigen auf, durch das Loch im Dach, zu den Sternen. {freund()} sieht ihnen nach.
    „Schon gut“, sagt {fr_er()}. „Ich weiß die Antwort sowieso.“
-
{ wahrheit_freund:
    „Weißt du, was komisch ist?“, sagt {freund()}. „Zu Hause hatte ich ein Zimmer mit einem Himmelbett und drei Kissen. Und ich hab nie so gut geschlafen wie in dieser kaputten Scheune.“
}
-> wache

= allein
Du bist allein. Zum ersten Mal, seit du aus Lysmara aufgebrochen bist, ist niemand da, der redet.

Du ziehst {kompass:Tickworts Kompass|dein Buch} aus der Tasche. {kompass:Die Nadel zittert und zeigt nach Westen, zurück über die Berge, genau dorthin, wo {bp()} jetzt vielleicht am Fenster steht.|Du blätterst durch die Seiten. Die erste Karte von Lysmara. Sie ist wirklich nicht schön. Aber sie ist deine.}
* [An zu Hause denken]
    Du denkst an {zuhause()}. An den Geruch, an die Geräusche, an {bp()}, wie {bp_er()} dir das Seil in die Hand gedrückt hat. Es tut ein bisschen weh. Aber es ist die gute Art von Wehtun.
* [An das denken, was vor dir liegt]
    Du denkst an das Herz im Berg. An das Schweigen. An den Fremden im grauen Mantel, der vielleicht mehr weiß als alle anderen. Dein Bauch kribbelt. Angst oder Vorfreude, das kann man bei manchen Gefühlen nicht auseinanderhalten.
-
-> wache

= wache
Das Feuer brennt herunter. Draußen ist es still. Zu still?
* [Wach bleiben und das Feuer hüten]
    Du bleibst wach. Die Stunden kriechen. Irgendwann, kurz nach Mitternacht, siehst du es: Am Waldrand verliert das Gras seine Farbe. Ein grauer Streifen, der langsam über die Wiese auf die Scheune zukriecht.
    Du wirfst alles Holz ins Feuer, das du hast. Die Flammen prasseln und knacken. {element == "erde":Du lässt den Boden unter der Scheune brummen.}{element == "wasser":Du lässt den Bach hinter der Scheune laut rauschen.}{element == "feuer":Du lässt das Feuer so laut fauchen wie eine Esse.}{element == "wind":Du lässt den Wind durch die Löcher im Dach pfeifen.} Das Graue bleibt am Waldrand stehen. Es wartet eine Weile. Dann zieht es sich zurück.
    Am Morgen bist du todmüde. Aber {freund_kommt_mit:ihr seid|du bist} noch da.
* [Schlafen. Du kannst nicht mehr.]
    Du rollst dich neben der Glut zusammen und schläfst sofort ein.
    { ziege_folgt:
        Mitten in der Nacht weckt dich ein empörtes Meckern. Die Ziege aus dem leeren Dorf steht in der Scheunentür und schreit, so laut sie kann. Hinter ihr, am Waldrand, kriecht ein grauer Streifen über die Wiese.
        Du springst auf, wirfst Holz ins Feuer, rufst, klatschst. Die Ziege meckert dazu. Das Graue zögert. Dann zieht es sich zurück.
        Die Ziege sieht dich an, als wollte sie sagen: Siehst du. Ich bin nützlich.
    - else:
        {
        - freund_kommt_mit:
            Mitten in der Nacht rüttelt dich jemand an der Schulter. {freund()}. „Wach auf! Da draußen!“ Am Waldrand kriecht ein grauer Streifen über die Wiese. Ihr werft alles Holz ins Feuer und singt, so laut und falsch ihr könnt, bis das Graue sich zurückzieht.
        - tickwort_pfeife:
            Mitten in der Nacht wachst du auf, weil es zu still ist. Am Waldrand kriecht ein grauer Streifen über die Wiese. Du greifst nach Tickworts Pfeife und bläst hinein. Zehn Ziegen. Das Graue zuckt zusammen und kriecht zum Waldrand zurück.
        - else:
            Als du aufwachst, ist der Rand deiner Decke grau. Nur ein Zipfel. Die Glut im Feuer knackt noch ein letztes Mal, laut wie ein Peitschenknall, und das Graue zieht sich zurück, ganz langsam, über die Wiese bis zum Waldrand.
            Du sitzt lange da und schläfst nicht mehr ein. Das war knapp.
            ~ p7_erschoepft = true
        }
    }
-
->->


=== p7_strasse
Danach folgst du einem Weg nach Osten, zum Fluss. Gegen Mittag hörst du ein Geräusch, das hier draußen nicht hergehört. Ein Weinen.

Auf dem Weg steht ein Dampfkarren, schief, mit einem Rad im Graben. Davor sitzt eine Gnomenfamilie: ein Vater mit verrußter Schutzbrille, eine Mutter mit einem Säugling im Tuch, und ein Mädchen, vielleicht sieben, das sich die Augen reibt. Der Kessel des Karrens ist kalt. Kein Zischen, kein Pfeifen, nichts.

„Er ist ausgegangen“, sagt der Vater. Seine Stimme zittert. „Mitten auf dem Weg. Und ohne den Kessel ist es so still. Wir hatten ihn nur, damit es laut ist, verstehst du? Seit dem Grauen fahren alle mit lauten Karren.“

Das Mädchen sieht dich an. „Kannst du ihn wieder laut machen?“
* {kann_zaubern(0)} [Mit {element_dativ(element)} helfen (Zauber)]
    ~ temp z_karren = zauber(0)
    ~ probe_zeile("Zauber", z_karren)
    { element:
    - "feuer":
        Du legst die Hand an den Kessel und rufst die Glut darin.
    - "wasser":
        Der Kessel ist leer, das Wasser ist verdampft. Du rufst das Wasser aus dem Graben herauf, in den Kessel hinein.
    - "erde":
        Du bittest den Boden, das Rad aus dem Graben zu heben.
    - else:
        Du schickst einen Windstoß in die Feuerkammer, wie einen riesigen Blasebalg.
    }
    -> karren_ergebnis(z_karren, element == "erde")
* [Den Kessel untersuchen. Gnome bauen nie etwas ohne Trick (Verstand)]
    ~ temp e_karren = probe(verstand)
    ~ probe_zeile("Verstand", e_karren)
    Du kniest dich neben den Kessel. Rohre, Ventile, ein roter Griff, ein kleines Rad mit Zähnen.
    -> karren_ergebnis(e_karren, false)
* [Den Karren aus dem Graben schieben (Kraft)]
    ~ temp k_karren = probe(kraft)
    ~ probe_zeile("Kraft", k_karren)
    Du stemmst dich mit der Schulter gegen den Karren.
    -> karren_ergebnis(k_karren, true)

= karren_ergebnis(e, ruck)
{ e:
- ERFOLG:
    ~ gnomfamilie_geholfen = true
    {ruck:Mit einem Ruck springt das Rad aus dem Graben, und der Stoß rüttelt den Kessel wach. }Es zischt. Es pfeift. Der Kessel spuckt eine Dampfwolke aus{ruck:.|, und das Rad springt mit einem Ruck aus dem Graben.} Das Mädchen kreischt vor Freude, und der Säugling, der bis eben geschlafen hat, kreischt mit.
    „Wir nehmen dich mit!“, ruft der Vater. „Bis Dornfurt! Rauf mit dir!“
    Den Rest des Weges sitzt du hinten auf dem Karren, zwischen Kisten und Kochtöpfen, und das Mädchen erklärt dir jedes Ventil einzeln. Es erinnert dich an jemanden.
- JA_ABER:
    ~ gnomfamilie_geholfen = true
    {ruck:Der Karren ruckt aus dem Graben, und der Stoß rüttelt den Kessel wach. }Es zischt, es pfeift, der Karren kommt frei. Aber das Ventil pfeift jetzt dauernd, schrill und hoch, und es lässt sich nicht mehr abstellen.
    „Perfekt“, sagt der Vater und strahlt. „Lauter geht's nicht.“
    Ihr fahrt zusammen nach Dornfurt. Dir klingeln danach noch zwei Stunden die Ohren.
- else:
    Es knackt, es klonkt, und es passiert nichts. Der Vater seufzt.
    Dann zieht das Mädchen an deinem Ärmel. „Wir können ja zusammen laut sein“, sagt sie. „Bis Dornfurt.“
    Und so geht ihr zu Fuß, neben dem Karren, den ihr gemeinsam schiebt, und singt dabei alle Lieder, die ihr kennt. Die Gnomenlieder sind sehr lang und haben sehr viele Strophen über Zahnräder.
    ~ gnomfamilie_geholfen = true
    ~ p7_erschoepft = true
}

Gegen Abend siehst du die Stadt am Fluss. Und du hörst sie, lange bevor du sie erreichst.
->->


=== p7_markt
Auf dem Marktplatz ist gerade eine Karawane angekommen. Ochsenkarren, beladen mit Fässern und Fellen, und daneben Orks, groß und staubig, mit Trommeln auf dem Rücken. Und Trolle, lang und dünn, die auf den Wagen sitzen und mit den Beinen baumeln.
{ volk == "ork" || volk == "troll":
    Ein alter Ork mit grauem Zopf sieht dich und legt die Faust auf die Brust. „Ein Gesicht aus den Clans! So weit im Westen!“ Er zieht dich zu seinem Feuer, und schon hast du einen Becher heißen Gewürztee in der Hand, der nach Grumaks Stand riecht.
- else:
    Ein alter Ork mit grauem Zopf nickt dir zu, als du stehen bleibst. „Neugierig?“, brummt er. „Gut. Neugierige leben länger. Komm ans Feuer.“
}

„Aus Kar Duun“, erzählt der Ork. „Drei Wochen unterwegs. Die Dörfer dazwischen sind leer, alle. Wir haben die ganze Zeit getrommelt, Tag und Nacht. Abwechselnd.“ Er zeigt auf einen jungen Troll, der mit verbundenen Händen auf einem Wagen sitzt. „Der da hat zwei Nächte durchgetrommelt. Ein Held. Ein Held mit Blasen.“

Der junge Troll winkt dir müde mit seinem Verband zu.
* [Fragen, ob in Kar Duun jemand das Schweigen versteht]
    Der Ork kratzt sich am Kinn. „Verstehen? Nein. Aber in Kar Duun sagen die Alten, es gab das schon einmal. Vor sehr langer Zeit. Und damals kamen Leute mit silbernen Augen und haben es aufgehalten.“ Er zuckt mit den Schultern. „Geschichten für Kinder. Sagen die Jungen.“
    Silberne Augen. Du denkst an einen Mantel im Regen.
* [Fragen, wie es östlich von Kar Duun aussieht]
    „Wer weiß das schon“, sagt der Ork. „Da kommt keiner mehr her. Früher kamen Händler aus den Ebenen, mit Pferden und Seide. Seit dem Frühling kommt niemand.“ Er sieht in sein Feuer. „Niemand. Das ist das Schlimmste. Wenn ein Weg leer bleibt.“
* [Dem jungen Troll mit den Blasen etwas Gutes tun]
    { element == "wasser":
        Du rufst kühles Wasser aus deinem Schlauch über seine Hände. Der Troll seufzt so tief, dass seine langen Ohren flattern.
    - else:
        Du holst am Brunnen einen Eimer kaltes Wasser, und der Troll hält seine Hände hinein. Er seufzt so tief, dass seine langen Ohren flattern.
    }
    „Danke“, sagt er. „Morgen trommle ich wieder. Aber heute nicht. Heute nicht.“
-
{ gnomfamilie_geholfen:
    Am anderen Ende des Marktes steht der Dampfkarren der Gnomenfamilie und pfeift fröhlich vor sich hin. Das kleine Mädchen sitzt oben auf dem Kessel und winkt dir mit beiden Armen.
}
-> laermwache

= laermwache
Als die Sonne untergeht, passiert etwas Merkwürdiges. Überall in der Stadt kommen Kinder aus den Häusern, mit Töpfen, Löffeln, Rasseln und Trillerpfeifen. Sie laufen zum Zaun aus Pfählen und stellen sich in einer langen Reihe auf.

„Die Lärmwache“, erklärt dir ein Junge mit einem Kochtopf auf dem Kopf. „Jeden Abend, eine Stunde lang. Damit es weiß, dass wir hier sind. Machst du mit?“
* [Mitmachen. Mit allem, was du hast.]
    Du stellst dich in die Reihe. Neben dir trommelt ein Zwergenmädchen auf einen Eimer, auf der anderen Seite rasselt ein Gnom mit einer Dose voller Schrauben.
    Und dann rufst du {element_artikel(element)}. Nicht stark, nur ein bisschen. {element == "erde":Die Pfähle des Zauns summen wie Orgelpfeifen.}{element == "wasser":Der Fluss hinter der Stadt rauscht auf, als würde er mitsingen.}{element == "feuer":Die Fackeln am Zaun flammen hell auf und knistern im Takt.}{element == "wind":Der Wind fährt pfeifend durch die Gassen und lässt alle Glocken auf einmal läuten.}
    Die Kinder neben dir hören auf zu trommeln. Einen Moment lang ist es fast still. Du ziehst den Kopf ein. In Lysmara würden jetzt Söldner kommen. Hier nicht.
    Hier jubeln sie.
    „{geschlecht == "w":Eine Ruferin|Ein Rufer}!“, schreit der Junge mit dem Topf. „Wir haben {geschlecht == "w":eine Ruferin|einen Rufer}!“ Und dann trommeln sie alle doppelt so laut.
    Zum ersten Mal in deinem Leben schämst du dich nicht für deine Gabe. Und du musst sie nicht verstecken. Hier ist sie einfach ein Geschenk.
* [Lieber zuschauen. Du bist zu müde.]
    Du setzt dich auf eine Kiste und schaust zu. Eine Stunde lang trommeln, rasseln, pfeifen und schreien die Kinder von Dornfurt gegen die Nacht. Es ist der schönste Lärm, den du je gehört hast.
    Ganz am Ende des Zauns, im Schatten, steht eine große, schlanke Gestalt im grauen Mantel und hört auch zu. Als du genauer hinsiehst, ist sie fort.
-
->->


// ---------------------------------------------------------------------
// Lysmara: Was sich verändert hat (Folgen aus Perle 6)
// ---------------------------------------------------------------------
=== p7_marktplatz
Auf dem Marktplatz bleibst du stehen. Etwas ist anders.
{ funken_frei:
    Am Marktbrunnen sitzt ein alter Mann und lässt Wassertropfen über die Steine hüpfen, und ein paar Kinder klatschen. Eine Bäckerin hat ihr Brot heute ohne Ofen gebacken, erzählt man sich, nur mit den Händen. Die Leute schauen zu. Manche misstrauisch. Die meisten neugierig.
    Die Funken sind nach Hause gekommen. Und ihre Besitzer verstecken sie nicht mehr.
- else:
    Am Marktbrunnen stehen zwei Söldner der Waage und sehen den Leuten auf die Hände. Eine Frau zieht ihre Tochter weg, als das Mädchen eine Pfütze zum Glitzern bringen will. „Nicht hier“, zischt sie. „Nicht hier, wo sie es sehen.“
    In Lysmara versteckt man seine Gabe immer noch.
}
{ waage_gestuerzt:
    An der Ratshalle hängt ein neuer Aushang mit dem Siegel der Stadt. Ein Ausrufer liest ihn vor, und die Menge wird immer stiller, je weiter er kommt: Das Magiergesetz ist ausgesetzt. Die Festung Vardholm untersteht dem Rat. Die Schlucht wird geöffnet, für alle, die einen Passierschein haben.
    Ganz hinten in der Menge brüllt jemand: „Na endlich!“ Es klingt sehr nach einem Ork.
- else:
    { seraphine_einsicht:
        An der Ratshalle hängt ein neuer Aushang mit dem Zeichen der Waage. Ein Ausrufer liest ihn vor: Die Waage hebt das Register auf. Wer eingeschrieben war, ist frei. Die Leute sehen einander an, als hätten sie sich verhört.
    - else:
        An der Ratshalle hängt immer noch der alte Aushang: Das Magiergesetz. Jemand hat mit Kreide vier kleine verschlungene Ringe daneben gemalt. Niemand hat sie weggewischt.
    }
}
{ von_waage_notiert && not (waage_gestuerzt || seraphine_einsicht):
    Ein Söldner sieht in deine Richtung. Du ziehst die Kapuze tiefer und gehst schneller.
}
->->


// ---------------------------------------------------------------------
// Dornfurt: Das Lager der Gnolle (am zweiten Tag)
// ---------------------------------------------------------------------
=== p7_gnolllager
Am Mittag gehst du hinunter zum Fluss, wo die Gnolle ihr Lager haben. Zelte aus Fell, ein Feuer, Kinder, die im seichten Wasser nach Fischen schnappen. Die Leute von Dornfurt lassen sie in Ruhe. Hier draußen hat jeder etwas verloren.
{
- gnollstein:
    Kaum bist du zwischen den Zelten, als ein alter Gnoll den Stein an deinem Hals sieht. Er bleibt stehen und bellt etwas nach hinten. Im nächsten Augenblick bist du umringt.
    „Ashkas Stein“, sagt der Alte und berührt ihn vorsichtig mit einer Kralle. „Ashka ist meine Schwester. Sie ist über die Berge gegangen, im Frühling, mit den Jungen. Wir haben nie wieder von ihr gehört.“
    Du erzählst. Von der Schlucht über Ginsterhof, vom Lager, {wuk_gerettet:von Wuk,} von der Nacht, in der ihr zusammen das Graue zurückgedrängt habt.
    Der alte Gnoll schweigt lange. Dann legt er den Kopf in den Nacken und heult. Nicht traurig. Erleichtert. Und das ganze Lager heult mit.
    „Sie lebt“, sagt er schließlich. „Du hast uns das Beste gebracht, was man bringen kann.“ Er drückt dir eine Kette aus Knochenperlen in die Hand. „Für den Weg nach Osten. Jeder Gnoll dort wird wissen, dass du {geschlecht == "w":eine Freundin|ein Freund} bist.“
- gnolle_verraten:
    Die Gnolle sehen dich kommen. Einer von ihnen schnüffelt, legt die Ohren an und knurrt leise. Sie kennen deinen Geruch, von irgendwoher. Vielleicht vom Wind, der über die Berge geht. Vielleicht ist das auch nur dein schlechtes Gewissen.
    Du bleibst am Rand des Lagers stehen. Niemand kommt zu dir. Nach einer Weile gehst du wieder.
- gnolle_geholfen || gnolle_vermittelt:
    Ein junger Gnoll sieht dich und kommt neugierig näher. Als du ihm von Ashka erzählst und vom Lager über Ginsterhof, reißt er die Augen auf und rennt los, um es den anderen zu sagen.
    Bald sitzt du am Feuer, mit einer Schale Fischsuppe, die nach Rauch und Kräutern schmeckt, und erzählst die Geschichte noch dreimal. Beim dritten Mal heulen die Gnolle an den spannenden Stellen mit.
- else:
    Eine alte Gnollin sitzt am Ufer und flickt ein Netz. Als du dich zu ihr setzt, rückt sie ein Stück zur Seite.
    „Wir sind vor dem Hrrsh geflohen“, sagt sie, ohne aufzusehen. „So nennen wir das Graue. Hrrsh. Das Geräusch, das es nicht macht.“ Sie zieht einen Knoten fest. „Unsere Alten sagen, es kommt aus dem Boden. Wie Wasser aus einer Quelle. Niemand glaubt ihnen.“
    Du denkst an das Herz im Berg. An den Riss. Du glaubst ihnen.
}
->->
