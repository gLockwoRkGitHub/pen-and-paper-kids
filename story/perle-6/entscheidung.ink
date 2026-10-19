// =====================================================================
// Perle 6 – Die Entscheidung, die Nacht des Schweigens, der Morgen danach
// =====================================================================

=== p6_entscheidung
Aus der großen Halle kommen Lachen und das Klirren von Gläsern. Oben auf dem Turm steht der Spiegel, dunkel und still. Und tief unter euren Füßen summen tausend Kugeln.

Du denkst an das Herz im Berg. An den Riss. An Brina, die vorhin auf dem Pflaster zusammengesunken ist.
* [„Wir sagen es allen. Heute Abend, vor dem ganzen Rat.“]
    -> vor_dem_rat
* [„Rede du mit ihr. Dir hört sie vielleicht zu.“]
    -> freund_spricht
* [„Wir lassen die Funken frei. Alle.“]
    -> kugeln_oeffnen

// ---------------------------------------------------------------------
// Weg 1: Vor dem Rat
// ---------------------------------------------------------------------
= vor_dem_rat
~ p6_weg = "enthuellt"
~ temp rat_bonus = 0
{ herzsplitter:
    ~ rat_bonus += 2
}
{ talin_hilft:
    ~ rat_bonus += 1
}
~ temp mit_kettrich = gilde == "webstuhl_amboss" || sabotage_entdeckt
{ mit_kettrich:
    ~ rat_bonus += 1
}
{ beziehung_freund >= 2:
    ~ freund_steht_zu_dir = true
}
# bild: szene/festmahl-vardholm
Die große Halle ist warm und hell. Lange Tische, weiße Tücher, Braten, Wein in Kristall. Ratsherren aus Lysmara, die Gildenmeister, Kaufleute in Pelz. Am Kopf der Tafel sitzt Seraphine Arvelle und hört einem dicken Mann zu, der etwas über Zölle erzählt.
{ freund_steht_zu_dir:
    {freund()} stößt die Tür auf und geht neben dir her, bis ihr beide vor der Tafel steht. Die Gespräche verstummen. „Hört zu“, sagt {fr_er()} laut. „Alle.“
- else:
    Du gehst allein hinein. {freund()} bleibt an der Tür stehen, halb im Schatten. Die Gespräche verstummen, eins nach dem anderen, als du vor der Tafel stehen bleibst.
}

Und dann erzählst du. Vom Herzen des Berges. Vom Riss. Vom Stollen der Waage und vom Grauen, das daraus sickert. Von der Glocke aus Glas über der Oberstadt.
{ herzsplitter:
    Du legst den Splitter auf das weiße Tuch. Er summt. Die Gläser auf dem Tisch beginnen leise zu klirren, alle zugleich, und in dem Splitter kreisen vier winzige Lichter.
}
{ talin_hilft:
    Hinter dir räuspert sich jemand. Talin steht in der Tür, die Mütze in den Händen. „Ich hab den Stollen gegraben“, sagt er. „Mit meinen eigenen Händen. Es ist wahr.“
}
{ mit_kettrich:
    Am Tisch der Gilden steht Meister Kettrich auf. Er nimmt die Brille ab. „Meine Gilde hat gegraben“, sagt er langsam. „Im Auftrag der Waage. Ich habe die Rechnungen gesehen und nicht gefragt.“ Er sieht Seraphine an. „Ich frage jetzt.“
}
{
- auftrag_p4 == 2 && erster_auftrag == "weiden_karte":
    ~ rat_bonus += 1
    Meister Orwin steht auf und rollt deine Karte der Weiden auf dem Tisch aus, mit dem leeren Loch am Fuß der Berge. „Wir zeichnen, was ist“, sagt er. „Das hier ist.“
- auftrag_p4 == 2 && erster_auftrag == "mondklee":
    ~ rat_bonus += 1
    Meisterin Ambra legt den grauen Mondklee aus deinem Tuch neben ihren Teller. Er zerfällt, als sie ihn berührt. Sie sagt nichts. Aber sie sieht Seraphine an.
- auftrag_p4 == 2 && erster_auftrag == "wollmark":
    ~ rat_bonus += 1
    „Die Wolle aus Wollmark kommt wieder“, sagt Kettrich leise. „Weil {geschlecht == "w":sie|er} die Schafe aus dem Grauen geholt hat.“
}

