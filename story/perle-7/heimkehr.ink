// =====================================================================
// Perle 7 – Aufbruch aus Vardholm, letzter Abend in Lysmara, Wahl des Weges
// =====================================================================

=== p7_aufbruch
Am nächsten Morgen packst du deine Sachen. Viel ist es nicht. Ein Bündel, dein Buch, {kompass:Tickworts Kompass,} {singlampe:Mirks Lampe,} {herzsplitter:der Splitter in seinem Tuch,} und alles, was du in den letzten Wochen gelernt hast. Das wiegt am meisten und trägt sich am leichtesten.
{ freund_kommt_mit:
    -> freund_packt
}
-> freund_bleibt

= freund_packt
# bild: szene/abschied-vardholm-kommt-{freund_kurz()}
{freund()} wartet am Tor, einen Lederranzen auf dem Rücken, der viel zu neu aussieht. Keine Samtjacke. Ein einfacher grauer Mantel, feste Stiefel. Nur die Schuhe mit den Silberschnallen hat {fr_er()} an den Ranzen gebunden. „Für besondere Anlässe“, sagt {fr_er()}.
{ seraphine_einsicht:
    Neben {fr_ihm()} steht Seraphine. Ohne Kette. Sie sieht ihr Kind an, als wollte sie sich jedes Haar merken.
    „Ich habe Nein gesagt“, erzählt sie dir. „Dann hat {fr_er()} mir widersprochen. Schon wieder.“ Etwas, das fast ein Lächeln ist. „Ich lerne gerade, dass das nicht das Schlimmste ist, was einem passieren kann.“
    Sie umarmt {freund()} lange. Dann sieht sie dich an. „Bring {fr_ihn()} mir wieder.“
    „Versprochen“, sagst du.
- else:
    „Ich hab ihr einen Brief geschrieben“, sagt {freund()} und sieht dabei auf die Stiefel. „Drei Seiten. Sagen konnte ich es ihr nicht. Sie hätte mich eingesperrt.{freund_eingesperrt: Schon wieder.}“
    {Fr_er()} schluckt. Dann hebt {fr_er()} das Kinn. „Komm. Bevor ich es mir anders überlege.“
}
-> heimweg

= freund_bleibt
# bild: szene/abschied-vardholm-bleibt-{freund_kurz()}
{freund()} bringt dich bis an das Tor. Eine Weile steht ihr nur da und wisst nicht, was man in so einem Moment sagt.
{ waage_gestuerzt && not seraphine_einsicht:
    „Ich fahr heute mit der Kutsche nach Lysmara“, sagt {freund()}. „Zu ihr. Sie hat jetzt niemanden mehr. Nur noch mich.“
- else:
    „Ich bleib bei ihr“, sagt {freund()}. „Wenigstens eine Weile. Jemand muss ihr beibringen, wie man zuhört.“
}
{ goldknopf_gefunden || freund_heimgeholt:
    Du ziehst den Goldknopf aus der Tasche. {goldknopf_gefunden:Den, den du im Zelt der Waage gefunden hast.|Den, den {fr_er()} dir in Wollmark geschenkt hat.} Du hältst ihn {fr_ihm()} hin.
    {freund()} schüttelt den Kopf und schließt deine Finger darum. „Behalt ihn. Dann hast du was von mir dabei. Und ich hab einen Grund, warum du zurückkommen musst. Meine Jacke ist ohne ihn nämlich nicht vollständig.“
- else:
    {freund()} reißt einen Goldknopf von {fr_sein()}em Ärmel und drückt ihn dir in die Hand. „Damit du was von mir dabeihast. Und damit du zurückkommen musst. Meine Jacke ist ohne ihn nämlich nicht vollständig.“
    ~ goldknopf_gefunden = true
}
Dann umarmt {fr_er()} dich, so fest, dass dir die Luft wegbleibt, und rennt zurück in den Hof, ohne sich umzudrehen.
-> heimweg

