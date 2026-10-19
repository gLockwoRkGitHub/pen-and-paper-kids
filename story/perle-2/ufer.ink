// =====================================================================
// Perle 2 – Morgen im Räderviertel und die Spuren am Ufer
// =====================================================================

=== p2_morgen
# bild: entdeckung/raederviertel
# karte: raederviertel
{ tickwort_bei_goblins:
    Du wachst auf, weil irgendwo in der Werkstatt von Knallfunke & Söhne etwas explodiert. Kurz danach hörst du Tickworts Stimme: „… und deshalb, Unterpunkt sechs, legt man den Zünder nicht auf den Herd.“ Du musst lächeln.
}
{ kompass:
    Du klappst Tickworts Kompass auf. Die Nadel zittert. Dann zeigt sie nach Osten, den Fluss hinauf.
}

Das Räderviertel beginnt dort, wo der Orin die Stadt erreicht. Hier gehört alles der Gilde von Webstuhl und Amboss.

Am Ufer drehen sich Wasserräder, so hoch wie Häuser, eines neben dem anderen. Sie knarren und ächzen und treiben Webstühle, Blasebälge und Hämmer an. Aus den Schmieden steigt Rauch, aus den Färbereien bunter Dampf. Über allem liegt ein Geräusch wie ein riesiges Herz: wumm, wumm, wumm.

Und auf einem Poller am Ufer sitzt jemand, der hier ganz und gar nicht hingehört.

# bild: figur/freund-{freund_kurz()}
{freund()} trägt eine viel zu große Arbeiterjacke, eine Mütze, unter der {fr_sein()}e Haare hervorquellen, und Schuhe aus feinstem Leder mit silbernen Schnallen. Als {fr_er()} dich sieht, springt {fr_er()} auf.

„Da bist du ja! Ich warte schon seit Sonnenaufgang. Na ja, seit kurz nach Sonnenaufgang. Magister Pell schläft lange.“
{
- freund_will_mit:
    „Du hast gesagt, zu zweit ist es weniger langweilig“, sagt {freund()}. „Also bin ich da.“
- p1_freund.kennenlernen.gefaehrlich:
    „Du hast gesagt, es ist gefährlich“, sagt {freund()}. „Darum bin ich ja hier.“
- else:
    „Du hast gesagt, du kennst mich nicht“, sagt {freund()}. „Heute kennst du mich ein bisschen mehr.“
}
{Fr_er()} zupft an der Jacke. „Ich bin verkleidet. Merkt man gar nicht, oder?“
* [„Gar nicht. Bis auf die Schuhe.“]
    ~ aendern(beziehung_freund, 1)
    {freund()} sieht an sich herunter und seufzt. „Die Schuhe. Immer die Schuhe.“ Dann grinst {fr_er()}. „Egal. Was machen wir?“
* [„Du solltest nicht hier sein. Nach gestern …“]
    „Gerade nach gestern!“, sagt {freund()}. „Der Spalt ist zu. Du suchst einen anderen Weg. Und ich will dabei sein, wenn du ihn findest.“
* [„Wie hast du mich gefunden?“]
    „Ich bin dir gestern Abend nachgeschlichen. Bis zur Goblin-Werkstatt. Und Tickwort redet sehr laut.“ {freund()} zuckt mit den Schultern.
- Du erzählst, was Tickwort gestern gesagt hat: Wer Erz aus den Bergen holt, kennt die Berge. Wenn jemand einen anderen Weg hinaus kennt, dann hier.

* [Dich ans Ufer hocken und die Hand ins kalte Flusswasser halten]
    ~ neigung_wasser += 1
    Du hockst dich ans Ufer und hältst die Hand in den Orin. Das Wasser ist eiskalt, es kommt direkt aus den Bergen. Es zieht an deinen Fingern, als wollte es dich mitnehmen. Flussaufwärts, dorthin, wo es herkommt.
* [Den Wasserrädern zusehen]
    Du siehst den Rädern zu, wie sie sich drehen, unermüdlich, Schaufel um Schaufel.
- „Dann fragen wir rum“, sagt {freund()}. „Ich bin sehr gut im Rumfragen. Glaube ich. Ich hab es noch nie probiert.“
->->


=== p2_ufer
{ spuren >= 3:
    ->->
}
{ spuren:
- 0:
    Wo wollt ihr anfangen?
- 1:
    Die Sonne steht schon hoch über den Rädern. Wohin als Nächstes?
- else:
    Es ist Mittag. {freund()} kauft an einem Stand zwei heiße Brezeln und reicht dir eine. „Einer fehlt noch“, sagt {fr_er()} mit vollem Mund. „Dann haben wir alle gefragt.“
}
+ {not p2_erzlaende} [Zur Erzlände, wo die Kobolde die Kähne entladen]
    -> p2_erzlaende
