// =====================================================================
// Perle 7 – Die vier Wege hinaus
// =====================================================================

// --- Was gegen das Schweigen hilft: alles, was Lärm macht ---
=== function laerm_bonus()
~ temp b = 0
{ singlampe:
    ~ b += 1
}
{ tickwort_pfeife:
    ~ b += 1
}
{ freund_kommt_mit:
    ~ b += 1
}
~ return b


// ---------------------------------------------------------------------
// Durch den Nyrrspalt
// ---------------------------------------------------------------------
=== p7_spalt
~ temp u_spalt = 0
{ element == "erde" || element == "wind":
    ~ u_spalt = 1
}
# bild: szene/tor-offen
Zwei Tage später stehst du wieder vor dem schwarzen Tor von Vardholm. Diesmal ist es offen.
{ seraphine_einsicht:
    Seraphine Arvelle steht oben auf der Mauer. Sie hebt nicht die Hand, sie ruft nichts. Sie nickt nur, einmal, langsam. {freund_kommt_mit:Und {freund()} nickt zurück.}
- else:
    Am Tor stehen Wachen des Rats in dunkelroten Mänteln. Du zeigst den Passierschein mit dem Siegel der Stadt, und sie treten zur Seite.
}
{ strell_gerettet:
    Hauptmann Strell wartet auf der anderen Seite des Tors, ohne Brustplatte, nur im Mantel. „Bis zum Pass“, sagt er. „Ich schulde dir noch was.“ Er geht neben dir her und sagt die ganze Zeit kein Wort. Es ist ein gutes Schweigen. Eins, in dem man das Wasser rauschen hört.
- else:
    { strell_getroffen:
        Am Tor sitzt Hauptmann Strell, eine Decke um die Schultern. Als du vorbeigehst, hebt er die Hand. Sein Mund formt ein Wort, ohne Ton. Vielleicht „Danke“. Vielleicht „Viel Glück“.
    }
}

Hinter der Festung wird die Schlucht noch schmaler. Die Straße steigt an, Kehre um Kehre, neben dem Bach her, bis zum Pass.

Und da liegt es.
{ ruf_vardholm == 0:
    Ein breiter grauer Streifen, quer über den Pass, von Fels zu Fels. Das Gras darin ist aschgrau, der Bach fließt ohne Rauschen hindurch. Es bewegt sich nicht. Es wartet.
- else:
    Ein dünner grauer Hauch über den Steinen, quer über den Pass, wie Staub auf einem Regal. Nicht viel. Aber genug, dass der Bach darin verstummt.
}
* {kann_zaubern(u_spalt)} [Den Pass mit {element_dativ(element)} aufwecken und mitten hindurch (Zauber)]
    ~ temp z_spalt = zauber(u_spalt)
    ~ probe_zeile("Zauber", z_spalt)
    -> durch_den_pass(z_spalt)
* [Laut sein. Singen, pfeifen, rufen, und mitten hindurch (Ausstrahlung)]
    ~ temp dicke = 0
    { ruf_vardholm == 0:
        ~ dicke = -1
    }
    { tickwort_pfeife:
        Du ziehst Tickworts Pfeife aus der Tasche.
    }
    ~ temp e_spalt = probe(ausstrahlung + laerm_bonus() + dicke)
    ~ probe_zeile("Ausstrahlung", e_spalt)
    -> durch_den_pass(e_spalt)