Seraphine lächelt. Sanft, wie immer. „Ein Kind mit einer Geschichte“, sagt sie. „Wie rührend.“
~ temp rat_e = probe(ausstrahlung + rat_bonus)
~ probe_zeile("Ausstrahlung", rat_e)
{ rat_e:
- ERFOLG:
    Aber niemand lacht.
    Meisterin Ambra steht auf und kommt um den Tisch herum. {herzsplitter:Sie nimmt den Splitter in die Hand, und ihr Gesicht wird weiß.|Sie sieht dich lange an.} „Das Kind lügt nicht“, sagt sie. „Das höre ich.“
    Dann reden alle durcheinander. Am Ende steht der älteste Ratsherr auf. „Das Werk wird angehalten“, sagt er. „Die Halle unter dem Turm wird versiegelt. Morgen prüft der Rat, was davon wahr ist.“
    Seraphine sitzt sehr still. Dann nimmt sie die goldene Kette mit der kleinen Waage ab und legt sie vor sich auf das Tuch. „Ich wollte sie schützen“, sagt sie leise. Zu niemandem. Vielleicht zu sich selbst.
    ~ waage_gestuerzt = true
- JA_ABER:
    Ein Murmeln geht durch die Halle. Ambra flüstert mit Kettrich. Der älteste Ratsherr runzelt die Stirn. „Das Werk wird angehalten“, sagt er schließlich. „Bis der Rat es geprüft hat.“
    ~ waage_gestuerzt = true
    „Selbstverständlich“, sagt Seraphine. Sie steht auf. „Und bis dahin bleibt das Kind unter Bewachung. Zu seiner eigenen Sicherheit.“
    Zwei Söldner bringen dich in eine kleine Kammer unter dem Westturm. Der Schlüssel dreht sich zweimal im Schloss. Durch das Fenster siehst du den Spiegel auf dem Turm. Er dreht sich nicht mehr.
    ~ gefangen_p6 = true
- else:
    Und dann lachen sie doch. Erst einer, dann alle. Ein Ratsherr wischt sich die Augen. „Herzen aus Kristall!“, ruft ein anderer.
    { freund_steht_zu_dir:
        „Es ist wahr!“, schreit {freund()}. „Mutter, es ist wahr!“
        „Geh auf dein Zimmer“, sagt Seraphine, ohne {fr_ihn()} anzusehen.
    - else:
        Du suchst {freund()} an der Tür. {Fr_er()} steht da und rührt sich nicht.
    }
    „Bringt das Kind in den Keller“, sagt Seraphine freundlich. „Morgen schicken wir es nach Hause.“
    Der Keller ist kalt und riecht nach Kartoffeln. Die Tür ist aus Eichenholz, mit Eisen beschlagen. Du sitzt im Dunkeln und hörst oben die Musik weiterspielen.
    ~ gefangen_p6 = true
    ~ gesucht = true
}
->->

// ---------------------------------------------------------------------
// Weg 2: Der Freund / die Freundin spricht mit der Mutter
// ---------------------------------------------------------------------
= freund_spricht
~ p6_weg = "freund"
~ temp mut = beziehung_freund
{ herzsplitter:
    ~ mut += 1
}
{freund()} wird blass. Dann noch blasser. „Ich hab ihr noch nie widersprochen“, sagt {fr_er()}. „Nicht ein einziges Mal.“

{Fr_er()} holt tief Luft. „Gut. Aber du kommst mit. Du wartest vor der Tür.“
{ herzsplitter:
    Du wickelst den Splitter aus und legst ihn {fr_ihm()} in die Hand. „Zeig ihn ihr.“ {freund()} schließt die Finger darum. Er summt zwischen {fr_sein()}en Fingern.
}

Seraphines Zimmer liegt oben im Hauptturm. Seraphine ist gerade vom Festmahl gekommen. {freund()} klopft und geht hinein. Die Tür fällt zu.

Du wartest. Erst hörst du nur Murmeln. Dann wird {freund()}s Stimme lauter. Dann die von Seraphine. Dann ist es lange still.
{ mut >= 2:
    -> freund_gewinnt
}
-> freund_verliert

= freund_gewinnt
~ freund_steht_zu_dir = true
Die Tür geht auf. Seraphine steht darin. Ohne die goldene Kette. Sie sieht dich an, ganz lange.

„Komm herein“, sagt sie.

Du erzählst alles noch einmal. Diesmal unterbricht sie dich nicht. {herzsplitter:Der Splitter liegt auf ihrem Schreibtisch und summt.} {freund()} steht neben dir, so dicht, dass eure Schultern sich berühren.

Als du fertig bist, sagt Seraphine lange nichts.

„Ich muss es selbst sehen“, sagt sie schließlich. „Morgen schicke ich Leute in den Berg. Leute, die ich nicht bezahle.“ Sie sieht {freund()} an, und zum ersten Mal ist ihre Stimme nicht sanft, sondern müde. „Du hast mir heute widersprochen.“

„Ja“, sagt {freund()}.

„Gut“, sagt Seraphine. Mehr nicht.
->->

= freund_verliert
~ freund_eingesperrt = true
Dann fliegt die Tür auf. Zwei Söldner kommen heraus, {freund()} zwischen sich. {Fr_er()} wehrt sich nicht. {Fr_sein()} Gesicht ist nass.

„Du bleibst in deinem Zimmer, bis wir wieder in Lysmara sind“, sagt Seraphine hinter {fr_ihm()} her. Dann sieht sie dich. „Und du gehst. Heute noch.“

Ein Söldner bringt dich bis an das Tor. Aber das Tor ist für die Nacht schon zu, und der Söldner hat keine Lust, es für ein Kind wieder aufzumachen. „Schlaf im Stall“, brummt er. „Und morgen früh bist du weg.“

Du legst dich ins Stroh. Oben im Hauptturm brennt ein einziges Fenster. Dahinter ist {freund()}.
->->

