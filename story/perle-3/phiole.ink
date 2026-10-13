// =====================================================================
// Perle 3 – Prüfung beim Zirkel der Glühenden Phiole: Der Leuchttrank
// Ein Trank vor Publikum. Tickwort ist am Stand nebenan.
// Wer hier zaubert, zaubert vor vielen Augen.
// =====================================================================

=== p3_phiole
~ pruefungen += 1
# karte: phiole
# bild: szene/phiole-pruefung
Das Haus der Glühenden Phiole steht am Hafen, gleich neben Knallfunke & Söhne, und es ist leicht zu finden: Es ist das einzige Haus, aus dessen Schornstein violetter Rauch steigt.

Im Hof stehen acht kleine Kupferkessel auf acht kleinen Feuerstellen. Drumherum drängen sich Zuschauer, denn die Prüfung der Phiole ist jedes Jahr die lauteste des Gildentags. Manche haben sich vorsichtshalber Watte in die Ohren gesteckt.

Die Meisterin des Zirkels ist eine Frau mit kurzem weißem Haar und einem Gürtel voller Fläschchen. Sie hat keine Augenbrauen.

„Ich bin Meisterin Ambra“, sagt sie. „Und bevor ihr fragt: Die sind vor zwanzig Jahren abgebrannt und nie wieder nachgewachsen. Das ist die erste Lektion der Alchemie.“ Sie lächelt. „Die Prüfung: ein Leuchttrank. Das Rezept liegt neben eurem Kessel. Wer seinen Trank zum Leuchten bringt, hat bestanden.“
{ tickwort_bei_goblins:
    -> tickwort
}
-> rezept

= tickwort
~ tickwort_wiedergesehen = true
Über den Zaun zum Nachbarhof ragt ein kleiner Kuppelkopf aus Messing mit einem großen Glasauge. „Psst!“, macht Tickwort. Dann, sehr laut: „Ich bin rein zufällig hier!“

Brakka steht neben ihm am Stand von Knallfunke und verkauft Kessel. „Unsere Kessel!“, ruft er stolz zu dir herüber. „Explodieren fast nie!“
-> rezept

= rezept
Du schaust auf das Rezept. Es ist alt, fleckig und an einer Ecke angekokelt. Ausgerechnet an der Ecke, wo die Reihenfolge der Zutaten steht.

Vor dir stehen vier Schälchen: grünes Glühmoos, weißes Mondsalz, rote Funkenbeeren und ein Krug mit Quellwasser.
* {gildentag_regeln} [Dich an Tickworts Rat erinnern: Nie das Salz zuerst]
    Nie das Salz zuerst. Niemals. Du legst das Salz ganz nach hinten, und plötzlich ergibt der Rest einen Sinn: erst das Wasser, dann das Moos, dann die Beeren, dann das Salz.
    -> feuer_klein(1)
* [Aus den Resten des Rezepts die Reihenfolge erschließen (Verstand)]
    ~ temp e = probe(verstand)
    ~ probe_zeile("Verstand", e)
    { e:
    - ERFOLG:
        Unter der angekokelten Ecke kannst du gerade noch zwei Buchstaben lesen. Und da steht „Salz“ am Ende einer Zeile. Erst das Wasser, dann das Moos, dann die Beeren, dann das Salz. Du bist dir sicher.
        -> feuer_klein(1)
    - JA_ABER:
        Du rätst. Klug, aber du rätst. Wasser, Moos, Salz, Beeren? Oder Beeren, dann Salz? Du entscheidest dich. Vielleicht richtig.
        -> feuer_klein(0)
    - else:
        Du kippst als Erstes das Salz in den Kessel. Es zischt beleidigt.
        -> feuer_klein(-1)
    }
* {tickwort_bei_goblins} [Zum Zaun hinüberschauen, wo Tickwort steht]
    ~ aendern(beziehung_tickwort, 1)
    Tickwort hat nur auf diesen Blick gewartet. „Unterpunkt eins!“, ruft er über den Zaun, so laut, dass alle acht Bewerber zusammenzucken. „Erst das Wasser! Unterpunkt zwei: das Moos! Unterpunkt drei …“
    Nach Unterpunkt vier wissen alle acht Bewerber das Rezept. Meisterin Ambra lacht so sehr, dass sie sich an einem Kessel festhalten muss. „Hilfe von einem Erklärautomaten“, sagt sie, „ist nicht verboten. Wer Freunde hat, hat Freunde.“
    -> feuer_klein(1)

= feuer_klein(vorteil)
„Und jetzt“, ruft Meisterin Ambra, „die Flamme. Klein wie ein Fingernagel. Zählt bis hundert. Wird sie größer, kocht der Trank über. Wird sie kleiner, wird er nie leuchten.“

Unter deinem Kessel flackert ein kleines Feuer. Die Zuschauer drängen näher. Ganz vorn steht ein Mann in einem schwarzen Mantel mit einem Notizbuch. Er schaut nicht auf die Kessel. Er schaut auf die Bewerber.
* [Das Feuer mit dem Ventil am Kessel ruhig halten (Geschick)]
    ~ temp e = probe(geschick + vorteil)
    ~ probe_zeile("Geschick", e)
    -> trank(e)
* [Mit Geduld zählen und das Holz Stück für Stück nachlegen (Verstand)]
    ~ temp e2 = probe(verstand + vorteil)
    ~ probe_zeile("Verstand", e2)
    -> trank(e2)
* {kann_zaubern(1) && element == "feuer"} [Die Flamme bitten, genau so klein zu bleiben (Zauber, vor Publikum)]
    -> zauber_trank(1, vorteil)