+ {not p2_tuchhalle} [In die große Tuchhalle der Gilde]
    -> p2_tuchhalle
+ {not p2_schmiede} [Zur Großen Schmiede mit der riesigen Esse]
    -> p2_schmiede


// ---------------------------------------------------------------------
// Spur: Die Erzlände und die Kobolde
// ---------------------------------------------------------------------
=== p2_erzlaende
# karte: erzlaende
# bild: szene/erzlaende
An der Erzlände legen flache Kähne an, schwer beladen mit grauem Gestein. Sie kommen den Orin herunter, direkt aus den Bergen. Kobolde mit Grubenlampen auf den Helmen schaufeln das Erz in die Karren der Gilde.
{
- kobold_gerettet:
    -> grisk_freund
- kobold_ignoriert:
    -> grisk_kalt
- else:
    -> mirk
}

= grisk_freund
~ grisk_wiedergesehen = true
Einer der Kobolde lässt die Schaufel fallen. „Freund von Grisk!“, quiekt er und rennt auf dich zu. Die anderen Kobolde sehen dich neugierig an.

„Das ist {geschlecht == "w":die|der}, {geschlecht == "w":die|der} Grisk gerettet hat“, erklärt Grisk ihnen stolz. {erzmarke:„Hat die Erzmarke. Zeig!“ Du hältst die Marke hoch, und die Kobolde nicken einander zu, als hättest du ein Losungswort gesagt.}

Als du nach einem Weg durch die Berge fragst, wird Grisk ernst. Er zieht dich hinter einen Erzhaufen.
-> stollen

= grisk_kalt
Einer der Kobolde hebt den Kopf. Grisk. Er erkennt dich sofort. Er sagt nichts, dreht dir nur den Rücken zu und schaufelt weiter, ein bisschen heftiger als vorher.

Die anderen Kobolde zischen leise.
* [Dich bei Grisk entschuldigen (Ausstrahlung)]
    ~ temp e = probe(ausstrahlung)
    ~ probe_zeile("Ausstrahlung", e)
    { e:
    - ERFOLG:
        ~ grisk_wiedergesehen = true
        ~ aendern(ruf_kobolde, 1)
        „Ich hätte dir helfen sollen“, sagst du. „Es tut mir leid.“
        Grisk hält inne. Lange. Dann dreht er sich um. „{volk_wort()} sagt Entschuldigung“, murmelt er. „Selten.“ Er wirft die Schaufel weg. „Gut. Grisk redet. Ein bisschen.“
        -> stollen
    - JA_ABER:
        Grisk hört dir zu. „Worte sind leicht“, sagt er. „Grisk merkt sich Taten.“ Mehr sagt er nicht. Aber als du gehst, ruft er dir nach: „Nicht tief in den Berg gehen! Der Berg brummt!“
        ~ berg_brummt = true
        -> erz_ende
    - else:
        Grisk spuckt aus. „Grisk vergisst nicht“, sagt er. „Auch das nicht.“
        -> erz_ende
    }
* [Ihn in Ruhe lassen]
    Du lässt ihn in Ruhe. Manchmal ist das das Einzige, was man noch richtig machen kann.
    -> erz_ende

= mirk
{ p1_hafen:
    Hinter den Kähnen winkt ein grauschuppiger Kobold. Grisk. „{geschlecht == "w":Große Heldin|Großer Held}, {geschlecht == "w":die|der} nicht schwimmt!“, ruft er. „Mirk, das ist Freund.“
}
Eine alte Koboldin mit einer gesprungenen Brille auf der Nase brüllt Befehle. Sie heißt Mirk, das steht in Kreide auf ihrem Helm. Als du sie ansprechen willst, winkt sie ab. „Keine Zeit! Erz muss raus!“
* [Mit anpacken und einen Erzsack schleppen (Kraft)]
    ~ temp e = probe(kraft)
    ~ probe_zeile("Kraft", e)
    { e:
    - ERFOLG:
        ~ aendern(ruf_kobolde, 1)
        Du schulterst einen Sack und trägst ihn zum Karren, dann noch einen und noch einen. Mirk sieht dir zu und nickt anerkennend. „Stark. Gut. Jetzt hat Mirk Zeit.“
        -> stollen
    - JA_ABER:
        Der Sack ist schwerer als gedacht. Du schaffst es bis zum Karren, aber dann lässt du ihn fallen, und das halbe Erz kullert über das Pflaster. Mirk seufzt. „Zwei Minuten“, sagt sie. „Dann muss Mirk wieder arbeiten.“
        -> stollen
    - else:
        Du hebst den Sack an. Der Sack bleibt, wo er ist. Mirk lacht so sehr, dass ihre Brille verrutscht. „Gut gelacht. Dafür bekommst du eine Antwort.“
        -> stollen
    }