// ---------------------------------------------------------------------
// Weg 3: Die Funken befreien
// ---------------------------------------------------------------------
= kugeln_oeffnen
~ p6_weg = "funken"
{ not kugelhalle_gesehen:
    „Die Halle unter dem Nordturm“, sagt {freund()}. „Da sind sie alle drin. Tausende.“
}
{ beziehung_freund >= 1:
    ~ freund_steht_zu_dir = true
    {freund()} nickt. „Der Schlüssel hängt im Arbeitszimmer meiner Mutter. Ich hole ihn.“ {Fr_er()} grinst schief. „Ich bin ja {fr_ist_m():ihr Sohn|ihre Tochter}. Mich hält keiner auf.“
- else:
    {freund()} sieht dich lange an. „Ich kann das nicht“, sagt {fr_er()}. „Sie ist meine Mutter.“ Dann zieht {fr_er()} etwas aus der Tasche und drückt es dir in die Hand. Einen schweren eisernen Schlüssel. „Aber ich hab ihn verloren. Heute Abend. Irgendwo hinter dem Stall.“
}

Kurz nach Mitternacht {freund_steht_zu_dir:steht ihr|stehst du allein} in der Halle. Die Kugeln flackern in ihren eisernen Körben, braun, blau, rot, weiß. Tausende. Jeder Korb ist mit einem kleinen Riegel verschlossen.

~ temp funken_e = MISSERFOLG
~ temp mit_yrsa = false
~ temp brina_tipp = 0
{ brina_wahl == "spiegel":
    ~ brina_tipp = 1
}
„Wie sollen wir die alle aufmachen?“, flüsterst du. „Das dauert bis nächste Woche.“
* {yrsa_in_vardholm} [Yrsa holen. Sie hat die Körbe geschmiedet.]
    ~ mit_yrsa = true
    Yrsa schläft auf ihrem Karren im Hof. Als du sie weckst, ist sie sofort wach.
    In der Halle sieht sie sich lange um. „Tausende“, murmelt sie. Dann nimmt sie den Hammer vom Gürtel. „Jeder Korb hat denselben Riegel. Ich hab ihn so gemacht, weil es schneller geht. Ein Schlag auf die linke Seite, und er springt.“
    Sie schlägt gegen das erste Regal. Ein heller Ton, und zwanzig Riegel springen auf einmal auf. Dann das nächste Regal. Und das nächste.
    ~ funken_e = ERFOLG
* {kann_zaubern(0)} [Mit {element_dativ(element)} alle Riegel auf einmal sprengen]
    Du legst beide Hände an das erste Regal und rufst.
    ~ funken_e = zauber(0)
    ~ probe_zeile("Zauber", funken_e)
* [Die Riegel untersuchen. Vielleicht haben sie einen Trick (Verstand).]
    Du nimmst einen Korb aus dem Regal und drehst ihn im Licht. Der Riegel ist einfach. Fast zu einfach. Als hätte ihn jemand gemacht, der wollte, dass er schnell aufgeht.
    { brina_tipp > 0:
        Du denkst an Brina: Wenn man genau hinhört, kann man einzelne Stimmen erkennen. Du legst das Ohr an das Regal. Hinter dem Summen klickt es leise, bei jedem Riegel an derselben Stelle.
    }
    ~ funken_e = probe(verstand + brina_tipp)
    ~ probe_zeile("Verstand", funken_e)
- (funken_auf)
{ funken_e:
- ERFOLG:
    Riegel um Riegel springt auf. Ganz leise. Niemand hört {freund_steht_zu_dir || mit_yrsa:euch|dich}.
- JA_ABER:
    Die Riegel springen auf. Aber einer der Körbe fällt aus dem Regal und zerspringt auf dem Stein, und oben im Gang ruft jemand: „Wer ist da?“
    ~ gesucht = true
- else:
    Die ersten Riegel springen auf. Dann kippt ein ganzes Regal. Es kracht so laut, dass die halbe Festung wach wird. Schritte auf der Treppe. Fackeln. Aber die Kugeln rollen schon über den Boden, und die Körbe sind offen.
    ~ gesucht = true
    ~ gefangen_p6 = true
}

# bild: szene/funken-frei
Und dann steigen sie auf.

Erst eine Kugel, dann zehn, dann hundert. Sie heben sich aus den Körben, als wären sie leichter als Luft. Das Glas wird dünn wie eine Seifenblase und zerplatzt ohne einen Laut, und heraus fliegen die Funken. Braune, blaue, rote, weiße. Sie wirbeln durch die Halle, die Treppe hinauf, durch die Fenster hinaus in die Nacht.

Draußen im Hof schreien Menschen auf. Nicht vor Angst. Die Eingeschriebenen sitzen auf ihren Decken und halten sich die Hände an die Brust, und manche lachen und manche weinen, weil gerade etwas zu ihnen zurückgekommen ist, das ihnen gehört.

Tausende Funken fliegen über die Mauern, nach Westen, über die Weiden, nach Lysmara und in jedes Dorf. Nach Hause.
{ neumond_funke:
    ~ neumond_funke = false
    ~ kraftfunken += 1
    Und einer bleibt. {element == "erde":Braun}{element == "wasser":Blau}{element == "feuer":Rot}{element == "wind":Weiß}. Er kreist einmal um deinen Kopf, dann schlüpft er dir in die Brust, warm wie ein Schluck Tee. Dein Funke. Endlich.
}
~ funken_frei = true
{ gefangen_p6:
    Dann packen dich zwei Hände an den Schultern. Söldner. Sie bringen dich in den Keller und schließen ab. Es ist dir egal. Durch das Kellerfenster siehst du die Funken fliegen, so viele, dass der Himmel aussieht wie bei einem Fest.
}
->->

