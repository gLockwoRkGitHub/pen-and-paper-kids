// =====================================================================
// Perle 4 – Wollmark: Hirtin Merla, Hauptmann Strell, die Nacht im
// Gasthaus und am Morgen: Liora/Cassian wird heimgeholt
// =====================================================================

=== p4_wollmark
# bild: entdeckung/wollmark
# karte: wollmark
Wollmark ist ein Dorf aus niedrigen Steinhäusern mit Dächern aus Torf, auf denen Gras wächst. Um den Dorfplatz stehen große Scheunen, in denen sich Wollballen bis unters Dach stapeln. Die Pferche dahinter sind halb leer.

Auf dem Dorfplatz stehen drei Zelte mit der goldenen Waage. Davor ein Pfahl, an den jemand ein Blatt genagelt hat: „FÜR JEDEN HINWEIS AUF DAS LAGER DER GNOLLE: FÜNF SILBERLINGE. HAUPTMANN STRELL, BUND DER GOLDENEN WAAGE.“

{freund()} zieht sich die Mütze tiefer ins Gesicht.
-> merla

= merla
Am Brunnen streitet eine Frau mit einem Söldner. Sie ist groß und knochig, hat Hände wie Schaufeln, ein wettergegerbtes Gesicht und einen Hirtenstab, mit dem sie gefährlich nah an der Nase des Söldners herumfuchtelt.

„… und ich sage dir, deine Leute trampeln mir die Weiden kaputt und finden nichts! Gar nichts!“

Der Söldner zieht sich zurück. Die Frau dreht sich um, sieht dich und kneift die Augen zusammen. „Und wer bist du? Noch einer, der Gnolle zählen will?“
* [„Ich komme aus Lysmara und will helfen.“ (Ausstrahlung)]
    ~ temp e = probe(ausstrahlung)
    ~ probe_zeile("Ausstrahlung", e)
    { e == MISSERFOLG:
        „Helfen.“ Die Frau schnaubt. „Das sagen alle.“ Aber sie geht nicht weg. Vielleicht, weil du so aussiehst, als würdest du es ernst meinen.
    - else:
        ~ aendern(ruf_hirten, 1)
        Die Frau mustert dich lange. Dann lässt sie den Stab sinken. „Helfen. Das hat in diesem Monat noch keiner gesagt, der aus Lysmara kam.“
    }
* {erster_auftrag == "wollmark"} [Kettrichs Brief zeigen]
    ~ aendern(ruf_hirten, 1)
    Die Frau liest den Brief, langsam, mit dem Finger unter den Zeilen. „Webstuhl und Amboss will wissen, wo die Wolle bleibt.“ Sie lacht bitter. „Komm mit. Ich zeig's dir.“
* {erster_auftrag == "ginsterhof"} [Nach dem Weg nach Ginsterhof fragen]
    „Ginsterhof?“ Die Frau zieht die Augenbrauen hoch. „Zu Jorrit willst du? Dem alten Ziegenbock? Der wohnt am Ende der Welt, am Fuß der Ziegenstiege. Und er mag keinen Besuch.“ Sie mustert dich. „Was willst du von dem?“
    Du zuckst nur die Schultern. Sie nickt langsam. „Verstehe. Geht mich nichts an.“
* [Einfach zuhören]
    Du sagst nichts. Die Frau wartet. Dann seufzt sie. „Wenigstens einer, der nicht gleich redet.“
- „Merla“, sagt sie. „Hirtenmeisterin von Wollmark.“ Sie zeigt mit dem Stab auf die halb leeren Pferche. „Seit einem Monat verschwinden Schafe. Jede Nacht ein paar. Sie laufen weg, nach Süden, in die Hügel unter den Bergen. Einfach so, mitten in der Nacht, über Mauern, die sie sonst nie überspringen würden.“

„Die Gnolle?“

„Das sagt die Waage.“ Merla spuckt aus. „Und ja, da oben sind Gnolle. Ich habe ihre Feuer gesehen. Aber kein Gnoll treibt Schafe, ohne Spuren zu hinterlassen. Und die Schafe, die wir wiederfinden …“ Sie bricht ab.

„Was ist mit denen?“

„Die stehen da. Am Rand von einem grauen Fleck im Gras, oben bei Ginsterhof. Stehen da und schlafen im Stehen. Und keiner meiner Hirten traut sich näher als hundert Schritte heran. Weil es dort so still ist. So still, dass man das eigene Herz hört.“
{
- erster_auftrag == "wollmark":
    „Und deshalb kommt keine Wolle nach Lysmara“, sagt Merla. „Meine Leute treiben ihre Herden nicht mehr in die Südweiden. Und die Karren, die wir hatten, hat die Waage beschlagnahmt. Für Vardholm.“
    ~ auftrag_p4 = 1
- erster_auftrag == "weiden_karte":
    Du ziehst Orwins Karte heraus. Merla tippt mit ihrem dicken Finger auf eine Stelle südlich von Ginsterhof, am Fuß der Berge. „Da. Mal da ein Loch hin. Da geht keiner mehr hin.“
- erster_auftrag == "mondklee":
    „Mondklee?“ Merla lacht kurz. „Der wächst über Ginsterhof, ja. Aber dieses Jahr wächst er grau. Wie alles da oben.“
}
-> strell