= heimweg
{ yrsa_in_vardholm:
    Auf der Straße hält ein Karren neben {freund_kommt_mit:euch|dir}. Yrsa sitzt auf dem Bock. „Die Körbe schmelze ich zu Hause ein“, sagt sie. „In der eigenen Esse. Steig auf.“
    Den ganzen Tag rumpelt ihr die Spaltstraße hinunter. Yrsa redet kaum. Einmal, kurz vor Wollmark, sagt sie: „Wissen tut weh. Nichtwissen tut später weh. Das ist schlimmer.“
    { element == "feuer":
        Am letzten Abend füllt sie dir die Glutlaterne mit frischer Kohle. „Stufe drei“, sagt sie. „Der Brand. Jetzt musst du das Wort ‚genug‘ noch besser lernen als vorher.“{beziehung_mentor >= 2: Dann, ganz leise: „Ich bin stolz auf dich.“}
        ~ quelle = true
    }
- else:
    { funken_frei:
        Du gehst die Spaltstraße hinunter, zusammen mit den Eingeschriebenen, die nach Hause wollen. Es ist dieselbe lange Reihe wie auf dem Hinweg. Aber diesmal ist sie nicht still. Jemand singt. Jemand lacht. Ein kleines Mädchen lässt einen Wassertropfen über ihren Fingern tanzen, und ihre Mutter weint vor Freude.
    - else:
        Du gehst die Spaltstraße hinunter{freund_kommt_mit:, {freund()} neben dir, und lange redet keiner von euch.|, allein mit deinen Gedanken.} Hinter dir wird der Kamm kleiner. Vor dir werden die Weiden grüner.
    }
}
{ talin_hilft && funken_frei:
    Kurz hinter Vardholm, wo ein Feldweg von der Straße abzweigt, wartet Talin. „Da lang geht's zu meiner Mutter“, sagt er. Er stampft einmal auf, und ein Kiesel hüpft vor dir in die Luft. Dann grinst er und biegt ab.
}
{ ruf_hirten >= 1:
    In Wollmark stehen die Hirten am Brunnen und winken. Einer läuft neben dir her und drückt dir einen ganzen Laib Schafskäse in die Hand. „Für die Reise“, sagt er. „Wir haben gehört, was in Vardholm war.“ Neuigkeiten laufen in den Weiden schneller als Schafe.
}
{ brina_freundin:
    Hinter Wollmark, in einem kleinen Dorf an der Straße, sitzt eine alte Frau vor ihrem Haus in der Sonne, einen Jungen neben sich. Brina. Sie zeigt auf dich und flüstert dem Jungen etwas zu, und der Junge starrt dich an, mit offenem Mund.
}
Am Abend des zweiten Tages siehst du die Lichter von Lysmara. Und dahinter, rot und golden, versinkt die Sonne im Meer.
->->


// ---------------------------------------------------------------------
// Kontrolle an der Orinbrücke – nur wenn die Waage die Figur noch sucht
// (Pasco, 19.10.2026)
// ---------------------------------------------------------------------
=== p7_orinbruecke
~ temp umg_bruecke = 0
{ element == "wasser":
    ~ umg_bruecke = 1
}
# bild: szene/heimkehr-lysmara
Am Landtor stockt der Verkehr. Karren, Handwagen, eine schnatternde Gänseherde, alles staut sich vor der Orinbrücke.{yrsa_in_vardholm: Yrsa zieht an den Zügeln, und der Karren reiht sich ein.} Dann siehst du, warum.
Am Brückenkopf stehen zwei Söldner der Waage. Der eine hält ein Blatt in der Hand und sieht jedem ins Gesicht, der hinüberwill. Der andere gähnt.
{yrsa_in_vardholm || freund_kommt_mit:Als ihr näher rückt|Als du näher rückst}, erkennst du das Zeichen der Waage auf dem Blatt. Darunter eine Zeichnung, ein Kindergesicht. Sie sieht dir nicht besonders ähnlich. Aber ähnlich genug.
{ freund_kommt_mit:
    {freund()} hat es auch gesehen. {Fr_er()} greift nach deinem Ärmel.
}
* [Dich hinter einem Heuwagen über die Brücke schieben (Geschick)]
    ~ temp g_bruecke = probe(geschick)
    ~ probe_zeile("Geschick", g_bruecke)
    Du {yrsa_in_vardholm:gleitest vom Karren, }duckst dich hinter einen Heuwagen und schiebst dich Schritt für Schritt mit ihm voran, immer auf der Seite, die die Söldner nicht sehen.
    -> bruecke_folge(g_bruecke)
* [Dich zu den Gänsen stellen und so tun, als gehörten sie dir (Verstand)]
    ~ temp v_bruecke = probe(verstand)
    ~ probe_zeile("Verstand", v_bruecke)
    Du {yrsa_in_vardholm:gleitest vom Karren, }brichst eine Weidenrute vom Wegrand, stellst dich hinter die Gänse und treibst sie an, als hättest du dein Leben lang nichts anderes getan. „Ich helf dir, Großmutter“, sagst du laut zu der alten Frau, der sie gehören. Sie sieht dich verdutzt an. Dann versteht sie und nickt.
    -> bruecke_folge(v_bruecke)