// =====================================================================
// Die Nacht: Das Schweigen kommt durch die Schlucht
// =====================================================================
=== p6_nacht
# bild: szene/schweigen-im-spalt
{ p6_weg == "funken":
    Die Funken sind kaum hinter den Mauern verschwunden, als es still wird.
- else:
    Mitten in der Nacht wachst du auf, weil es still ist.
}

Nicht leise. Still. Das Rauschen des Bachs in der Schlucht ist fort. Die Fackeln auf der Mauer brennen noch, aber sie knistern nicht mehr. Ein Pferd im Stall hebt den Kopf und wiehert, und kein Ton kommt heraus.

Das Schweigen.

Es kommt von Osten, durch den Nyrrspalt, wie ein Schatten, der über den Boden kriecht. Kein Nebel, kein Rauch. Nur Farbe, die verschwindet. Wo es das Gras berührt, wird das Gras grau. Wo es eine Fackel berührt, geht die Fackel aus.
{ p6_weg == "funken":
    Und plötzlich verstehst du. Tausend Kugeln haben wochenlang in dieser Halle gesummt. Die lauteste Stimme im ganzen Land. Und eben {freund_steht_zu_dir:habt ihr|hast du} sie alle auf einmal in den Himmel geworfen.
- else:
    Und plötzlich verstehst du. Tausend Kugeln summen seit Wochen in der Halle unter dem Turm. Die lauteste Stimme im ganzen Land. Und alles, was eine Stimme hat, zieht das Schweigen an.
}
{ gefangen_p6:
    -> befreit
}
{ freund_eingesperrt:
    -> freund_befreien
}
-> im_hof

= befreit
Durch das Fenster siehst du die Fackeln auf der Mauer ausgehen. Eine nach der anderen. Ohne Luftzug.

Dann dreht sich ein Schlüssel im Schloss.
{ freund_steht_zu_dir:
    Es ist {freund()}. Barfuß, im Nachthemd, mit dem Schlüsselbund {fr_sein()}er Mutter in der Hand. „Ich lass dich hier nicht sitzen“, flüstert {fr_er()}. „Nicht nach allem.“
- else:
    Es ist Magister Pell, im Schlafrock, mit einer Kerze, die nicht brennt. „Ich habe dich nicht gesehen“, sagt er. „Das ist inzwischen eine Gewohnheit.“ Dann, leiser: „Da draußen ist etwas. Und ich glaube, du bist {geschlecht == "w":die Einzige hier, die|der Einzige hier, der} weiß, was es ist.“
}
-> im_hof

= freund_befreien
Du rennst über den Hof zum Hauptturm. Die Wache vor der Tür ist fort. Ihr Speer liegt auf der Treppe.

Oben im Gang steht Magister Pell vor {freund()}s Zimmer, einen Schlüssel in der Hand, und zögert.

„Geben Sie her“, sagst du.

Pell sieht dich an. Dann gibt er dir den Schlüssel. „Rechenstunde“, murmelt er. „Ich wollte doch nur Rechenstunde geben.“

{freund()} fällt dir um den Hals, kaum dass die Tür offen ist. „Ich hab gewusst, dass du kommst.“
~ freund_steht_zu_dir = true
-> im_hof

= im_hof
Im Hof herrscht ein seltsames Durcheinander, ganz ohne Lärm. Söldner rennen mit offenem Mund, aber ihre Rufe sind nur noch ein Hauch. Einige von ihnen gehen langsam auf das Osttor zu, mit offenen Augen, als würde sie jemand rufen. Ins Graue hinein.
{ jaro_gesprochen:
    Einer der jungen Söldner geht nicht ins Graue. Jaro. Er hat seinen Speer weggeworfen und zerrt einen Kameraden nach dem anderen am Mantel zurück, und dabei schreit er ein Seemannslied aus dem Hafenviertel, so laut er kann.
}
{ strell_getroffen:
    Am Osttor steht Hauptmann Strell. Er hält als Einziger noch eine Fackel, die brennt, und stellt sich seinen eigenen Leuten in den Weg, einem nach dem anderen. Das Graue reicht ihm schon bis an die Knie.
}

Auf dem Turm steht Seraphine Arvelle, im Mantel über dem Nachthemd, die Hände auf dem Spiegel.
{ funken_frei:
    „Hebt den Wall!“, ruft sie hinunter. Aber die Halle unter ihr ist leer. Der Spiegel bleibt dunkel.
- else:
    „Hebt den Wall!“, ruft sie. Und der Spiegel leuchtet auf, mit der Kraft aus tausend Kugeln. Die Kuppel aus Licht wölbt sich über die Festung. Das Graue drückt dagegen. Die Kuppel flackert. Tief unten in der Halle schreien die Kugeln.
    Dann ein Knall wie Eis auf einem See. Ein Riss läuft quer über den Spiegel. Genau wie der Riss im Herzen des Berges.
    Die Kuppel erlischt.
}

