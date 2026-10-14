// =====================================================================
// Perle 4 – Aufbruch am Landtor und der Weg über die Weiden
// =====================================================================

=== p4_aufbruch
# bild: szene/landtor-morgen
# karte: spaltstrasse
Am Morgen nach dem Gildentag stehst du am Landtor. Hinter dir liegt Lysmara, laut und eng. Vor dir liegt die Spaltstraße, ein heller Strich, der sich zwischen grünen Hügeln nach Osten zieht, bis zu den grauen Bergen.

Du warst noch nie so weit draußen. Nicht allein.
{
- erster_auftrag == "wollmark":
    In deiner Tasche steckt Kettrichs Brief an die Wollhändler von Wollmark. Am Revers glänzt das Abzeichen mit dem Webschiffchen.
- erster_auftrag == "weiden_karte":
    In deiner Tasche stecken Orwins alte Karte der Weiden, ein neues Zeichenheft und drei gespitzte Kohlestifte. Die silberne Feder am Kragen fängt die Morgensonne.
- erster_auftrag == "mondklee":
    Über deiner Schulter hängt ein leerer Korb für den Mondklee, und in deiner Tasche gluckert ein Fläschchen Leuchttrank. Um den Hals trägst du das winzige Fläschchen der Phiole.
- erster_auftrag == "ginsterhof":
    Unter deiner Jacke, eng am Futter mit dem eingenähten Zeichen, steckt Finks Päckchen für Ginsterhof.
- erster_auftrag == "waage_wollmark":
    -> waagen_wagen_start
- else:
    Du hast keinen Auftrag, keine Gilde und keinen Plan. Nur eine Frage: Wenn die Gnolle hereingekommen sind, gibt es einen Weg hinaus.
}
-> freund_am_tor

= waagen_wagen_start
~ waagen_wagen = true
Am Tor wartet ein schwerer Planwagen mit vier Pferden. Auf der Plane prangt die goldene Waage. Ein Fuhrmann mit Pfeife sitzt auf dem Bock, zwei Söldner sitzen hinten auf der Ladung.

„Du bist der Rufer?“, fragt einer und sieht auf deine Messingplakette. „Steig ein. Vorne, beim Fuhrmann. Und fass die Ladung nicht an.“
-> freund_am_tor

= freund_am_tor
{ waagen_wagen:
    Gerade als der Wagen anrollt, rennt jemand hinter dem Tor hervor, in einer viel zu großen Arbeiterjacke, eine Mütze tief im Gesicht, und springt mit einem Satz hinten auf die Deichsel des Wagens. Die Söldner dösen. Niemand merkt etwas.
    Erst hinter der ersten Kurve klettert die Gestalt über die Plane nach vorn und lässt sich neben dich auf den Bock fallen. Der Fuhrmann zieht nur die Augenbrauen hoch und pafft weiter.
- else:
    Gerade als du losgehen willst, ruft jemand hinter dir deinen Namen.
    Jemand in einer viel zu großen Arbeiterjacke, eine Mütze tief im Gesicht. Und Schuhe aus feinstem Leder mit silbernen Schnallen.
}
# bild: figur/freund-verkleidet-{freund_kurz()}
„Glaubst du wirklich, ich lasse dich allein auf die Weiden?“, sagt {freund()} und schiebt die Mütze aus der Stirn.
{ magie_registriert == "waage":
    Dann wird {fr_sein()} Blick ernst. „Ich war wütend auf dich. Gestern, am Zelt.“ {Fr_er()} zögert. „Bin ich immer noch ein bisschen. Aber allein lass ich dich trotzdem nicht.“
}
{ beziehung_freund < 0:
    Es klingt fröhlich. Aber {fr_er()} sieht dich dabei nicht ganz an, als wäre zwischen euch noch etwas, das nicht ausgesprochen ist.
}

„Und deine Eltern?“

„Magister Pell glaubt, ich habe Fieber. Ich habe sehr überzeugend gehustet.“ {freund()} hustet zur Vorführung. Es klingt wie ein kranker Seehund. „Bis morgen Abend merkt das keiner.“
* [„Schön, dass du da bist.“]
    ~ aendern(beziehung_freund, 1)
    {freund()} strahlt. „Siehst du. Ich wusste, dass du das sagst.“
* [„Du solltest umkehren. Das ist kein Ausflug.“]
    „Eben“, sagt {freund()}. „Deshalb komme ich ja mit.“ {Fr_er()} verschränkt die Arme. „Du kannst mich nicht wegschicken. Ich hab mehr Übung im Weglaufen als du im Wegschicken.“