= durch_den_pass(e)
{ e:
- ERFOLG:
    Ihr geht hinein, und ihr seid laut. {element == "erde":Die Felsen dröhnen mit.}{element == "wasser":Der Bach rauscht auf, als hätte er nur gewartet.}{element == "feuer":Funken tanzen über die Steine.}{element == "wind":Der Wind heult durch den Pass.} {tickwort_pfeife:Tickworts Pfeife klingt wie zehn Ziegen, genau wie versprochen.} Das Grau weicht vor euch zurück wie Wasser vor einem Stein, und ihr geht trocken hindurch.
- JA_ABER:
    Ihr geht hinein. In der Mitte wird es plötzlich so still, dass du vergisst, warum du hier bist. Du bleibst stehen. Dein Kopf ist leer und grau.
    { freund_kommt_mit:
        Dann packt dich {freund()} an der Hand und zieht. „Weiter! Nicht stehen bleiben!“
    - else:
        { singlampe:
            Dann singt Mirks Lampe in deiner Tasche, hell und dünn, und du weißt es wieder.
        - else:
            Dann stolperst du über einen Stein, und der Schmerz im Zeh holt dich zurück.
        }
    }
    Du läufst. Auf der anderen Seite rauscht der Bach wieder, und du atmest, als wärst du getaucht.
- else:
    Ihr geht hinein. Es ist zu viel Grau und zu wenig Lärm. Deine Stimme wird leiser, deine Schritte langsamer, und irgendwann setzt du dich einfach hin. Nur kurz. Nur einen Augenblick.
    ~ p7_erschoepft = true
    Als du aufwachst, liegst du im Gras, auf der anderen Seite des Passes. Die Sonne steht tief.
    { freund_kommt_mit:
        {freund()} sitzt neben dir, verschwitzt und blass. „Ich hab dich getragen“, sagt {fr_er()}. „Du bist schwerer, als du aussiehst.“
    - else:
        { strell_gerettet:
            Strell sitzt neben dir. „Jetzt sind wir quitt“, sagt er. Dann, nach einer Weile: „Nein. Sind wir nicht. Aber fast.“
        - else:
            Niemand ist da. Aber neben dir im Staub ist eine Spur: Stiefelabdrücke, voller grauem Bergstaub, und daneben das runde Loch eines Wanderstabs. Jemand hat dich hierhergetragen. Und ist gegangen, bevor du aufgewacht bist.
        }
    }
}
{ strell_gerettet:
    Am Pass bleibt Strell stehen. „Weiter geh ich nicht“, sagt er. „Da drüben bin ich niemand. Hier bin ich wenigstens jemand, der etwas gutzumachen hat.“
}
Und dann stehst du oben und siehst nach Osten.
->->


// ---------------------------------------------------------------------
// Über die Gipfel
// ---------------------------------------------------------------------
=== p7_gipfel
# bild: entdeckung/aufstieg-suedarm
Einen Tag lang wanderst du nach Süden, quer über die Weiden, bis die Berge vor dir hochwachsen wie eine Mauer. In Ginsterhof bellen die Hunde.
{ jorrit_getroffen:
    Jorrit sitzt vor seiner Hütte und flickt einen Ziegenstrick. Er sieht dich kommen und grinst mit seinen drei Zähnen. „Wusst ich's doch“, sagt er. „Wer einmal den Wolfspfad kennt, der will ihn auch gehen.“
}
{ wolfspfad_bekannt:
    -> wolfspfad
}
-> ziegenstiege

= wolfspfad
# bild: szene/wolfspfad
Der Wolfspfad ist kaum ein Pfad. Eine Spur zwischen Felsen, Ginster und Geröll, neben der Ziegenstiege, aber ein gutes Stück weiter östlich. Unten siehst du die Fackeln der Waage an der Stiege. {waage_gestuerzt:Sie sind aus.|Sie brennen noch.} Hier oben brennt keine.
{ jorrit_getroffen:
    Jorrit geht voran, mit einem Stock und erstaunlich schnellen Beinen. „Bis zum Grat“, sagt er. „Dann {freund_kommt_mit:seid ihr|bist du} allein. Ich bin zu alt für das, was dahinter ist.“
}
{ gnolle_verraten:
    -> gnolle_wuetend
}
{ gnolle_geholfen || gnolle_vermittelt || gnollstein:
    -> gnolle_helfen
}
Einmal siehst du oben auf einem Felsen eine Gestalt mit runden Ohren, die dich beobachtet. Als du wieder hinsiehst, ist sie fort. Die Gnolle wissen, dass du hier bist. Sie lassen dich gehen.
-> grat(0)

= gnolle_helfen
Auf halber Höhe stehen sie plötzlich zwischen den Felsen. Gnolle, fünf, sechs, mit Speeren, die sie wie Wanderstöcke halten. Und in der Mitte, auf ihren Stock gestützt, eine alte Gnollin mit grauem Fell.