Das Graue kriecht über die Mauer.
* [Zum Turm. Seraphine steht noch oben am Spiegel.]
    ~ seraphine_gerettet = true
    Du rennst die Treppe hinauf, immer zwei Stufen auf einmal. Oben ist das Graue schon da. Es liegt um Seraphines Füße wie Wasser. Sie starrt auf den Spiegel und bewegt sich nicht mehr.
    Du packst sie am Arm und ziehst. Sie ist schwer und kalt, als wäre sie aus Stein. Du ziehst noch einmal, und dann stolpert sie dir hinterher, die Treppe hinunter, aus dem Grauen hinaus. Unten blinzelt sie, als würde sie gerade aufwachen.
    „Du“, sagt sie heiser. „Ausgerechnet du.“
* {strell_getroffen} [Zum Tor. Strell hält allein die Stellung.]
    ~ strell_gerettet = true
    Du rennst zum Osttor. Strell steht bis zur Hüfte im Grauen. Seine Fackel ist ausgegangen. Er hält sie trotzdem hoch.
    Du packst ihn am Gürtel und ziehst. Er wankt, dreht sich um, sieht dich, als wüsste er nicht, wer du bist. Dann weiß er es wieder. Zusammen stolpert ihr zurück in den Hof.
    „Du schon wieder“, keucht er.
* [Keine Zeit. Jetzt rufen, hier, mitten im Hof.]
    ~ p6_frueh_gerufen = true
    Du bleibst stehen, wo du bist. Wenn das Schweigen allem folgt, was eine Stimme hat, dann muss jemand lauter sein als alle Kugeln zusammen.
- -> der_ruf

= der_ruf
~ temp helfer = 0
{ not seraphine_gerettet:
    { freund_steht_zu_dir:
        Oben auf dem Turm sinkt Seraphine auf die Knie. Da rennt {freund()} an dir vorbei, die Treppe hinauf, und zieht {fr_sein()}e Mutter aus dem Grauen.
    - else:
        Oben auf dem Turm sinkt Seraphine auf die Knie. Magister Pell holt sie herunter, keuchend, Stufe um Stufe. Sie sieht durch ihn hindurch, als wäre er Luft.
    }
}
{ strell_getroffen && not strell_gerettet:
    Am Tor ziehen Strells Männer ihren Hauptmann zurück. Er steht da und sagt nichts. Seine Augen sind grau und leer.
}

Du stellst dich in die Mitte des Hofs. „Rufer!“, schreist du, und deine Stimme klingt wie durch Watte. „Nicht in die Platten! In die Nacht! So laut ihr könnt!“
{ funken_frei:
    ~ helfer += 1
    Die Eingeschriebenen stehen auf. Sie haben ihre Funken wieder. Einer nach dem anderen hebt die Hände.
- else:
    Die Eingeschriebenen stehen auf, grau im Gesicht, leer gesaugt von der Vorführung. Aber sie heben die Hände. Wer nichts mehr hat, ruft trotzdem.
}
{ talin_hilft:
    ~ helfer += 1
    Talin stellt sich neben dich und stemmt die Füße in den Boden. „Erde hört auf mich“, sagt er. „Hab ich dir doch erzählt.“
}
{ yrsa_in_vardholm:
    ~ helfer += 1
    Yrsa klettert auf ihren Karren und schlägt mit dem Hammer auf den Amboss, den sie immer dabeihat. Funken sprühen. Es klingt wie eine Glocke.
}
{ freund_steht_zu_dir:
    ~ helfer += 1
    { not seraphine_gerettet:
        {freund()} kommt die Turmtreppe heruntergestolpert, lässt {fr_sein()}e Mutter bei Pell und stellt sich auf deine andere Seite.
    - else:
        {freund()} stellt sich auf deine andere Seite.
    }
    {Fr_er()} hat keine Magie. Also singt {fr_er()}. Laut und falsch und aus voller Kehle, ein Kinderlied aus der Oberstadt.
}
{ brina_freundin:
    ~ helfer += 1
    Neben dir steht Brina, auf einen Stock gestützt. {funken_frei:Ihre Funken sind wieder da. Sie hebt die Hände, und der Brunnen im Hof rauscht auf wie ein Bach nach dem Regen.|Sie hat keinen Funken mehr. Sie singt trotzdem, mit dünner, fester Stimme, ein altes Lied aus Wollmark.}
}
{ singlampe:
    ~ helfer += 1
    Mirks Lampe in deiner Tasche fängt an zu singen. Hell und dünn, mitten im Grauen.
}
{ p6_frueh_gerufen:
    ~ helfer += 1
}
{ kraftfunken <= 0:
    Du hast keinen Funken mehr. Du rufst trotzdem. Nicht mit Kraft. Mit Stimme.
}

Und dann rufst du {element_artikel(element)}. So, wie du noch nie gerufen hast.
~ temp ruf_e = probe(elementstufe + helfer)
~ probe_zeile("Großer Ruf", ruf_e)
~ elementstufe = 3
~ kraftfunken = 0