= strell
~ strell_getroffen = true
~ strell_belohnung = true
# bild: figur/strell
Aus dem größten Zelt tritt ein Mann. Er ist hager und aufrecht, mit kurz geschorenem grauem Bart und einem schwarzen Mantel, auf dessen Brustplatte die goldene Waage größer ist als bei den anderen. Er sieht aus, als hätte er in seinem ganzen Leben noch nie gelacht.

„Hauptmann Strell“, sagt Merla, ohne sich umzudrehen. Es klingt wie ein Schimpfwort.
{ magie_registriert == "waage":
    Strell kommt direkt auf dich zu und sieht auf die Plakette. „Der Rufer aus Lysmara. Gut.“ Seine Stimme ist ruhig und kalt. „Morgen gehst du nach Süden. Du findest mir das Lager der Gnolle. Vor Sonnenuntergang will ich wissen, wo es ist. Dafür bist du hier.“
    Er geht, bevor du antworten kannst.
- else:
    Strell mustert dich im Vorbeigehen. Seine Augen bleiben einen Moment an {freund()} hängen, an der zu großen Jacke, an den feinen Schuhen. Dann geht er weiter.
    „Fünf Silberlinge für das Lager“, sagt er über die Schulter, ohne stehen zu bleiben. „Das gilt für jeden. Auch für Kinder.“
    {freund()} atmet erst wieder aus, als er im Zelt verschwunden ist.
}
-> gasthaus

= gasthaus
# bild: szene/gasthaus-krummer-stab-{freund_kurz()}
Ihr übernachtet im Gasthaus Zum Krummen Stab. Die Wirtin gibt euch eine Kammer unter dem Dach und zwei Schüsseln Hammeleintopf, der so dick ist, dass der Löffel darin stehen bleibt.
~ rasten()

Später in der Nacht sitzt ihr am offenen Fenster. Im Süden, an den dunklen Hängen unter den Bergen, glimmen drei kleine Feuer.

„Gnolle“, flüstert {freund()}.

Und noch etwas fällt dir auf. Es ist still. Nicht die gute Stille einer Sommernacht, in der Grillen zirpen und irgendwo ein Hund bellt. Sondern eine Stille, die aus dem Süden herüberkommt wie kalte Luft aus einem Keller.

{freund()} zieht die Knie an. „Kann ich dir was sagen? Etwas, das ich noch niemandem erzählt habe?“
* [„Natürlich.“]
    -> geheimnis
* [„Nur, wenn du willst.“]
    -> geheimnis

= geheimnis
~ freund_mutter_angst = true
„Meine Mutter hat Angst“, sagt {freund()} leise. „Sie hat nie Angst. Vor nichts. Aber vor ein paar Wochen hab ich sie nachts gehört, in der Bibliothek. Sie hat mit meinem Vater gestritten. Und sie hat gesagt …“ {Fr_er()} schluckt. „Sie hat gesagt: ‚Wenn es über die Berge kommt, brauchen wir jede Kugel. Jede einzelne.‘“

„Was kommt über die Berge?“

„Ich weiß es nicht. Ich hab mich nicht getraut zu fragen.“ {freund()} sieht nach Süden, zu den Feuern. „Was, wenn die Gnolle gar nicht das Schlimmste sind? Was, wenn sie wegrennen? Vor dem, wovor meine Mutter Angst hat?“
{ register_geheimnis || kugeln_auf_wagen || kugeln_verstanden:
    Du denkst an die Glaskugeln.{register_geheimnis: An die Funken, die die Waage jeden Neumond einsammeln will.} Vielleicht ist es nicht nur Gier. Vielleicht ist es Angst. Das macht es nicht besser. Aber anders.
}
* [{freund()} in den Arm nehmen]
    ~ aendern(beziehung_freund, 1)
    Du legst {fr_ihm()} einen Arm um die Schultern. {freund()} lehnt sich an dich, und so sitzt ihr da, bis die Feuer im Süden kleiner werden.
* [„Morgen finden wir es heraus.“]
    „Wir“, wiederholt {freund()} und lächelt schwach. „Das gefällt mir.“
* [Nichts sagen. Nur gemeinsam in die Nacht schauen.]
    Ihr sagt beide nichts mehr. Manchmal ist das genug.