Ashka.
{ gnollstein:
    Du ziehst den Stein aus der Tasche, den sie dir geschenkt hat. Ashka sieht ihn an und lacht, ein heiseres, bellendes Lachen. „Freund“, sagt sie. „Das hab ich dir doch gesagt.“
}
{ wuk_gerettet:
    Etwas Kleines, Fleckiges schießt zwischen den Beinen der Großen hervor und rennt dich fast um. Wuk. Er ist gewachsen. Er schnüffelt an deinen Händen und quietscht.
}
„Du gehst hinaus“, sagt Ashka. „Wir sind hereingekommen. Das ist der Lauf der Dinge. Komm. Wir tragen dein Bündel bis zum Grat. Gnolle sind gute Träger. Und schlechte Sänger.“
Und dann singen sie trotzdem, den ganzen Weg hinauf. Es klingt furchtbar. Es ist wunderbar.
-> grat(1)

= gnolle_wuetend
Auf halber Höhe stehen sie zwischen den Felsen und versperren den Pfad. Gnolle, fünf, sechs, mit gesenkten Speeren. In der Mitte Ashka. Ihre gelben Augen sind kalt.

„Du“, sagt sie. „Du hast uns an die Waage verraten. Wegen dir haben die Söldner drei von uns in Käfige gesteckt. Ohne Himmel.“ Sie spuckt auf den Stein. „Was willst du hier?“
* [„Es tut mir leid. Ich hatte Angst, und ich hab falsch entschieden.“ (Ausstrahlung)]
    ~ temp e_gnoll = probe(ausstrahlung)
    ~ probe_zeile("Ausstrahlung", e_gnoll)
    { e_gnoll:
    - ERFOLG:
        Ashka sieht dich lange an. Dann tritt sie zur Seite. „Ein Mensch, der sagt, dass er falsch war“, murmelt sie. „Das hab ich in diesem Land noch nicht gehört. Geh.“
    - JA_ABER:
        Ashka schnaubt. „Worte“, sagt sie. Aber sie tritt zur Seite. Die anderen Gnolle knurren, als du vorbeigehst. Du spürst ihre Blicke im Rücken, bis zum Grat.
    - else:
        „Worte“, sagt Ashka und wendet sich ab. Die Gnolle rühren sich nicht. Du musst umkehren und einen anderen Weg suchen, über loses Geröll und durch eine eiskalte Rinne. Es dauert bis zum Abend.
        ~ p7_erschoepft = true
    }
* [Umkehren und einen Umweg über das Geröll suchen (Geschick)]
    ~ temp e_umweg = probe(geschick)
    ~ probe_zeile("Geschick", e_umweg)
    { e_umweg:
    - ERFOLG:
        Du kletterst um die Gnolle herum, über Platten und Geröll, und erreichst den Pfad weiter oben. Niemand folgt dir.
    - else:
        Das Geröll rutscht unter dir weg. Du schlitterst, fängst dich, kletterst wieder hinauf. Und wieder. Als du endlich oben bist, sind deine Hände aufgeschürft und die Sonne steht tief.
        ~ p7_erschoepft = true
    }
- -> grat(0)

= ziegenstiege
# bild: szene/ziegenstiege-fackeln
Die Ziegenstiege windet sich in engen Kehren den Berg hinauf. Alle hundert Schritte ein Pfahl mit einer Fackel der Waage.
{ waage_gestuerzt:
    Aber die Fackeln sind aus. Die Wachhütte am ersten Pfahl ist leer, die Tür steht offen. Seit der Rat die Festung übernommen hat, bewacht hier niemand mehr irgendwas.
    -> grat(0)
}
Und an der dritten Kehre steht eine Wachhütte, aus deren Schornstein Rauch steigt. Zwei Söldner sitzen davor und würfeln.
* [Im Dunkeln vorbeischleichen (Geschick)]
    ~ temp e_stiege = probe(geschick)
    ~ probe_zeile("Geschick", e_stiege)
    -> stiege_ergebnis(e_stiege)
* {kann_zaubern(0)} [Mit {element_dativ(element)} für Ablenkung sorgen (Zauber)]
    ~ temp z_stiege = zauber(0)
    ~ probe_zeile("Zauber", z_stiege)
    {element == "erde":Ein Stück weiter unten poltert eine Steinlawine den Hang hinab.}{element == "wasser":Aus dem Bach neben der Hütte spritzt eine Fontäne in den Schornstein.}{element == "feuer":Die Fackel an der nächsten Kehre lodert plötzlich auf wie ein Signalfeuer.}{element == "wind":Ein Windstoß reißt den Söldnern die Würfel vom Tisch und die Kappen vom Kopf.}
    -> stiege_ergebnis(z_stiege)