Etwas in dir bricht auf wie ein Damm.
{ element:
- "erde":
    # bild: szene/ruf-gross-erde
    Der Berg antwortet. Die Wände der Schlucht beginnen zu brummen, tief und gewaltig, so wie damals im Herzen. Steine knirschen gegeneinander, Felsen dröhnen, der ganze Nyrrspalt singt wie eine riesige steinerne Glocke.
- "wasser":
    # bild: szene/ruf-gross-wasser
    Das Wasser antwortet. Der Bach in der Schlucht bäumt sich auf, wird zu einer Welle, zu einem Sturzbach, und rauscht und donnert die Schlucht hinauf, gegen das Graue, so laut wie ein Wasserfall.
- "feuer":
    # bild: szene/ruf-gross-feuer
    Das Feuer antwortet. Jede erloschene Fackel auf der Mauer flammt auf einmal wieder auf, und aus deinen Händen steigt eine Säule aus Flammen, hoch wie der Turm, und sie knistert und brüllt und faucht.
- "wind":
    # bild: szene/ruf-gross-wind
    Der Wind antwortet. Er kommt von den Gipfeln herab, durch die Schlucht, und er heult, wie du ihn noch nie hast heulen hören. Fahnen knallen, Fensterläden schlagen, der ganze Nyrrspalt wird zu einer riesigen Flöte.
}

Und rings um dich rufen die anderen mit. Braun, blau, rot, weiß. Hunderte Stimmen in der Nacht.
{ ruf_e:
- ERFOLG:
    ~ ruf_vardholm = 2
    Das Graue weicht zurück. Erst zögernd, dann immer schneller. Es zieht sich über die Mauer zurück, aus dem Hof, die Schlucht hinauf, nach Osten, bis hinter den Pass. Wo es war, ist das Gras wieder grün. Der Bach rauscht.
    Du stehst in der Mitte des Hofs, zitternd, und um dich herum jubeln Menschen. Und diesmal hörst du jeden Ton.
- JA_ABER:
    ~ ruf_vardholm = 1
    Das Graue weicht zurück. Langsam, Schritt um Schritt, über die Mauer, die Schlucht hinauf, bis es nur noch ein grauer Schimmer ganz hinten im Pass ist.
    Dann geben deine Knie nach. Das Letzte, was du hörst, bevor alles schwarz wird, ist der Jubel. Laut. Wunderbar laut.
- else:
    ~ ruf_vardholm = 0
    Einen Augenblick lang ist es zu wenig. Das Graue kriecht weiter, über dein Knie, über deine Brust, und deine eigene Stimme verschwindet. Du hörst nichts mehr. Du fühlst nichts mehr.
    Dann spürst du eine Hand auf deiner Schulter. Und noch eine. Und noch eine. Die anderen rufen für dich mit, lauter und lauter, bis das Graue dich loslässt und sich zurückzieht, bis an das Ende der Schlucht. Dort bleibt es liegen. Und wartet.
    Dann wird alles schwarz.
}
{ freund_steht_zu_dir || seraphine_gerettet:
    ~ seraphine_einsicht = true
}
->->

// =====================================================================
// Der Morgen danach
// =====================================================================
=== p6_morgen
# bild: entdeckung/vardholm-morgen
{ ruf_vardholm == 2:
    Du schläfst auf einem Heuhaufen, und als du aufwachst, steht die Sonne schon über dem Pass.
- else:
    Du wachst in einem richtigen Bett auf, unter drei Decken. Die Sonne steht schon über dem Pass. Jemand hat dir die Stiefel ausgezogen.
}

Die Festung sieht aus wie nach einem Gewitter. {p6_weg == "funken":Der Spiegel auf dem Turm ist dunkel und blind. Ohne die Kugeln ist er nur noch Glas.|Der Spiegel auf dem Turm hat einen Riss von oben bis unten.} Söldner sitzen an der Mauer und starren vor sich hin. Die Eingeschriebenen kochen Suppe über offenen Feuern, und die Feuer knistern.
{ ruf_vardholm == 0:
    Ganz hinten in der Schlucht, wo der Pass beginnt, liegt ein grauer Streifen über den Felsen. Er bewegt sich nicht. Aber er ist da.
- else:
    Die Schlucht ist leer bis zum Pass. Nur ganz hinten, wo die Felsen zusammenrücken, liegt ein feiner grauer Hauch, wie Staub auf einem Regal.
}

{ seraphine_einsicht:
    -> einsicht
}
{ waage_gestuerzt:
    -> gestuerzt
}
-> kalt

= einsicht
Seraphine Arvelle kommt allein über den Hof. Ohne Kette. Ohne Söldner. Sie setzt sich neben dich auf die Bank, und eine Weile sagt keiner von euch etwas.