* [„Wenn sie dich suchen, kriegen wir beide Ärger.“]
    „Sie suchen mich nicht“, sagt {freund()}. Dann, leiser: „Noch nicht.“
- ->->


=== p4_weg
# bild: entdeckung/weiden
# karte: weiden
Die Weiden sind größer, als du dir vorgestellt hast. Grün, so weit du sehen kannst, Hügel hinter Hügel, durchzogen von Steinmauern, die niemand mehr zählen kann. Schafe, überall Schafe, wie Wolken, die sich ins Gras gelegt haben. Der Wind riecht nach Gras und Regen. Im Osten wächst der Kharvan-Kamm mit jeder Stunde, bis er den halben Himmel füllt.
{ erster_auftrag == "weiden_karte":
    Alle paar hundert Schritte bleibst du stehen und zeichnest. Orwins alte Karte stimmt an vielen Stellen nicht mehr. Hier steht eine neue Mauer, dort ist ein Bach umgeleitet worden.
}
{ waagen_wagen:
    -> wagen
}
-> kontrolle_bruecke

= wagen
Der Wagen rumpelt über die Spaltstraße. Hinten auf der Ladung dösen die Söldner. Unter der Plane klirrt es bei jedem Schlagloch leise, wie Glas.
* [Unter die Plane schauen, während die Söldner schlafen (Geschick)]
    ~ temp e = probe(geschick)
    ~ probe_zeile("Geschick", e)
    { e:
    - ERFOLG:
        ~ kugeln_auf_wagen = true
        Du hebst die Plane einen Fingerbreit an. Darunter stehen Kisten, und in den Kisten, in kleinen eisernen Körben, liegen Glaskugeln. Hunderte. Sie sind leer und glänzen kalt.
        Leer. Noch.
    - JA_ABER:
        ~ kugeln_auf_wagen = true
        Du siehst Glaskugeln in eisernen Körben, Hunderte, leer. Dann knarrt das Brett unter dir. Ein Söldner öffnet ein Auge. Du starrst unschuldig in die Landschaft. Er schließt es wieder.
    - else:
        Du beugst dich nach hinten. Ein Söldner öffnet beide Augen. „Ladung nicht anfassen, hab ich gesagt.“ Er klopft mit dem Knöchel auf die Plane. „Rufer schauen geradeaus.“
    }
* [Den Fuhrmann fragen, was er geladen hat (Ausstrahlung)]
    ~ temp e2 = probe(ausstrahlung)
    ~ probe_zeile("Ausstrahlung", e2)
    { e2 == MISSERFOLG:
        Der Fuhrmann pafft. „Ich fahre“, sagt er. „Ich frage nicht.“
    - else:
        ~ kugeln_auf_wagen = true
        Der Fuhrmann pafft eine Weile. Dann sagt er leise: „Glas. Kugeln. Leer. Zwölfmal bin ich die Strecke schon gefahren. Hin voll mit leeren, zurück leer.“ Er sieht dich von der Seite an. „Die vollen bleiben in Vardholm.“
    }
- Die Söldner erzählen sich unterdessen, was sie in Wollmark erwartet. „Hauptmann Strell jagt da draußen Gnolle“, sagt der eine. „Drei Nächte schon. Und hat noch keinen gefangen.“
„Gnolle gibt's da gar nicht“, sagt der andere. „Die Hirten sehen Gespenster.“
-> lamm

= kontrolle_bruecke
Mittags kommt ihr an eine Steinbrücke über einen Bach. Mitten auf der Brücke steht ein Schlagbaum. Zwei Söldner der Waage lehnen daran und langweilen sich.

{freund()} zieht dich hinter eine Mauer. „Wenn die mich sehen“, flüstert {fr_er()}, „bringen sie mich nach Hause.“

„Warum sollten Söldner der Waage dich nach Hause bringen?“

{freund()} sieht dich an. „Weil sie meine Eltern kennen“, sagt {fr_er()} schließlich. „Alle kennen meine Eltern.“
* [Ein Stück flussaufwärts durch den Bach waten (Geschick)]
    ~ temp e = probe(geschick)
    ~ probe_zeile("Geschick", e)
    { e:
    - ERFOLG:
        Ihr schleicht hinter den Mauern entlang bis zu einer Furt und watet durch das eiskalte Wasser. Niemand sieht euch.
    - JA_ABER:
        Ihr kommt durch die Furt. Leider rutscht {freund()} auf einem Stein aus und sitzt bis zur Brust im Bach. Das Fluchen hört man bis zur Brücke. Zum Glück halten die Söldner es für eine Ente.
    - else:
        Ihr watet durch die Furt. Mitten im Bach rutschst du aus, und dein Platschen hallt bis zur Brücke. „He!“, ruft ein Söldner. Ihr rennt die Böschung hinauf und in die nächste Senke. Er folgt euch nicht. Aber er hat euch gesehen.
        ~ von_waage_notiert = true
    }