= stiege_ergebnis(e)
{ e:
- ERFOLG:
    Die Söldner sehen in die andere Richtung, und du huschst an der Hütte vorbei. Niemand ruft dir nach.
- JA_ABER:
    Du kommst vorbei. Aber einer der Söldner sieht noch einen Schatten und ruft: „Halt!“ Du rennst. Steine poltern hinter dir. Sie folgen dir nicht weit, aber du musst einen steileren Weg nehmen als geplant.
- else:
    „Halt!“ Die Söldner springen auf. Du rennst, quer über den Hang, über Geröll, durch Ginster, bis du keine Luft mehr bekommst. Dein Bündel bleibt an einem Dornbusch hängen. Den Käse, das Brot, alles Essen ist weg. Aber du bist entkommen.
    ~ p7_erschoepft = true
}
-> grat(0)

= grat(hilfe)
# bild: szene/am-grat
Oben am Grat ist der Sommer vorbei. Schnee in den Rinnen, Eis auf den Steinen, und der Wind schneidet dir ins Gesicht.
~ temp windig = 0
{ element == "wind":
    ~ windig = 1
    Aber der Wind kennt dich. Er schiebt dich, statt dich zu stoßen.
}
~ temp e_grat = probe(kraft + hilfe + windig)
~ probe_zeile("Kraft", e_grat)
{ e_grat:
- ERFOLG:
    Schritt um Schritt kämpfst du dich hinauf, bis du oben stehst, auf dem höchsten Punkt, mit dem Wind im Rücken.
- JA_ABER:
    Kurz vor dem Grat rutschst du auf dem Eis aus. Du schlitterst, greifst ins Leere, und dann hält dich etwas. Das Seil. {bp()}s Seil, das du dir um den Bauch gebunden hast. {freund_kommt_mit:Am anderen Ende hängt {freund()} mit {fr_sein()}em ganzen Gewicht.|Am anderen Ende ist es um einen Felszacken geschlungen.} „Ein Seil braucht man immer“, hörst du {bp()} sagen. Und du kletterst weiter.
- else:
    Der Sturm wird so stark, dass du dich hinter einen Felsen kauern musst. Du verbringst die Nacht dort, zitternd, {freund_kommt_mit:eng an {freund()} gedrückt, unter beiden Mänteln,|eingerollt wie eine Katze,} und erst am Morgen legt sich der Wind.
    ~ p7_erschoepft = true
}
Und dann siehst du nach Osten.
->->


// ---------------------------------------------------------------------
// Unter dem Berg
// ---------------------------------------------------------------------
=== p7_tiefe
# bild: entdeckung/minentor
Zwei Tage den Orin hinauf, auf einem leeren Erzkahn. Dann stehst du wieder vor dem großen Tor im Berg.
{ ruf_kobolde >= 1 || vermisste_gerettet:
    -> mit_mirk
}
-> ohne_mirk

= mit_mirk
Mirk wartet schon. Die Nachricht ist schneller den Fluss hinaufgekommen als du. Sie schiebt ihre gesprungene Brille hoch. „Mirk wusste, dass du wiederkommst“, sagt sie. „Alle kommen wieder in den Berg. Aber du willst durch. Das ist neu.“
{ grisk_begleitet || kobold_gerettet:
    Neben ihr steht Grisk, mit Helm und frisch geputzter Lampe. „Grisk geht mit“, sagt er. „Grisk vergisst nicht.“
}
„Bis zum Herz“, sagt Mirk. „Dann musst du allein weiter. Kobolde gehen nicht nach draußen. Draußen ist zu viel Himmel.“
-> schlund(1)

= ohne_mirk
Die Kobolde am Tor sehen dich an und schweigen. Niemand bietet dir eine Lampe an. Niemand zeigt dir den Weg. Du musst allein hinunter.
{ singlampe:
    Nur Mirks Lampe in deiner Tasche summt leise, als wollte sie sagen: Ich kenne den Weg.
}
-> schlund(0)