„Ich habe Mauern gebaut, weil ich Angst hatte“, sagt sie schließlich. „Und dann habe ich nur noch auf die Mauern geachtet und nicht mehr darauf, wer draußen steht.“ Sie sieht zum Spiegel hinauf. „Mein Wall hätte heute Nacht niemanden gerettet. Ihr habt es getan. Mit euren Stimmen.“
{ waage_gestuerzt:
    „Der Rat hat mir die Festung genommen“, sagt sie. „Zu Recht. Aber ein paar Dinge kann ich noch in Ordnung bringen.“
}
{ seraphine_gerettet:
    Sie sieht dich an. „Und du hast mich da oben herausgezogen. Mich. Nach allem.“
}
{ not funken_frei:
    „Die Funken gebe ich zurück“, sagt sie. „Heute noch. Jeden einzelnen.“
    Am Mittag öffnet sie selbst die Halle. Die Funken steigen in den hellen Himmel und fliegen nach Westen, nach Hause.
    ~ funken_frei = true
    { neumond_funke:
        ~ neumond_funke = false
        Einer davon kommt zu dir zurück. Er fühlt sich an wie ein Schluck warmer Tee.
    }
}
„Die Plaketten gelten nicht mehr. Niemand muss sich mehr einschreiben.“ Sie steht auf. „Und das Tor im Nyrrspalt ist offen. Für dich, wann immer du willst.“
~ gesucht = false
-> weiter

= gestuerzt
Am Vormittag tritt der Rat im Hof zusammen. Meisterin Ambra spricht, dann Meister Kettrich, dann der älteste Ratsherr. Die Waage verliert ihre Festung. Die Söldner bekommen ihren Lohn und werden nach Hause geschickt. Die Halle wird geöffnet, die Plaketten gelten nicht mehr.{gesucht: Niemand sucht mehr nach dir.}
~ gesucht = false
{ not funken_frei:
    Am Mittag steigen die Funken aus der Halle in den Himmel. Tausende. Die Eingeschriebenen stehen im Hof und strecken die Hände danach aus.
    ~ funken_frei = true
    { neumond_funke:
        ~ neumond_funke = false
        Einer kommt zu dir zurück.
    }
}

Seraphine Arvelle fährt am Nachmittag in einer Kutsche nach Lysmara. Zwei Ratswachen reiten nebenher. Am Kutschfenster sieht sie dich einen Augenblick an. Du kannst nicht sagen, was in ihrem Blick liegt.

Der älteste Ratsherr gibt dir ein gefaltetes Papier mit dem Siegel der Stadt. „Ein Passierschein“, sagt er. „Für den Nyrrspalt. Wann immer du willst.“
-> weiter

= kalt
Seraphine Arvelle steht auf der Treppe des Hauptturms, die goldene Kette um den Hals. Sie sieht müde aus. Aber nicht weich.

„Du warst nützlich heute Nacht“, sagt sie. „Das will ich nicht bestreiten.“ Sie kommt die Stufen herunter, bis sie vor dir steht. „Aber das Werk geht weiter. {p6_weg == "funken":Mit neuen Kugeln|Mit einem neuen Spiegel}. Es muss weitergehen.“
{ funken_frei:
    Ihre Stimme wird leiser und kälter. „Und was in der Halle geschehen ist, vergesse ich nicht. Geh nach Hause. Und wenn ich dich noch einmal in meiner Festung sehe, bist du kein Kind mehr für mich, sondern {geschlecht == "w":eine Diebin|ein Dieb}.“
    ~ gesucht = true
- else:
    „Geh nach Hause“, sagt sie. „Das Tor bleibt zu. Für alle.“
}
-> weiter

= weiter
~ spalt_offen = seraphine_einsicht || waage_gestuerzt
{ jaro_gesprochen:
    Am Tor begegnet dir Jaro, ohne Brustplatte, ein Bündel über der Schulter. „Ich geh nach Hause“, sagt er. „Ins Hafenviertel. Ich werd Fischer, glaube ich. Fische sind leise, aber wenigstens ehrlich.“ Er streckt dir die Hand hin. „Danke. Für das Reden. Am Feuer.“
}
{ brina_freundin:
    Brina sitzt an der Mauer in der Sonne, eine Decke über den Knien. {funken_frei:Als sie dich sieht, hebt sie einen Finger, und ein Wassertropfen steigt aus ihrem Becher, dreht sich einmal in der Luft und landet auf deiner Nase. Sie lacht wie ein junges Mädchen.|Sie sieht müde aus. Aber sie lächelt, als sie dich sieht.} „Ich gehe nach Hause“, sagt sie. „Zu meinem Enkel. Er wird nicht glauben, was ich erzähle.“
    { brina_wahl:
    - "brot":
        Dann drückt sie dir ein Stück Brot in die Hand, noch warm vom Feuer. „Jetzt sind wir quitt.“
    - "schweigen":
        Dann sagt sie nichts mehr, und du auch nicht. Ihr sitzt einfach in der Sonne. Zusammen nicht reden. Sie hatte recht, das ist etwas anderes.
    }
}
{ talin_hilft:
    Talin kommt mit zwei Schalen Suppe über den Hof. {funken_frei:„Ich hab meinen Funken wieder“, sagt er und strahlt. „Und ich geh nach Hause. Zu Fuß. Ohne Plakette.“|„Ich bleib noch“, sagt er. „Einer muss auf die anderen aufpassen.“}
}
{ yrsa_in_vardholm:
    Yrsa steht unten am Turm und sieht zu dem {p6_weg == "funken":dunklen|gesprungenen} Spiegel hinauf. „Jetzt weiß ich, wofür ich geschmiedet habe“, sagt sie. „Und jetzt schmelze ich es wieder ein.“
}
{ strell_gerettet:
    Hauptmann Strell kommt zu dir, die Mütze in der Hand. {strell_schuldet:„Letztes Mal hab ich gesagt, ich weiß nicht, wie man das zurückzahlt“, sagt er. „Jetzt schulde ich dir zwei Mal.“|„Ich weiß nicht, wie man so etwas zurückzahlt“, sagt er. „Aber ich finde es heraus.“} Er verbeugt sich. Vor dir. Nicht vor {freund()}.
    ~ strell_schuldet = true
- else:
    { strell_getroffen:
        Hauptmann Strell sitzt an der Mauer, eine Decke um die Schultern, und sieht in die Schlucht. Er hat seit gestern Nacht kein Wort gesagt. „Das wird wieder“, sagt einer seiner Männer. „Irgendwann.“ Es klingt nicht, als ob er es glaubt.
    }
}