* [Mirk mit einer Frage locken, die sie neugierig macht (Verstand)]
    ~ temp e2 = probe(verstand)
    ~ probe_zeile("Verstand", e2)
    { e2:
    - ERFOLG:
        „Warum kommt nur noch Erz aus den oberen Stollen?“, fragst du. „Das hier ist alles grau. Das dunkle Erz von tief unten fehlt.“
        Mirk erstarrt. Dann legt sie die Schaufel weg. „Kluges Kind“, sagt sie leise. „Komm.“
        -> stollen
    - JA_ABER:
        „Warum ist das Erz hier so grau?“, fragst du.
        Mirk kneift die Augen zusammen. „Kluges Kind. Aber Mirk hat nur kurz Zeit.“ Sie lässt die Schaufel nicht los, während sie redet, und schaut immer wieder zu den Kähnen.
        -> stollen
    - else:
        Mirk sieht dich an, als hättest du gefragt, ob Steine schwimmen können. „Keine Zeit für Fragen“, sagt sie und wendet sich ab.
        -> erz_ende
    }

= stollen
~ tiefe_stiege_bekannt = true
~ berg_brummt = true
„Es gibt alte Wege unter dem Berg“, sagt {grisk_wiedergesehen:Grisk|Mirk} mit gesenkter Stimme. „Sehr alt. Älter als die Minen. Einer heißt die Tiefe Stiege. Geht unter dem Kharvan-Kamm durch. Ganz durch. Bis auf die andere Seite.“

„Dann kann man dort hinaus?“

„Konnte man. Früher.“ {grisk_wiedergesehen:Grisk|Mirk} schaut zu den Bergen hinüber. „Aber seit dem Winter gehen Kobolde nicht mehr tief. Der Berg brummt. Unten, ganz unten. Wie ein riesiger Bienenstock. Und manchmal …“ Die Stimme wird noch leiser. „Manchmal brummt er zurück, wenn man ruft.“

{freund()} rückt ein Stück näher an dich heran.

„Außerdem gehören die Minen der Gilde“, fährt {grisk_wiedergesehen:Grisk|Mirk} fort. „Webstuhl und Amboss. Wer in die Minen will, braucht ein Gildenzeichen.“{grisk_wiedergesehen: Grisk grinst. „Oder Grisk.“}
{ ausloeser == "verschwunden":
    ~ bp_spur = true
    Dann fällt {grisk_wiedergesehen:Grisk|Mirk} noch etwas ein. „Du bist nicht {geschlecht == "w":die Erste|der Erste}, {geschlecht == "w":die|der} fragt. Vor zwei Tagen kam {bp_ist_m():ein Mann|eine Frau}. Mit einem Seil über der Schulter. Wollte alles über die alten Stollen wissen.“
    Dein Herz schlägt schneller. {bp()}.
}
-> erz_ende

= erz_ende
* [Die Hand auf einen der Erzbrocken legen]
    ~ neigung_erde += 1
    Du legst die Hand auf einen der grauen Brocken. Ganz unten im Haufen liegt ein einziger dunkler. Er ist kühl, und als du die Augen schließt, meinst du ganz tief darin etwas zu spüren. Ein leises Summen. Wie ein Lied, das jemand hinter einer dicken Mauer singt.
* [Weitergehen]
    Ihr verlasst die Erzlände.
- ~ spuren += 1
-> p2_ufer


// ---------------------------------------------------------------------
// Spur: Die Tuchhalle der Gilde von Webstuhl und Amboss
// ---------------------------------------------------------------------
=== p2_tuchhalle
# karte: tuchhalle
# bild: szene/tuchhalle
Die Tuchhalle ist so groß wie drei Scheunen hintereinander. Hunderte Webstühle klappern im Takt der Wasserräder, und von der Decke hängen Stoffbahnen in allen Farben: Rot wie Mohn, Blau wie Tinte, Gelb wie Senf. {freund()} bleibt mit offenem Mund stehen.

In der Mitte der Halle steht ein Gnom auf einem Podest und schaut durch ein Fernrohr auf die Webstühle. Auf seiner Weste glänzt ein Abzeichen: ein Webschiffchen, gekreuzt mit einem Hammer.