* {kann_zaubern(0) && element == "wind"} [Einen ganz feinen Luftzug unter den Kessel schicken (Zauber, vor Publikum)]
    -> zauber_trank(0, vorteil)
* {kann_zaubern(0) && element == "wasser"} [Den Trank bitten, nicht überzukochen (Zauber, vor Publikum)]
    -> zauber_trank(0, vorteil)
* {kann_zaubern(0) && element == "erde"} [Die Steine der Feuerstelle bitten, die Hitze gleichmäßig zu halten (Zauber, vor Publikum)]
    -> zauber_trank(0, vorteil)

= zauber_trank(umgebung, vorteil)
~ temp z = zauber(umgebung + tipp_bonus())
~ probe_zeile("Zauber", z)
{ z:
- ERFOLG:
    Du rufst ganz leise. So leise, wie {element == "erde":Borrik}{element == "wasser":Nerelle}{element == "feuer":Yrsa}{element == "wind":Vael} es dir gezeigt hat. Und {element_artikel(element)} hört dich.
    Niemand sieht etwas. Nur dein Feuer brennt so gleichmäßig, als wäre es aus Glas.
    -> trank(ERFOLG)
- JA_ABER:
    ~ magie_gildentag = true
    Es wirkt. Aber nicht leise. {element == "feuer":Die Flamme verbeugt sich vor dir wie ein Hofnarr.}{element == "wind":Ein kleiner Wirbel tanzt um deinen Kessel und bläst einem Zuschauer den Hut vom Kopf.}{element == "wasser":Der Trank formt für einen Moment ein kleines Gesicht und zwinkert.}{element == "erde":Die Steine der Feuerstelle rücken hörbar zusammen wie Leute auf einer Bank.} Ein Raunen geht durch die Zuschauer.
    Der Mann im schwarzen Mantel schreibt etwas in sein Notizbuch.
    -> trank(JA_ABER)
- KEINE_KRAFT:
    Du greifst nach deiner Kraft. Da ist nichts. Und die Flamme wird größer.
    ~ temp e = probe(geschick + vorteil)
    ~ probe_zeile("Geschick", e)
    -> trank(e)
- else:
    ~ magie_gildentag = true
    Das Element hört dich. Und alle anderen hören es auch. {element == "feuer":Die Flamme schießt bis zur Dachrinne hoch.}{element == "wind":Ein Windstoß fegt über den Hof und reißt die Rezepte von allen acht Tischen.}{element == "wasser":Der Trank springt in einem Bogen aus dem Kessel und landet auf Meisterin Ambras Schuhen.}{element == "erde":Die Feuerstelle bricht in zwei Teile, und dein Kessel kippt.}
    Der Mann im schwarzen Mantel lächelt und schreibt. Lange.
    -> trank(MISSERFOLG)
}

= trank(e)
{ e:
- ERFOLG:
    ~ angebot_phiole = true
    ~ aendern(ruf_phiole, 1)
    Bei hundert nimmst du den Kessel vom Feuer. Einen Moment lang passiert nichts. Dann beginnt der Trank zu leuchten. Erst schwach, dann immer heller, ein klares, ruhiges Grün, wie Glühwürmchen in einer Sommernacht.
    Die Zuschauer klatschen. Meisterin Ambra beugt sich über deinen Kessel und nickt. „Ruhige Hände“, sagt sie. „Die braucht man bei uns mehr als Mut.“ Sie füllt den Trank in ein kleines Fläschchen und gibt es dir. „Deiner. Er leuchtet eine Nacht lang. Und ein Angebot. Bis Mitternacht.“
- JA_ABER:
    ~ angebot_phiole = true
    Bei hundert nimmst du den Kessel vom Feuer. Der Trank leuchtet. Er leuchtet sehr. Er leuchtet so sehr, dass alle die Augen zukneifen müssen, und dann macht es leise Plopp, und aus dem Kessel steigt eine Wolke aus grünem Glitzer, die sich auf alles legt. Auf dich. Auf die Zuschauer. Auf Meisterin Ambra.
    Meisterin Ambra wischt sich Glitzer von der Nase. „Zu viel“, sagt sie. „Aber es leuchtet. Ein Angebot. Bis Mitternacht.“ Sie grinst. „Du wirst noch drei Tage glitzern. Das gehört dazu.“
- else:
    Bei siebenundvierzig kocht der Trank über. Bei achtundvierzig wird er violett. Bei neunundvierzig macht es BUMM, und eine Wolke aus dickem, grünem Schaum hüllt dich ein. Er riecht nach Pfefferminz und verbrannten Socken.
    Als sich der Schaum lichtet, klatscht Meisterin Ambra. „Der beste Knall des Tages!“, ruft sie. Dann, leiser: „Aber ein Knall ist kein Leuchten. Komm nächstes Jahr wieder.“
    { tickwort_bei_goblins:
        Über den Zaun ruft Tickwort: „Unterpunkt neun: Das war nicht deine Schuld! Es war … zum Teil deine Schuld. Unterpunkt zehn: Es war trotzdem sehr eindrucksvoll!“
    }
}
{ angebot_phiole:
    Bevor du gehst, nimmt Meisterin Ambra dich kurz zur Seite. „Noch etwas“, sagt sie leise. „Die Phiole hat Rufer in ihren Reihen. Hatte sie immer. Wir schreiben sie in unser Buch, und dann vergessen wir das Buch.“ Sie zwinkert mit einem Auge ohne Braue. „Wir mögen keine Register. Nur damit du es weißt.“
}
->->