Am Nachmittag findet dich {freund()} auf der Mauer. Ihr sitzt nebeneinander und schaut nach Osten, wo der Pass zwischen die Felsen schneidet.
{ beziehung_freund >= 2 || freund_steht_zu_dir:
    ~ freund_kommt_mit = true
    „Das Herz im Berg“, sagt {freund()}. „Solange es Risse hat, kommt das Schweigen wieder. Hier kann es keiner heilen. Aber irgendwo da draußen, hinter den Bergen, muss es jemanden geben, der weiß, wie.“
    {Fr_er()} sieht dich an. „Du gehst da raus. Das weiß ich. Und ich komme mit.“
- else:
    „Ich bleibe bei ihr“, sagt {freund()} leise{waage_gestuerzt && not seraphine_einsicht:. „Morgen fahr ich ihr nach. Sie hat jetzt niemanden mehr.“| und nickt zum Turm hinüber.} „Einer muss auf sie aufpassen. Auch wenn sie es nicht will.“ {Fr_er()} stupst dich mit der Schulter an. „Aber du gehst da raus. Das seh ich dir an.“
}

Du schaust nach Osten. Hinter dem Pass ist das Schweigen. Und irgendwo dahinter vielleicht eine Antwort.

Wege hinaus kennst du inzwischen einige.
{ spalt_offen:
    Das Tor im Nyrrspalt. Offen, für dich.
- else:
    Das Tor im Nyrrspalt. Zu.
}
{ wolfspfad_bekannt:
    Jorrits Wolfspfad, über die Gipfel, an den Fackeln vorbei.
}
{ tiefe_stiege_weg:
    Die Tiefe Stiege, ganz durch den Berg, bis zum Licht am anderen Ende.
}
{ seeweg_bekannt:
    Ein Boot, irgendwo an der Küste, das um das Kap fährt.
}
~ rasten()
->->

// =====================================================================
// Tagebuch
// =====================================================================
=== p6_tagebuch
# bild: tagebuch/perle-6
# tagebuch: Die Festung am Pass
# karte: vardholm
Abends schlägst du dein Buch auf.

Du zeichnest Vardholm, quer in seiner Schlucht. Den Turm mit dem Spiegel{p6_weg == "funken":, dunkel und leer.| und einen Riss quer hindurch.} Und kleine Punkte, die in den Himmel fliegen, braun, blau, rot, weiß.

Darunter schreibst du: # handschrift

„{freund()} heißt Arvelle. {Fr_sein()}e Mutter ist die Waagmeisterin.
{ goldknopf_gefunden:
    Seit dem Goldknopf habe ich es geahnt. Es tut trotzdem weh.
- else:
    Ich hätte es nie gedacht.
}
{ p6_weg == "enthuellt":
    Ich habe es allen gesagt, vor dem ganzen Rat.
}
{ p6_weg == "freund":
    {freund()} hat mit {fr_sein()}er Mutter geredet. Zum ersten Mal hat {fr_er()} ihr widersprochen.
}
{ p6_weg == "funken":
    Wir haben die Kugeln geöffnet. Alle Funken sind nach Hause geflogen.
}
{ waage_gestuerzt:
    Die Waage hat ihre Festung verloren.
}
In der Nacht kam das Schweigen durch die Schlucht. {p6_weg == "funken":Der Wall ist dunkel geblieben.|Der Wall hat nicht gehalten.} Wir haben zusammen gerufen, alle, und es ist zurückgewichen.
Mein Ruf ist jetzt ein Sturm.
{ seraphine_einsicht:
    Seraphine hat gesagt, sie hat Mauern gebaut, weil sie Angst hatte. Das Tor ist offen.
}
{ gesucht:
    Die Waage sucht mich.
}
{ freund_kommt_mit:
    {freund()} kommt mit. Hinter die Berge.
- else:
    {freund()} bleibt hier. Ich vermisse {fr_ihn()} jetzt schon.
}
Das Herz im Berg hat einen Riss. Irgendwo da draußen weiß jemand, wie man ihn heilt.“ # tagebuch_ende

{
- kraftfunken == 0: Du spürst keinen Funken mehr in dir. Nach einer Rast kommen sie wieder.
- kraftfunken == 1: Du spürst einen kleinen Funken in dir.
- else: Du spürst {zahl(kraftfunken)} kleine Funken in dir.
}
->->