„Meister Kettrich“, flüstert eine Weberin dir zu. „Hallenmeister. Hat für alles eine Regel. Für wirklich alles.“
{ ausloeser == "schulden" || schulden_versprochen || fesk_getaeuscht || vor_fesk_geflohen:
    -> fesk
}
{ gesehen_worden:
    -> soeldner
}
-> kettrich

= fesk
~ fesk_wiedergesehen = true
Neben dem Podest steht ein dürrer Mann in einem silbergrauen Mantel und blättert in einem dicken Buch. Fesk.

Er sieht dich, bevor du dich verstecken kannst. „Ah“, sagt er und lächelt sein dünnes Lächeln. „Mein Lieblingsschuldner. Der Neumond kommt näher, weißt du. Jeden Tag ein Stückchen.“
{ vor_fesk_geflohen:
    Er tippt auf sein Buch. „Hier gibt es keine Hintertür, nicht wahr? Ich sagte ja: Davonlaufen ist eine teure Antwort.“ Er schreibt etwas hinein und unterstreicht es.
}

Dann wendet er sich wieder Kettrich zu. „Wie gesagt, Meister Kettrich: Das Kontor gibt Ihnen gern noch einen Kredit. Jetzt, wo die Goldene Waage den Spalt geschlossen hat und Ihre Zwergenkunden jenseits der Berge nicht mehr kaufen können …“

Kettrich knurrt etwas, das du nicht verstehst. Fesk geht pfeifend davon.
-> kettrich

= soeldner
Am Tor der Halle stehen zwei Söldner in schwarzen Mänteln mit der goldenen Waage auf der Brust und lassen sich Kisten mit Eisenbeschlägen auf einen Karren laden. Für Vardholm, steht mit Kreide darauf.

Einer der beiden hebt den Kopf und sieht in deine Richtung.
* [Hinter einer Stoffbahn verschwinden (Geschick)]
    ~ temp e = probe(geschick)
    ~ probe_zeile("Geschick", e)
    { e:
    - ERFOLG:
        Du gleitest hinter eine blaue Stoffbahn und hältst den Atem an. Der Söldner sieht noch einen Moment herüber. Dann zuckt er die Schultern.
    - JA_ABER:
        Du verschwindest hinter einer Stoffbahn. Leider ist sie frisch gefärbt. Als du wieder hervorkommst, sind deine Hände und dein halbes Gesicht tintenblau. Aber der Söldner ist weg.
    - else:
        Du stolperst über einen Garnkorb. Der Söldner kneift die Augen zusammen und macht einen Schritt auf dich zu. Da schiebt sich {freund()} zwischen euch, hebt das Kinn und sagt in einem Ton, den du noch nie bei {fr_ihm()} gehört hast: „Gibt es ein Problem?“
        Der Söldner sieht {fr_ihn()} an, dann die feinen Schuhe. Er wird blass, murmelt eine Entschuldigung und geht.
        „Schuhe“, sagt {freund()} leise. „Manchmal sind sie doch zu etwas gut.“
    }
* [So tun, als würdest du hier arbeiten]
    Du schnappst dir einen Korb mit Garn und läufst zielstrebig an den Webstühlen entlang, als hättest du das schon tausendmal getan. Niemand hält dich auf.
- ~ vardholm_hinweis = true
-> kettrich

= kettrich
Kettrich klettert von seinem Podest und mustert euch durch eine Brille mit drei Gläsern übereinander. „Besucher? In meiner Halle gelten Regeln. Regel eins: nichts anfassen. Regel zwei: siehe Regel eins.“
* [Höflich nach einem Weg durch die Berge fragen (Ausstrahlung)]
    ~ temp e = probe(ausstrahlung)
    ~ probe_zeile("Ausstrahlung", e)
    { e:
    - ERFOLG:
        ~ aendern(ruf_webstuhl_amboss, 1)
        Kettrich hört sich deine Frage an. Dann nimmt er die Brille ab, und plötzlich sieht er gar nicht mehr streng aus. Nur müde.
        -> kettrich_redet
    - JA_ABER:
        Kettrich verzieht das Gesicht. „Fragen kosten Zeit. Zeit kostet Geld.“ Aber dann redet er doch.
        -> kettrich_redet
    - else:
        „Regel vierzehn“, sagt Kettrich. „Keine Auskünfte an Unbekannte.“ Er klettert zurück auf sein Podest. Aber eine Weberin flüstert dir im Hinausgehen zu, was alle in der Halle wissen.
        -> kettrich_geruecht
    }