= schlund(hilfe)
# bild: szene/der-schlund
Die Tiefe Stiege hinab, Stufe um Stufe, bis zum Schlund.
{ runen_gelernt || hilfe > 0:
    Diesmal weißt du, wo der Steg ist. Der Strich unter dem Bogen, das alte Zeichen an der Wand, und darunter der schmale Pfad im Fels. Du gehst hinüber, den Rücken an der Wand, und siehst nicht nach unten.
    -> herz_vorbei
}
Der Abgrund. Die zwei rostigen Ketten. Gegenüber geht die Treppe weiter.
~ temp e_schlund = probe(geschick)
~ probe_zeile("Geschick", e_schlund)
{ e_schlund:
- ERFOLG:
    Du findest den Steg im Fels, schmal wie ein Brett, und kommst hinüber.
- JA_ABER:
    Du findest den Steg. In der Mitte bricht ein Stück weg, und dein Fuß tritt ins Leere. Du kannst dich gerade noch halten. Drüben sitzt du lange auf der Stufe, bis deine Knie aufhören zu zittern.
- else:
    Der Steg bricht unter dir weg. Du fällst, einen schrecklichen Augenblick lang, und dann reißt es dich hart am Bauch. Das Seil. {bp()}s Seil, das du dir umgebunden und an die Kette geknotet hast. Es dauert lange, bis du dich hinaufgezogen hast. Sehr lange.
    ~ p7_erschoepft = true
}
-> herz_vorbei

= herz_vorbei
# bild: szene/herz-wiedersehen
Weiter unten zweigt der alte Gang nach Osten ab. Aber vorher, nur ein paar Schritte entfernt, liegt die Höhle mit dem Herz.

Du siehst es von der Schwelle aus. Der Kristall, groß wie ein Haus, die vier Lichter darin. Der Riss.
{ stollen_versiegelt:
    Das Grau sickert nicht mehr. Der Riss ist noch da, aber er ist dunkel und still, wie eine Narbe.
- else:
    Aus dem Riss sickert immer noch das Grau. Mehr als beim letzten Mal.
}
{ herzsplitter:
    -> splitter_wahl
}
-> ostgang

= splitter_wahl
In deiner Tasche summt der Splitter. Lauter als sonst. Als würde er nach Hause wollen.
* [Den Splitter zurückgeben]
    ~ herzsplitter = false
    ~ herz_beruhigt = true
    Du gehst über die Spirale aus vier Linien, bis du direkt unter dem Kristall stehst. Du wickelst den Splitter aus und hältst ihn hoch.
    Er fliegt dir aus der Hand. Einfach so. Er schwebt hinauf, dreht sich, und setzt sich in den Riss, genau dorthin, wo er hingehört. Die vier Lichter flackern. Dann leuchten sie heller.
    Der Riss ist nicht geheilt. Aber er ist ein kleines Stück kürzer. Und für einen Herzschlag hörst du alle vier Elemente gleichzeitig, und sie klingen wie ein Seufzer.
* [Ihn behalten. Da draußen braucht vielleicht jemand den Beweis.]
    Du legst die Hand auf die Tasche. „Ich bring ihn zurück“, flüsterst du. „Wenn ich weiß, wie man dich heilt.“
    Der Splitter summt weiter. Vielleicht ist das ein Ja.
- -> ostgang