* {gilde != "" && gilde != "leise_hand"} [Allein über die Brücke gehen und dein Gildenzeichen zeigen, während {freund()} durch die Furt watet]
    Du gehst allein zur Brücke und zeigst {gilde == "webstuhl_amboss":das Abzeichen mit dem Webschiffchen}{gilde == "weite_feder":die silberne Feder}{gilde == "phiole":das Fläschchen der Phiole}. Die Söldner winken dich durch, ohne aufzusehen. Auf der anderen Seite wartet {freund()}, nass bis zu den Knien, und grinst.
* {kann_zaubern(1) && element == "wasser"} [Den Bach bitten, für einen Moment flach zu werden (Zauber)]
    ~ temp z = zauber(1)
    ~ probe_zeile("Zauber", z)
    { z == MISSERFOLG || z == KEINE_KRAFT:
        Der Bach hört dich nicht, oder er will nicht. Ihr watet trotzdem, und ihr seid danach beide nass bis zum Bauch.
    - else:
        Du legst die Hand ins Wasser. Bitte, denkst du. Und der Bach wird flach und still wie eine Pfütze, gerade so lange, bis ihr trockenen Fußes hinüber seid. Dann rauscht er wieder.
        {freund()} pfeift leise durch die Zähne.
    }
* {kann_zaubern(1) && element == "wind"} [Den Wind bitten, den Söldnern die Hüte vom Kopf zu wehen, während ihr vorbeischlüpft (Zauber)]
    ~ temp z2 = zauber(1)
    ~ probe_zeile("Zauber", z2)
    { z2 == MISSERFOLG || z2 == KEINE_KRAFT:
        Eine Böe fährt über die Weide. Sie weht aber nicht den Söldnern die Hüte vom Kopf, sondern dir die Mütze. Ihr müsst durch die Furt waten und sie aus dem Bach fischen.
    - else:
        Eine Böe fegt über die Brücke und reißt beiden Söldnern die Kappen vom Kopf. Während sie fluchend hinterherrennen, seid ihr längst über die Brücke.
    }
* {hintergrund == "reisender"} [(Reisender) „Hier gibt es einen alten Viehpfad durch die Senke. Maren und ich sind ihn schon gegangen.“]
    Du führst {freund()} hinter den Mauern entlang, durch eine Senke voller Brombeeren und über einen umgestürzten Baumstamm, der quer über dem Bach liegt. Kein Söldner, kein nasser Fuß. Hinter der Brücke kommt ihr wieder auf die Straße, als wärt ihr nie weg gewesen.
    {freund()} sieht dich mit großen Augen an. „Woher weißt du so was?“
    „Maren sagt: Jede Straße hat eine kleine Schwester, die keiner kennt.“
* [Warten, bis die Söldner Wachwechsel haben]
    Ihr wartet hinter der Mauer. Eine Stunde. Zwei. Endlich kommt die Ablösung, und im Durcheinander schlüpft ihr vorbei. Aber die Sonne steht schon tief, als ihr weitergeht.
- -> lamm

= lamm
# bild: szene/lamm-auf-der-strasse-{freund_kurz()}
Am Nachmittag steht ein Lamm mitten auf der Straße.

Es blökt nicht. Es frisst nicht. Es steht nur da und starrt nach Süden, zu den Hügeln am Fuß der Berge, als würde dort jemand nach ihm rufen. Seine Wolle ist an einer Seite merkwürdig grau, wie mit Asche bestäubt.
{ waagen_wagen:
    Der Fuhrmann muss anhalten. Die Söldner fluchen.
}
* [Das Lamm hochheben]
    ~ aendern(ruf_hirten, 1)
    Du hebst das Lamm hoch. Es ist warm und leicht. Einen Moment lang hängt es schlaff in deinen Armen, als würde es schlafen. Dann zuckt es zusammen, sieht dich an und blökt empört, so laut, dass {freund()} lachen muss.
    Die graue Stelle an seiner Wolle lässt sich nicht abklopfen.
* [Das Lamm an der Wolle zur Seite schieben]
    Du schiebst das Lamm zur Seite. Es lässt sich schieben wie ein Sack. Kaum lässt du los, dreht es sich wieder nach Süden und bleibt stehen. Starrt.
    {freund()} schaudert. „Das ist nicht normal. Oder? Ich kenne mich mit Schafen nicht aus. Aber das ist nicht normal.“
- Am späten Nachmittag seht ihr die ersten Dächer von Wollmark.
->->