* {kann_zaubern(umg_bruecke)} [Mit {element_dativ(element)} für Ablenkung sorgen (Zauber)]
    ~ temp z_bruecke = zauber(umg_bruecke)
    ~ probe_zeile("Zauber", z_bruecke)
    { element:
    - "wasser":
        Du rufst den Orin. Unter der Brücke steigt Nebel auf, erst ein Hauch, dann eine weiße Wand, die über das Geländer quillt.
    - "erde":
        Du bittest die Pflastersteine am Brückenkopf, sich ein kleines bisschen zu heben. Ein Kohlkarren bleibt hängen, kippt, und Kohlköpfe rollen den Söldnern vor die Füße.
    - "feuer":
        Am Brückenkopf glüht ein Kohlebecken, an dem sich die Söldner die Hände wärmen. Du rufst die Glut darin. Sie faucht auf und spuckt eine dicke Wolke Rauch.
    - else:
        Du rufst einen Windstoß den Fluss herauf. Er reißt dem Söldner das Blatt aus der Hand und wirbelt es über das Geländer.
    }
    -> bruecke_folge(z_bruecke)
* {hintergrund == "strassenkind" || hintergrund == "botenlaeufer"} [({hintergrund == "strassenkind":Straßenkind|Botenläufer}) Du kennst einen anderen Weg über den Orin]
    ~ bruecke_kontrolle = "unbemerkt"
    { hintergrund == "strassenkind":
        Jedes Straßenkind in Lysmara kennt die Orinbrücke von unten. Unter dem dritten Bogen läuft ein schmaler Sims an den Pfeilern entlang, glitschig und dunkel, gerade breit genug für Kinderfüße. Früher habt ihr ihn genommen, wenn die Stadtwache Ärger gemacht hat.
    - else:
        Botenläufer nehmen nie die Brücke, wenn es eilt. Unten am Ufer liegt der alte Fährmann Ott in seinem Kahn, und Boten setzt er umsonst über. Er erkennt dich, grinst und fragt nichts.
    }
    Kurz darauf stehst du auf der anderen Seite{freund_kommt_mit:, {freund()} dicht hinter dir}. Die Söldner haben nicht einmal in deine Richtung geblinzelt.
    -> bruecke_drueben
* {freund_kommt_mit && wahrheit_freund} [{freund()} etwas versuchen lassen]
    ~ bruecke_kontrolle = "unbemerkt"
    „Lass mich mal“, flüstert {freund()} und zieht die Kapuze vom Kopf. Bevor du {fr_ihn()} aufhalten kannst, geht {fr_er()} geradewegs auf die Söldner zu.
    Du siehst, wie sie {fr_ihn()} erkennen. Wie sie die Rücken gerade machen. Das Kind der Waagmeisterin. Beide starren nur noch auf {fr_ihn()}, und du gehst mitten im Gedränge an ihnen vorbei.
    Hinter der Brücke holt {freund()} dich ein. {Fr_er()} ist blass. „Sie haben gefragt, ob meine Mutter weiß, wo ich bin“, sagt {fr_er()}. „Ich hab gesagt: Bald.“
    -> bruecke_drueben
* {yrsa_in_vardholm} [Unter Yrsas Plane kriechen, zwischen die Körbe]
    ~ bruecke_kontrolle = "unbemerkt"
    „Wie in Vardholm“, brummt Yrsa, als du unter die Plane kriechst.{freund_kommt_mit: {freund()} quetscht sich neben dich.} Die Körbe klappern. Der Karren rollt an und hält, und dicht neben dir sagt eine Stimme: „Was hast du da, Alte?“
    „Altes Eisen“, sagt Yrsa. „Willst du's tragen?“
    Er will nicht. Der Karren rollt weiter. Auf der anderen Seite klopft Yrsa zweimal auf das Brett. Du kannst herauskommen.
    -> bruecke_drueben

= bruecke_folge(e)
{ e:
- ERFOLG:
    ~ bruecke_kontrolle = "unbemerkt"
    Niemand hält dich an. Niemand ruft. Erst auf der anderen Seite merkst du, dass du die ganze Zeit die Luft angehalten hast.
- JA_ABER:
    ~ bruecke_kontrolle = "nachgesehen"
    Du kommst hinüber. Aber am Ende der Brücke drehst du dich doch um, nur ganz kurz. Der Söldner, der eben noch gegähnt hat, gähnt nicht mehr. Er sieht dir nach, lange, mit schmalen Augen.
    Er ruft nicht. Er läuft dir nicht nach. Aber du weißt, dass er sich dein Gesicht merken wird. Und du dir seins.
- else:
    ~ bruecke_kontrolle = "versteckt"
    Einer der Söldner hebt den Kopf, genau in deine Richtung. „He! Du da!“
    Du rennst. Nicht über die Brücke, sondern daneben die Uferböschung hinunter{freund_kommt_mit:, {freund()} hinter dir her}. Unter der Brücke ist es dunkel und nass und riecht nach Algen. Du drückst dich hinter einen Pfeiler, bis zu den Knöcheln im kalten Wasser. Über dir poltern Stiefel. Stimmen. Dann wird es still.
    Du wartest trotzdem. Über dem Fluss gehen die Lichter an, eins nach dem anderen. Die Glocke der Ratshalle schlägt, und noch einmal. Erst als die Wache wechselt und die neuen Söldner nur noch in ihre Laternen gähnen, kletterst du die Böschung hinauf.{yrsa_in_vardholm: Yrsas Karren ist längst fort, zur Großen Schmiede.}
    Es ist spät geworden. Für alles, was du heute Abend noch vorhattest, bleibt jetzt weniger Zeit.
}
-> bruecke_drueben