* {hintergrund == "kartografenlehrling" || hintergrund == "botenlaeufer"} [({hintergrund == "kartografenlehrling":Kartografenlehrling|Botenläufer}) Erwähnen, für wen du schon gearbeitet hast]
    Du erzählst, für wen du schon gearbeitet hast. Kettrich zieht die Augenbrauen hoch. „Jemand mit Empfehlungen. Wie erfrischend.“
    ~ aendern(ruf_webstuhl_amboss, 1)
    -> kettrich_redet
* [{freund()} reden lassen]
    {freund()} strahlt Kettrich an und erzählt, wie wunderbar die Farben sind und wie klug die Webstühle und wie beeindruckend das Podest. Kettrich wird ein kleines bisschen größer.
    -> kettrich_redet

= kettrich_redet
~ gilde_bietet_minen = true
~ vardholm_hinweis = true
„Die Waage“, sagt Kettrich und spuckt das Wort aus wie eine Gräte. „Sie kauft unser Eisen für ihre Festung. Sie schließt den Spalt, damit wir unser Tuch nicht mehr an die Zwerge jenseits der Berge verkaufen können. Und dann schickt das Silbermark-Kontor seine Leute und bietet uns Kredite an.“ Er schnaubt. „Als hätten die das abgesprochen.“

Dann mustert er dich noch einmal. „Einen anderen Weg hinaus? Die Minen gehören uns. Und unter den Minen gibt es Stollen, die tief in den Berg führen. Aber in die Minen kommt nur, wer zur Gilde gehört.“

„Und wie gehört man zur Gilde?“

„Regel eins der Gilde“, sagt Kettrich. „Erst arbeiten, dann gehören. Wer etwas für uns tut, ist willkommen. Wer nur fragt, nicht.“
-> tuch_ende

= kettrich_geruecht
~ gilde_bietet_minen = true
„Die Minen gehören der Gilde“, flüstert die Weberin. „Wer zur Gilde gehört, kommt rein. Und unter den Minen gibt es alte Stollen. Aber zur Gilde gehört nur, wer erst etwas für sie getan hat.“
-> tuch_ende

= tuch_ende
~ spuren += 1
-> p2_ufer


// ---------------------------------------------------------------------
// Spur: Die Große Schmiede und die alte Frau mit den rußigen Händen
// ---------------------------------------------------------------------
=== p2_schmiede
# karte: grosse-schmiede
# bild: szene/grosse-schmiede
Die Große Schmiede hat eine Esse, so groß wie ein Zimmer. Das Feuer darin brüllt. Das größte Wasserrad des Viertels treibt die Blasebälge an. Funken stieben bis unter das Dach.

Und dort, mitten in der Hitze, steht sie: die alte Frau vom Marktplatz. Lederschürze, rußige Hände, graues Haar unter einem Tuch. Sie schmiedet ein Hufeisen, und jeder ihrer Schläge sitzt genau.
~ yrsa_getroffen = true

Als sie dich bemerkt, hält sie den Hammer still. „Du schon wieder.“
* [„Was haben Sie gestern gemeint? Wer sind die Stillen?“]
    Ihr Blick huscht zu den anderen Schmieden. „Nicht hier“, sagt sie scharf. „Und nicht so laut.“
* [„Ich suche einen Weg durch die Berge.“]
    „Das tun gerade viele.“ Sie legt das Hufeisen ins Feuer. „Die wenigsten finden einen.“
* [Einfach näher an die Esse treten]
    ~ neigung_feuer += 1
    Du trittst näher. Die Hitze schlägt dir ins Gesicht, aber sie tut nicht weh. Sie fühlt sich an wie eine Umarmung, die ein bisschen zu fest ist. Die alte Frau beobachtet dich dabei sehr genau.
- „Ich bin Yrsa“, sagt sie schließlich. „Ich schmiede seit fünfzig Jahren für diese Gilde. Und ich habe gelernt, wann man redet und wann man schweigt.“

Sie mustert {freund()}, die feine Haut, die feinen Schuhe. „Und vor wem.“
{ brief_erhalten:
    -> siegel
}
-> yrsa_ende

= siegel
~ spirale_erkannt = true
Da rutscht dir der Brief halb aus der Jacke. Yrsas Augen bleiben am grünen Siegel hängen. An den vier verschlungenen Ringen.

Sie wird blass unter dem Ruß. Mit einer schnellen Bewegung schiebt sie den Brief zurück in deine Jacke.

„Steck das weg“, sagt sie sehr leise. „Und zeig es niemandem. Hörst du? Niemandem.“
-> yrsa_ende

= yrsa_ende
„Wenn du wirklich reden willst“, sagt Yrsa, „komm heute Abend wieder. Allein.“

Dann schlägt sie wieder auf das Hufeisen ein, und das Gespräch ist vorbei.
~ spuren += 1
-> p2_ufer