= ostgang
{ ruf_kobolde >= 1 || vermisste_gerettet:
    Mirk drückt dir die Hand. Sie ist kalt und rau. „Mirk wird eine Lampe für dich anzünden“, sagt sie. „Jeden Abend. Bis du wiederkommst.“ {grisk_begleitet || kobold_gerettet:Grisk sagt nichts. Er nimmt nur seine Lampe vom Helm und hängt sie dir um den Hals.}
}
Der alte Gang ist schnurgerade, lang wie ein Fernrohr. Ganz hinten ist der Punkt aus Licht. Er sieht nicht näher aus als beim letzten Mal.
~ temp gang_hilfe = 0
{ runen_gelernt:
    ~ gang_hilfe += 1
}
{ not stollen_versiegelt:
    ~ gang_hilfe -= 1
}
~ temp e_gang = probe(verstand + gang_hilfe + laerm_bonus())
~ probe_zeile("Verstand", e_gang)
{ e_gang:
- ERFOLG:
    Du zählst die Zwergenzeichen an der Wand. Alle hundert Schritte eins. Du gehst, und zählst, und singst, wenn das Grau zu nah kommt, und irgendwann wird der Punkt größer. Und größer.
- JA_ABER:
    Irgendwann teilt sich der Gang, und du nimmst den falschen Weg. Eine Stunde lang, vielleicht zwei. Dann findest du zurück, an einem Zeichen, das du schon kennst. {freund_kommt_mit:„Wir sind im Kreis gegangen“, sagt {freund()}. „Ich hab's gemerkt. Ich wollte nur nichts sagen.“}
- else:
    Das Grau kriecht von hinten heran, und die Dunkelheit wird so dick, dass du die Wand nicht mehr siehst. Du gehst und gehst, und weißt irgendwann nicht mehr, wie lange schon. Einen Tag? Zwei? Als du endlich das Licht erreichst, bist du so müde, dass du dich einfach ins Gras fallen lässt.
    ~ p7_erschoepft = true
}
# bild: szene/zwergentor-ost
Am Ende des Gangs steht ein Tor. Kleiner als das Minentor, aber mit denselben eckigen Zeichen. Es steht einen Spalt offen. Dahinter: Himmel.

Du trittst hinaus, blinzelnd, und siehst nach Osten.
->->


// ---------------------------------------------------------------------
// Übers Meer
// ---------------------------------------------------------------------
=== p7_meer
# bild: szene/schwarzwasserbucht
{ hintergrund == "schiffsjunge":
    -> mit_rhea
}
-> mit_haldor

= mit_rhea
Kapitänin Rhea hat nicht lange gefragt. „Die Seemöwe ist ein Handelsschiff“, sagt sie. „Und der Handel liegt still, seit die Waage die Küste bewacht. Ich habe also nichts Besseres zu tun.“ Ein seltenes Lächeln. „Außerdem habe ich dir das Segeln beigebracht. Ich lasse dich nicht mit irgendwem fahren.“

In der Nacht liegt die Seemöwe in der Schwarzwasserbucht, ohne Laterne, die Segel gerefft. Rhea steht am Ruder.
-> kueste

= mit_haldor
{ gilde == "leise_hand" || ruf_leise_hand >= 2:
    Fink bringt dich hin. Er sagt nur: „Die Leise Hand hat ein Boot. Die Leise Hand hat immer ein Boot.“
- else:
    Nerelle hat jemandem Bescheid gesagt. Jemandem, der nachts ohne Laterne fährt.
}
In der Schwarzwasserbucht liegt ein schmales Boot mit schwarzen Segeln, die Nachtfalter. Am Ruder steht ein Mann mit einem gestreiften Hemd, einem goldenen Ohrring und sehr viel Bart. „Haldor“, sagt er und reicht dir eine Hand, die sich anfühlt wie ein Tau. „Wenn ich ‚runter‘ sage, gehst du runter. Wenn ich ‚still‘ sage, bist du still. Sonst darfst du alles.“
-> kueste

= kueste
Ihr legt ab. Die Bucht ist schwarz wie Tinte. Nur die Sterne, und das Klatschen der Wellen am Rumpf.
{ waage_gestuerzt:
    An der Küste stehen die neuen Türme der Waage. Ihre Lichter sind aus. Seit Vardholm hat niemand mehr Lust, für die Waage aufs Meer zu starren. Ihr gleitet vorbei wie ein Schatten.
    -> kap
}
An der Küste stehen die neuen Türme der Waage. Auf jedem brennt ein Licht, und ein großer Spiegel dreht es langsam über das Wasser. Hin. Und her.

„Still“, sagt {hintergrund == "schiffsjunge":Rhea|Haldor}.
* [Ganz still sitzen und im richtigen Moment das Zeichen geben (Geschick)]
    ~ temp e_kueste = probe(geschick)
    ~ probe_zeile("Geschick", e_kueste)
    -> kueste_ergebnis(e_kueste)
* {kann_zaubern(1) && (element == "wasser" || element == "wind")} [{element == "wasser":Nebel aus dem Meer steigen lassen|Den Wind leise in die Segel legen} (Zauber)]
    ~ temp z_kueste = zauber(1)
    ~ probe_zeile("Zauber", z_kueste)
    {element == "wasser":Vom Wasser steigt Nebel auf, weich und weiß, ein ganz gewöhnlicher Meernebel, und hüllt das Boot ein.|Der Wind legt sich in die Segel, so leise wie ein Atemzug, und das Boot gleitet schneller.}
    -> kueste_ergebnis(z_kueste)
* {kann_zaubern(0) && (element == "erde" || element == "feuer")} [{element == "erde":Am Fuß des Turms ein paar Steine poltern lassen|Das Licht im Turm flackern lassen} (Zauber)]
    ~ temp z_kueste2 = zauber(0)
    ~ probe_zeile("Zauber", z_kueste2)
    {element == "erde":Unten am Turm poltert Geröll ins Meer. Der Spiegel dreht sich hin, zum Geräusch.|Das Licht auf dem Turm flackert und geht für drei Atemzüge aus.}
    -> kueste_ergebnis(z_kueste2)

= kueste_ergebnis(e)
{ e:
- ERFOLG:
    Das Licht wandert über das Wasser, knapp an euch vorbei. Und dann seid ihr hinter der Landzunge, und niemand hat euch gesehen.
- JA_ABER:
    Das Licht streift das Heck. Einen Moment lang ist alles hell. Auf dem Turm ruft jemand. Aber bis sie ein Boot im Wasser haben, seid ihr längst hinter der Landzunge.
- else:
    Das Licht trifft euch voll. Auf dem Turm läutet eine Glocke. Ein Boot der Waage legt ab, mit vier Ruderern. „Runter!“, brüllt {hintergrund == "schiffsjunge":Rhea|Haldor}, und du wirfst dich flach auf die Planken. Es wird eine lange, nasse Jagd, zwischen Klippen hindurch, durch Wellen, die über das Deck schlagen. Erst im Morgengrauen geben sie auf.
    ~ p7_erschoepft = true
}
-> kap

= kap
# bild: szene/sturm-am-kap
Am Kap, wo der Südarm des Kamms ins Meer stürzt, wird das Wasser wild. Wellen, hoch wie Häuser, die gegen die Klippen donnern. Das Boot hebt sich und fällt, hebt sich und fällt.

„Halt das Tau!“, schreit {hintergrund == "schiffsjunge":Rhea|Haldor}. „Egal, was passiert! Halt es!“
~ temp see = 0
{ element == "wasser" || element == "wind":
    ~ see = 1
    Das Meer kennt dich. Der Wind kennt dich. Es hilft ein bisschen.
}
{ hintergrund == "schiffsjunge":
    ~ see += 1
}
~ temp e_kap = probe(kraft + see)
~ probe_zeile("Kraft", e_kap)
{ e_kap:
- ERFOLG:
    Du hältst das Tau. Die ganze Nacht. Deine Hände brennen, deine Arme zittern, aber du hältst es. Und als die Sonne aufgeht, ist das Kap hinter euch, und das Meer ist auf einmal ganz ruhig, als hätte es nur geprüft, ob du es ernst meinst.
- JA_ABER:
    Eine Welle reißt dir das Tau aus den Händen. Der Mast kracht. Aber {freund_kommt_mit:{freund()} fängt das Tau, und zusammen haltet ihr es|du fängst das Tau wieder, und hältst es}, bis der Sturm vorbei ist. Das Boot humpelt um das Kap, mit einem gebrochenen Mast. Aber es schwimmt.
- else:
    Eine Welle hebt dich vom Deck. Einen Augenblick lang ist nur Wasser um dich, kalt und schwarz und laut. Dann reißt es dich am Bauch. {bp()}s Seil. Du hast es dir umgebunden und an den Mast geknotet. {hintergrund == "schiffsjunge":Rhea|Haldor} zieht dich zurück an Bord, und du liegst auf den Planken und spuckst Meer.
    ~ p7_erschoepft = true
}
Am Morgen setzt das Boot dich an einem Strand ab, auf der anderen Seite der Berge. Ein kleines Fischerdorf liegt dort, mit Booten im Sand.
{ hintergrund == "schiffsjunge":
    Rhea umarmt dich. Das hat sie noch nie getan. „Ich warte hier drei Tage“, sagt sie. „Dann fahre ich zurück. Und dann sage ich allen, dass du es geschafft hast.“
- else:
    Haldor tippt sich an die Stirn. „Viel Glück“, sagt er. „Das Meer hat dich gemocht. Das tut es nicht mit jedem.“
}
Du gehst den Strand hinauf und siehst nach Osten.
->->