- ->->


=== p4_abschied_freund
# bild: szene/freund-abgeholt-{freund_kurz()}
Am Morgen weckt dich Hufgetrappel.

Als du in den Hof hinunterkommst, steht {freund()} schon dort, zwischen zwei Söldnern. Die Mütze ist {fr_ihm()} vom Kopf gerutscht, die Locken fallen heraus, und es gibt keinen Zweifel mehr, wer {fr_er()} ist.

Hauptmann Strell steht vor {fr_ihm()}. Und zum ersten Mal siehst du, wie er sich verbeugt. Nicht tief. Aber er verbeugt sich.

„{fr_ist_m():Junker|Fräulein}“, sagt er. „Man sucht Sie. Seit gestern Abend. Befehl von ganz oben. Sie werden nach Hause gebracht.“
~ freund_heimgeholt = true

„Ich komme nicht mit!“

„Doch“, sagt Strell, ohne die Stimme zu heben. „Das tun Sie.“
* [Dich vor {freund()} stellen und mit Strell reden (Ausstrahlung)]
    ~ temp e = probe(ausstrahlung)
    ~ probe_zeile("Ausstrahlung", e)
    { e:
    - ERFOLG:
        „{freund()} ist mit mir hier, weil ich {fr_ihn()} darum gebeten habe“, sagst du. „Wenn jemand Ärger bekommt, dann ich.“
        Strell sieht dich lange an. „Mutig“, sagt er. „Und dumm. Aber mutig.“ Er wendet sich an die Söldner. „Gebt ihnen fünf Minuten zum Verabschieden.“ Zu dir sagt er leise: „Ich werde vergessen, wer {fr_ihn()} mitgenommen hat. Einmal.“
        ~ aendern(beziehung_freund, 1)
    - JA_ABER:
        „{freund()} ist mit mir hier“, sagst du. „Wenn jemand Ärger bekommt, dann ich.“
        Strell nickt knapp. „Dann bekommst du ihn.“ Er macht sich eine Notiz. Aber er lässt euch einen Moment allein.
        ~ von_waage_notiert = true
        ~ aendern(beziehung_freund, 1)
    - else:
        Du stellst dich vor {freund()}. Strell schiebt dich zur Seite, nicht grob, aber so, als wärst du eine Tür, die im Weg steht.
    }
* [{freund()} ein Zeichen geben, wegzurennen (Geschick)]
    ~ temp e2 = probe(geschick)
    ~ probe_zeile("Geschick", e2)
    Du stößt einen Eimer um. Wasser spritzt, ein Pferd scheut, und {freund()} rennt los. Quer über den Hof, über eine Mauer, zwischen die Schafe.
    { e2 == ERFOLG:
        Eine Viertelstunde lang suchen die Söldner {fr_ihn()}. Dann sitzt {freund()} plötzlich neben dir hinter der Scheune, keuchend, mit Stroh im Haar. „Ich wollte mich nur richtig verabschieden“, sagt {fr_er()}. „Jetzt geh ich freiwillig.“
        ~ aendern(beziehung_freund, 1)
    - else:
        Sie haben {fr_ihn()} nach zwanzig Schritten. {freund()} lässt sich zurückführen, das Kinn hoch erhoben. Strell sieht dich an. Er sagt nichts. Er muss nichts sagen.
        ~ von_waage_notiert = true
    }
* [Es geschehen lassen. Gegen Strell kommst du nicht an.]
    Du bleibst stehen. {freund()} sieht dich an, und du weißt nicht, ob {fr_er()} enttäuscht ist oder erleichtert.
- Bevor {fr_er()} auf das Pferd steigt, kommt {freund()} noch einmal zu dir. {Fr_er()} dreht an der Samtjacke unter der Arbeiterjacke herum, reißt etwas ab und drückt es dir in die Hand.

Ein kleiner runder Knopf aus Gold.

„Damit du mich nicht vergisst“, sagt {fr_er()}. „Ich hab eh schon einen verloren.“
{ goldknopf_gefunden:
    Du schließt die Hand um den Knopf. Er sieht genauso aus wie der im Zelt der Waage. Genau so.
}

„Befehl von ganz oben“, flüsterst du. „Wer ist ganz oben, {freund()}?“

{freund()} sieht dich an. Einen langen Augenblick sieht es so aus, als würde {fr_er()} es sagen. Dann hebt ein Söldner {fr_ihn()} auf das Pferd.

„Pass auf dich auf“, ruft {freund()}. „Und find heraus, wovor sie wegrennen!“

Dann reiten die beiden Söldner mit {fr_ihm()} davon, eine Staubwolke auf der Spaltstraße, Richtung Lysmara. Strell blickt ihnen nach. Dann mustert er dich kurz und geht zurück in sein Zelt.
->->