= bruecke_drueben
{ yrsa_in_vardholm && bruecke_kontrolle != "versteckt":
    Hinter der Brücke trennen sich eure Wege. „Ich bin in der Schmiede“, sagt Yrsa. Mehr nicht. Dann rumpelt ihr Karren davon.
}
{ bruecke_kontrolle == "versteckt":
    Dann endlich durch die Gassen. Die Wasserräder drehen sich im Dunkeln. Am Markt packen die letzten Händler ihre Stände zusammen. Alles ist, wie es war. Und doch kommt dir alles kleiner vor als vor ein paar Wochen.
- else:
    Dann durch die Gassen. Die Wasserräder drehen sich. Am Markt rufen die Händler. Alles ist, wie es war. Und doch kommt dir alles kleiner vor als vor ein paar Wochen.
}
->->


// ---------------------------------------------------------------------
// Der letzte Abend in Lysmara
// ---------------------------------------------------------------------
=== p7_lysmara
{ gesucht && not (waage_gestuerzt || seraphine_einsicht):
    -> p7_orinbruecke ->
- else:
    # bild: szene/heimkehr-lysmara
    Durch das Landtor, über die Orinbrücke, durch die Gassen. Alles ist, wie es war. Die Wasserräder drehen sich. Am Markt rufen die Händler. Und doch kommt dir alles kleiner vor als vor ein paar Wochen.
    { yrsa_in_vardholm:
        Hinter der Brücke hat Yrsa {freund_kommt_mit:euch|dich} absteigen lassen. „Ich bin in der Schmiede“, hat sie gesagt. Mehr nicht.
    }
}
-> p7_marktplatz ->
{ jaro_gesprochen:
    Unten an der Hafenmauer schleppt ein junger Mann mit Sommersprossen eine Kiste voller Fische. Jaro. {jaro_kugeln:„Ich hab's allen im Hafenviertel erzählt, das mit den Kugeln“, ruft er. „Meine Mutter hat die halbe Gasse zusammengetrommelt.“|„Fische sind wirklich leise“, ruft er. „Aber ich sing ihnen was vor.“}
}
{ auftrag_p4 == 1:
    Vor der Tuchhalle steht Meister Kettrich und zählt Wollballen, die Dreifachbrille auf der Nase. Als er dich sieht, nickt er knapp. „Halber Auftrag. Halbe Wolle“, sagt er. „Aber ich weiß jetzt, warum. Das zählt auch.“
}
{ gilde:
- "webstuhl_amboss":
    {auftrag_p4 == 1:Dann kommt er herüber|Vor der Tuchhalle steht Meister Kettrich. Als er dich sieht, kommt er herüber} und drückt dir die Hand. „Regel zweiundvierzig: Mitglieder kommen zurück“, sagt er. „Die habe ich mir gerade ausgedacht. Sie gilt trotzdem.“
- "weite_feder":
    Am Haus der Weiten Feder lehnt Meister Orwin im Fenster, eine Brille auf der Nase, eine auf der Stirn. „Zeichne alles da draußen“, ruft er dir nach. „Besonders das, was keiner glaubt. Wir zeichnen, was ist.“
- "phiole":
    Über dem Hafen steigt violetter Rauch aus dem Schornstein der Phiole. Meisterin Ambra steht in der Tür und winkt mit einem rußigen Handschuh. „Schreib uns, was da draußen wächst“, ruft sie. „Und wenn es explodiert, erst recht.“
- "leise_hand":
    Im Gedränge am Markt stößt jemand gegen dich. Als du dich umdrehst, ist niemand da. Aber in deiner Tasche steckt ein Zettel, in winziger Schrift: „Die Hand vergisst niemanden.“ Darunter eine kleine Hand, die einen Finger an die Lippen legt.
}
{ freund_kommt_mit:
    An der Apfelgasse bleibt {freund()} stehen. „Ich schlaf heute oben“, sagt {fr_er()} und nickt zur Oberstadt hinauf. „Ein letztes Mal im eigenen Bett. Morgen früh steh ich vor deiner Tür. Wehe, du bist schon weg.“
}

Dann gehst du nach Hause, {zuhause()}.
{ bp_gefunden:
    {bp()} sitzt am Tisch, als hätte {bp_er()} auf dich gewartet. Wahrscheinlich hat {bp_er()} das auch. Die letzten Spuren vom Grauen sind aus {bp_sein()}em Gesicht verschwunden.
    {Bp_er()} steht auf und hält dich fest, sehr lange.
    „Ich bin damals los, weil ich wissen wollte, was da im Berg brummt“, sagt {bp_er()} später, als ihr zusammen esst. „Ich bin nicht weit gekommen. Du schon.“ {Bp_er()} schüttelt den Kopf. „Und jetzt willst du noch weiter. Ich seh es dir an.“
- else:
    {bp()} lässt den Löffel fallen, als du durch die Tür kommst. Dann hält {bp_er()} dich fest, sehr lange.
    „Du warst weg“, sagt {bp_er()}. „Wochen. Ich hab nur Gerüchte gehört. Von Kobolden, von Gnollen, von Vardholm.“ {Bp_er()} sieht dich an. „Und jetzt willst du noch weiter. Ich seh es dir an.“
}
Du nickst. Über die Berge. Herausfinden, was das Schweigen ist. Und ob das Herz im Berg geheilt werden kann.

{bp()} sagt eine Weile nichts. Dann steht {bp_er()} auf und holt etwas aus der Truhe. Ein Seil, sauber aufgerollt. „Nimm das mit“, sagt {bp_er()}. „Ein Seil braucht man immer. Das ist das Einzige, was ich übers Reisen weiß, das stimmt.“
~ seil = true
-> ausloeser_heute

= ausloeser_heute
{ ausloeser:
- "schulden":
    -> fesk
- "flucht":
    { gesucht:
        { bruecke_kontrolle != "":
            Am Markt hast du es vorhin noch einmal gesehen: Neben dem Wachhaus hängt derselbe Zettel wie an der Brücke. Dieselbe Zeichnung.{bruecke_kontrolle == "nachgesehen": Du musst an den Söldner denken, der dir nachgesehen hat.}
        - else:
            Am Markt hast du es vorhin gesehen: Neben dem Wachhaus hängt ein Zettel mit dem Zeichen der Waage, und darauf eine Zeichnung. Sie sieht dir nicht besonders ähnlich. Aber ähnlich genug.
        }
        Du bist immer noch auf der Flucht. Und morgen musst du hier weg.
    - else:
        Am Markt hast du vorhin nach Söldnern der Waage Ausschau gehalten. {funken_frei:Es gibt keine mehr.|Zwei stehen am Brunnen, aber sie sehen dich nicht einmal an.} Niemand sucht dich. Zum ersten Mal seit Wochen musst du nicht über die Schulter sehen.
        Und trotzdem willst du hinaus. Nicht mehr, um wegzulaufen. Sondern um anzukommen.
    }
- "brief":
    Der Brief liegt in deinem Bündel, ganz unten, das Ringsiegel unversehrt. Wochen hast du ihn getragen, durch Höhlen, über Weiden, in eine Festung. Er muss immer noch auf die andere Seite.
    Und als du die Tür schließt, siehst du es wieder: ein frisches Kreidezeichen am Türrahmen. Vier verschlungene Ringe. Diesmal wischst du es nicht weg.
}
-> besuche

= fesk
Vor der Tür steht ein Mann in einem grauen Mantel mit silbernen Knöpfen. Fesk. Er lüftet den Hut.
{
- vor_fesk_geflohen:
    „Heute läufst du nicht weg, wie ich sehe“, sagt er. „Das ist ein Fortschritt.“
- fesk_getaeuscht:
    „Und heute bitte keine Geschichten“, sagt er. „Die letzte war gut. Zu gut.“
- schulden_versprochen:
    „Du hast mir versprochen zu zahlen“, sagt er. „Das Kontor erinnert sich an Versprechen.“
}

„Die vierzig Silberlinge“, sagt er freundlich. „Wir hatten Neumond gesagt.{fesk_aufschub: Dann zwei Wochen extra, weil du in einer Gilde bist. Auch die sind vorbei.} Neumond war vor einer Weile.“ Er zieht ein kleines, schweres Päckchen aus dem Mantel, verschnürt und mit silbernem Siegel. „Aber das Kontor ist großzügig. Ich höre, du gehst über die Berge. In Dornfurt, am ersten Fluss hinter dem Kamm, hat das Silbermark-Kontor eine Stube. Bring das dorthin, und die Schuld ist bezahlt. Für {pfand()}. Für immer.“
* [Das Päckchen annehmen]
    ~ fesk_auftrag = true
    Du nimmst das Päckchen. Es ist schwerer, als es aussieht.
    „Nicht öffnen“, sagt Fesk. „Das ist keine Bitte.“ Er lüftet den Hut ein zweites Mal und geht.
* [„Ich bin nicht {geschlecht == "w":Ihre Botin|Ihr Bote}.“]
    Fesk zuckt mit den Schultern. „Wie du willst. Das Kontor hat Geduld. Und ein sehr gutes Gedächtnis.“ Er geht.
    {bp()} legt dir die Hand auf die Schulter. „Lass gut sein“, sagt {bp_er()}. „Wir zahlen es ab. Stück für Stück. Das ist nicht deine Last.“
- -> besuche

= besuche
~ temp mentor_da = not (element == "feuer" && yrsa_in_vardholm)
// Wer sich unter der Orinbrücke verstecken musste, hat nur Zeit für einen Abschied.
~ temp besuche_max = 2
{ bruecke_kontrolle == "versteckt":
    ~ besuche_max = 1
}
{ p7_besuche >= besuche_max:
    -> abend_zuhause
}
{
- p7_besuche == 0 && besuche_max == 1:
    Es ist schon fast Nacht. Für einen Abschied reicht die Zeit noch. Für mehr nicht.
- p7_besuche == 0:
    Es ist noch nicht ganz dunkel. Für einen Abschied reicht die Zeit, vielleicht für zwei.
- else:
    Für einen Abschied ist noch Zeit.
}
* {mentor_da} [Zu {mentorname()}]
    -> besuch_mentor
* {not mentor_da} [Zu Yrsa in die Große Schmiede]
    -> besuch_yrsa
* [Zu Tickwort, in die Werkstatt von Knallfunke & Söhne]
    -> besuch_tickwort
* [Zu Grumak an den Marktbrunnen]
    -> besuch_grumak
* [Nach Hause und schlafen. Morgen wird ein langer Tag.]
    -> abend_zuhause

= besuch_mentor
~ p7_besuche += 1
{ element:
- "erde":
    # bild: szene/abschied-borrik
    Im Steinmetzhof sitzt Borrik auf seinem Block und hält einen Stein in den Händen. Er hebt den Kopf, bevor du etwas sagst.
    „Ah“, sagt er. „Du klingst anders. Tiefer. Der Berg hat dich gehört.“ Er nickt langsam. „Stufe drei. Der Sturm. Bei Zwergen sagt man: der Steinschlag. Klingt weniger hübsch, ist aber dasselbe.“
    Er füllt ein Lederbeutelchen mit Erde aus seinem Hof. „Erde von zu Hause. Wo du hingehst, ist die Erde vielleicht still. Diese hier nicht.“
    ~ quelle = true
- "wasser":
    # bild: szene/abschied-nerelle
    Die Morgentau liegt an Liegeplatz sieben. Nerelle steht an der Reling, wie immer. Sie verlässt ihr Schiff nie.
    „Du riechst nach Bergwasser“, sagt sie. „Kalt und schnell. Stufe drei, hm? Die Flut.“ Sie füllt deinen Schlauch mit Meerwasser. „Das Meer ist überall dasselbe Meer. Auch hinter den Bergen. Vergiss das nicht, wenn du dich verloren fühlst.“
    ~ quelle = true
- "feuer":
    # bild: szene/abschied-yrsa
    In der Großen Schmiede glüht die Esse. Yrsa legt den Hammer weg.
    „Stufe drei“, sagt sie. „Der Brand. Jetzt musst du das Wort ‚genug‘ noch besser lernen als vorher.“ Sie füllt deine Glutlaterne mit frischer Kohle. „Und wenn du da draußen bist, wo alles still ist, dann denk daran: Feuer ist das Lauteste, was es gibt.“
    ~ quelle = true
- "wind":
    # bild: szene/abschied-vael
    Du läufst hinaus zu den Klippen von Ahrn, bis zum schiefen weißen Leuchtturm. Vael sitzt oben auf der Galerie und sieht aufs Meer. Er sagt nichts. Du setzt dich neben ihn.
    Lange später zieht er eine Sturmvogelfeder aus seinem Mantel und steckt sie dir an den Kragen. „Der Sturm“, sagt er. Das ist alles. Für Vael ist das eine Rede.
}
{ beziehung_mentor >= 2:
    Zum Abschied sagt {mentorname()} etwas, das {mentorname_ist_m():er|sie} noch nie gesagt hat: „Ich bin stolz auf dich.“
}
-> besuche

// Feuer-Rufer, die mit Yrsa von Vardholm heimgefahren sind (Pasco, 19.10.2026).
// Stufe drei, Glutlaterne und „stolz“ hat sie schon auf der Heimfahrt gesagt (heimweg).
= besuch_yrsa
~ p7_besuche += 1
# bild: szene/abschied-yrsa
In der Großen Schmiede glüht die Esse heller als sonst. Daneben steht Yrsas Karren, die Plane zurückgeschlagen. Yrsa nimmt einen eisernen Korb nach dem anderen und legt ihn in den Tiegel. Die Körbe werden rot, dann weich, dann sind sie nichts mehr.
Sie sieht nicht auf. „Hilf mir“, sagt sie und nickt zur Esse.
Du rufst die Glut, ganz leicht. Sie faucht auf, weiß und heiß, und das Eisen im Tiegel fängt an zu fließen.
„Genug“, sagt Yrsa. Du hörst sofort auf. Sie nickt. Bei Yrsa ist ein Nicken viel.
Eine Weile arbeitet ihr so, ohne ein Wort. Du nimmst einen Korb vom Karren. Er ist leicht. Du denkst an die Kugel, die darin gesessen hat, und an das Licht, das hinauswollte. Dann legst du ihn in die Glut.
Als der Karren leer ist, legt Yrsa die Zange weg und wischt sich die Hände an der Schürze ab.
„Was man geschmiedet hat, kann man wieder einschmelzen“, sagt sie. „Das gilt nicht nur für Eisen. Denk daran, wenn du da draußen einen Fehler machst.“
Dann holt sie mit der Zange ein Stück Kohle aus der Esse, aus genau dem Feuer, in dem die Körbe geschmolzen sind, und legt es in deine Glutlaterne. Sie hält sie dir hin.
„Jetzt brennt da drin etwas Gutes“, sagt sie. „Pass drauf auf.“
~ quelle = true
Als du gehst, hörst du hinter dir schon wieder den Hammer. Ein Schlag. Noch einer.
-> besuche

= besuch_tickwort
~ p7_besuche += 1
# bild: szene/abschied-tickwort
In der Werkstatt von Knallfunke & Söhne riecht es nach Öl und angebranntem Zucker. Tickwort steht an einer Werkbank und erklärt drei Goblins etwas über Zahnräder. Die Goblins hören zu. Wirklich.

Als er dich sieht, stößt sein Schornstein eine ganze Kette Dampfringe aus. „Du gehst“, sagt er. „Das sehe ich an deinem Bündel, an deinen Stiefeln und an der Art, wie du in der Tür stehst. Drei Beweise. Drei ist eine sehr gute Zahl.“
{ tickwort_wiedergesehen:
    „Seit dem Gildentag habe ich weitergeschrieben“, sagt er. „Hundertsieben Anleitungen. Brakka hat von allen die erste Seite gelesen. Das ist ein Rekord.“
- else:
    „Du warst lange nicht hier“, sagt er. Es klingt nicht wie ein Vorwurf. Eher wie eine Zahl, die er sich genau gemerkt hat.
}

Du zeigst ihm den Kompass. Die Nadel zeigt auf dich selbst, irgendwie, oder auf den Boden unter dir. Nach Hause.

„Wenn du draußen bist“, sagt Tickwort, „zeigt er hierher. Das ist der ganze Sinn.“ Er macht eine lange Pause. „Ich hatte eine Abschiedsrede vorbereitet. Sie hat vierzehn Unterpunkte. Ich sage nur den letzten.“

„Und der ist?“

„Komm wieder.“
{ beziehung_tickwort >= 1:
    ~ tickwort_pfeife = true
    Dann öffnet er die Klappe in seinem Bauch und holt eine kleine Messingpfeife heraus. „Selbst gebaut. Sie ist so laut wie zehn Ziegen. Ich habe es gemessen. Mit Ziegen.“ Er drückt sie dir in die Hand. „Für den Fall, dass es irgendwo zu still wird.“
}
-> besuche

= besuch_grumak
~ p7_besuche += 1
# bild: szene/abschied-grumak
Grumak sitzt am Marktbrunnen hinter seinen Säcken. {waage_gestuerzt:Sie sind voller als beim letzten Mal. Seit der Rat in Vardholm aufgeräumt hat, kommen wieder Waren in die Stadt, sagt er.|{seraphine_einsicht:Sie sind voller als beim letzten Mal. Seit das Tor in Vardholm offen ist, kommen wieder Waren, sagt er.|Sie sind leerer als beim letzten Mal. „Das Tor bleibt zu“, brummt er. „Und mein Pfeffer bleibt draußen.“}}

„Du gehst nach Osten“, sagt er, als du es ihm erzählst. „Natürlich gehst du nach Osten.“ Er wirft eine Nuss in die Glut. „Dann hör zu. Hinter dem Kamm, am ersten großen Fluss, liegt Dornfurt. Da wohnt mein Bruder Durgash. Er hat ein Gasthaus, Zum Halben Hauer. Das Essen ist schlecht, die Betten sind gut.“

Er zieht einen schweren eisernen Ring vom Finger und drückt ihn dir in die Hand. „Zeig ihm das. Dann weiß er, dass du zu mir gehörst. Und frag ihn nach den leeren Dörfern. Er weiß mehr als ich.“
~ grumak_ring = true
-> besuche

= abend_zuhause
{
- p7_besuche == 0 && bruecke_kontrolle == "versteckt":
    Für Abschiede bist du heute zu müde.
- p7_besuche == 0:
    Du gehst früh nach Hause.
- p7_besuche == 1 && bruecke_kontrolle != "versteckt":
    Du gehst früh nach Hause.
}
Zum letzten Mal legst du dich zu Hause schlafen. Draußen rauscht das Meer. Du liegst lange wach und hörst zu.
~ rasten()
->->


// ---------------------------------------------------------------------
// Die Wahl des Weges
// ---------------------------------------------------------------------
=== p7_wahl
# bild: szene/vier-wege
~ temp seeweg_da = seeweg_bekannt || hintergrund == "schiffsjunge" || gilde == "leise_hand" || ruf_leise_hand >= 2
Am Morgen sitzt du auf der Treppe vor dem Haus, das Buch auf den Knien, und schlägst die Karte auf, die du über Wochen gezeichnet hast.
{ freund_kommt_mit:
    {freund()} kommt die Gasse herunter, den Ranzen auf dem Rücken, und setzt sich neben dich. „Ich bin nicht zu spät“, sagt {fr_er()} atemlos. „Ich bin genau richtig.“
}

{bp()} bringt dir einen Becher Tee hinaus und setzt sich auf die Stufe über dir.
{ hintergrund:
- "reisender":
    „Weißt du, was ich in dreißig Jahren auf der Straße gelernt habe?“, sagt Maren. „Der kürzeste Weg ist selten der beste. Und der beste ist selten der, den alle nehmen. Nimm den, bei dem du nachts schlafen kannst.“
- "schausteller":
    „Ein guter Abgang“, sagt Bonifaz und wischt sich die Augen, „ist die halbe Vorstellung. Geh so, dass sie dir nachwinken. Nicht so, dass sie dir nachrennen.“
- "strassenkind":
    „Ich kenne nur die Gassen hier“, sagt Mutter Kessel. „Aber eins weiß ich: Wer unterwegs Freunde findet, ist überall ein bisschen zu Hause. Wer keine findet, ist nur irgendwo.“
- "botenlaeufer":
    „Ein Bote“, sagt Meister Holm, „nimmt den Weg, auf dem die Nachricht ankommt. Nicht den, auf dem er am schnellsten ist. Denk daran, was du trägst.“
- "kartografenlehrling":
    Meisterin Ysolde beugt sich über deine Karte und tippt mit dem Federkiel darauf. „Gute Arbeit“, sagt sie, und das hat sie noch nie gesagt. „Jetzt fehlt nur noch, was hinter dem Rand liegt.“
- "schiffsjunge":
    „Das Meer ist ehrlich“, sagt Kapitänin Rhea. „Es sagt dir, wenn es dich nicht will. Die Berge sagen es dir erst, wenn du oben bist.“ Sie zuckt mit den Schultern. „Aber es ist deine Reise.“
}

Meridel ist ein Kessel. Im Westen das Meer, an allen anderen Seiten der Kamm. Und es gibt nur eine Handvoll Wege hinaus.
{ spalt_offen:
    Der Nyrrspalt. Das Tor von Vardholm ist für dich offen. Aber im Pass liegt noch das Graue.
- else:
    Der Nyrrspalt. Das Tor von Vardholm bleibt für dich zu.
}
{ wolfspfad_bekannt:
    Über die Gipfel, auf Jorrits Wolfspfad, an den Fackeln der Waage vorbei.
- else:
    Über die Gipfel. Über die Ziegenstiege, wo die Fackeln der Waage brennen.
}
{ tiefe_stiege_weg:
    Unter dem Berg. Die Tiefe Stiege hinab und den alten Gang nach Osten, bis zum Licht.
}
{ seeweg_da:
    Übers Meer. Nachts, ohne Laterne, um das Kap herum.
}

Du legst den Finger auf die Karte.
* {spalt_offen} [Durch den Nyrrspalt]
    ~ p7_route = "spalt"
    „Durch das Tor“, sagst du. „Wie es sich gehört.“
* [Über die Gipfel]
    ~ p7_route = "gipfel"
    „Über die Berge“, sagst du. „Oben ist der Wind.“
* {tiefe_stiege_weg} [Unter dem Berg]
    ~ p7_route = "tiefe"
    „Unter dem Berg“, sagst du. „Am Herzen vorbei.“
* {seeweg_da} [Übers Meer]
    ~ p7_route = "meer"
    „Übers Meer“, sagst du. „Wo {freund_kommt_mit:uns|mich} keiner sucht.“
-
{ freund_kommt_mit:
    {freund()} nickt. „Dann los.“
}
{ (kobold_gerettet || grisk_begleitet) && p7_route != "tiefe":
    Am Ende der Gasse sitzt ein Kobold mit Grubenlampe auf einem Fass. Grisk. „Grisk hat gehört, dass du gehst“, sagt er und hebt die Lampe. „Grisk vergisst nicht.“
}
Der Kompass in deiner Tasche zittert. Die Nadel zeigt zurück, auf das Haus hinter dir. Nach Hause.

Du stehst auf.
->->
