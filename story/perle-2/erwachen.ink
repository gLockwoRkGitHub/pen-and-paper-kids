// =====================================================================
// Perle 2 – Feuer am Färberturm: Die Magie erwacht
// und im Keller der Schmiede: Yrsa erklärt, Element bestätigen oder wählen
// =====================================================================

=== p2_turm
# bild: szene/faerberturm-feuer
Am frühen Nachmittag merkst du plötzlich, dass {freund()} nicht mehr neben dir ist.

Du drehst dich einmal um dich selbst. Dann siehst du {fr_ihn()}. Hoch oben.

Neben der Großen Schmiede steht der Färberturm, ein schmaler Turm aus Holz, in dem lange Stoffbahnen zum Trocknen hängen. Er steht direkt am Mühlgraben, wo das Wasser schäumend zum großen Rad schießt. Und ganz oben, auf der obersten Plattform, sitzt {freund()} und winkt.

„Von hier aus sieht man die Berge!“, ruft {fr_er()}. „Und den Spalt! Komm hoch!“

Dann geht alles sehr schnell.

Ein Schmiedelehrling schiebt einen Karren mit glühenden Kohlen aus der Schmiede. Ein Rad bricht. Der Karren kippt. Die Kohlen rollen in einen Haufen Stroh am Fuß des Färberturms, und das Stroh fängt Feuer.

Eine Windbö fährt in die Flammen. Sie springen auf die erste Stoffbahn über, auf die zweite, die Treppe hinauf. In wenigen Atemzügen brennt der halbe Turm.

Oben auf der Plattform hört {freund()} auf zu winken.
* [Zum Turm rennen und mitten durch die Flammen die Treppe hinaufstürmen (Geschick)]
    ~ neigung_feuer += 1
    ~ temp e = probe(geschick)
    ~ probe_zeile("Geschick", e)
    { e:
    - ERFOLG:
        Du bist schneller an der Treppe als alle anderen. Du schaffst zehn Stufen, zwanzig. Dann bricht vor dir ein brennendes Brett weg, und darüber ist nur noch Feuer.
    - else:
        Du rennst los, aber die Hitze schlägt dir entgegen wie eine Faust und wirft dich zurück. Die Treppe ist schon ein einziges Flammenmeer.
    }
* [Eimer greifen und Wasser aus dem Mühlgraben schöpfen (Kraft)]
    ~ neigung_wasser += 2
    ~ temp e2 = probe(kraft)
    ~ probe_zeile("Kraft", e2)
    { e2:
    - ERFOLG:
        Du schöpfst und wirfst, schöpfst und wirfst. Andere helfen mit. Aber für jede Flamme, die zischend erlischt, springen zwei neue an den Stoffbahnen hoch.
    - else:
        Du schöpfst und wirfst, so schnell du kannst. Es ist, als würdest du mit einem Fingerhut einen Waldbrand löschen.
    }
* [Gegen den Wind anschreien und alle Leute zusammenrufen (Ausstrahlung)]
    ~ neigung_wind += 1
    ~ temp e3 = probe(ausstrahlung)
    ~ probe_zeile("Ausstrahlung", e3)
    { e3:
    - ERFOLG:
        „FEUER! AM FÄRBERTURM! ALLE HER!“ Deine Stimme schneidet durch den Lärm der Räder. Weber, Schmiede und Kobolde kommen gerannt. Aber selbst mit allen Händen kommt niemand an die Plattform heran.
    - else:
        Du schreist, so laut du kannst, aber das Wumm der Wasserräder verschluckt deine Stimme. Nur ein paar Leute drehen sich um.
    }
- -> erwachen

= erwachen
„{freund()}!“, schreist du.

Oben auf der Plattform steht {freund()} am Geländer. Das Gesicht ist weiß. Unter {fr_ihm()} brennt die letzte Stoffbahn, und die Flammen lecken schon an den Planken.

Und in diesem Moment passiert etwas in dir.

Es fühlt sich an, als würde sich eine Tür öffnen, von der du nicht wusstest, dass es sie gibt. Etwas strömt durch dich hindurch, von den Fußsohlen bis in die Fingerspitzen. Etwas Altes. Etwas, das dich kennt.
~ element_erkannt = staerkste_neigung()
~ magie_oeffentlich = true
~ freund_gerettet = true
# erwachen
{ element_erkannt:
- "wasser":
    # bild: szene/erwachen-wasser-{freund_kurz()}
    Du streckst die Hand nach dem Mühlgraben aus. Das Wasser hört auf zu fließen.
    Dann bäumt es sich auf. Eine Welle, so hoch wie ein Haus, steigt aus dem Graben, wölbt sich über den Färberturm und stürzt herab. Zischend und brüllend erlischt das Feuer, und eine riesige Dampfwolke hüllt alles ein.
    Als sie sich lichtet, steht der Turm noch. Schwarz, tropfend, aber er steht. Und oben auf der Plattform sitzt {freund()}, klatschnass und hustend. Und am Leben.
- "feuer":
    # bild: szene/erwachen-feuer-{freund_kurz()}
    Du streckst die Hand nach den Flammen aus. Und die Flammen sehen dich.
    Es gibt kein anderes Wort dafür. Sie halten inne, als hätte jemand ihren Namen gerufen. Dann ziehen sie sich zurück, von der Plattform, von der Treppe, von den Stoffbahnen. Sie fließen den Turm hinunter wie glühender Honig, über das Pflaster, bis zu dir. Und in deine Hand.
    Einen Moment lang hältst du das ganze Feuer zwischen deinen Fingern, eine kleine, warme, zitternde Kugel aus Licht. Dann schließt du die Hand, und es ist fort.
    Der Turm qualmt. Aber er brennt nicht mehr. Oben auf der Plattform sitzt {freund()} und starrt dich an.
- "wind":
    # bild: szene/erwachen-wind-{freund_kurz()}
    Die Plattform kracht. Das Geländer gibt nach. Und {freund()} fällt.
    Du streckst beide Arme aus, ohne nachzudenken, und der Wind gehorcht dir. Er reißt die Flammen vom Turm weg, hinaus über den Fluss, wo sie über dem Wasser verlöschen. Und er fängt {freund()} auf, mitten im Fall, und trägt {fr_ihn()} wie ein Blatt im Herbst, langsam, schaukelnd, bis {fr_er()} sanft vor deinen Füßen auf dem Pflaster landet.
    Dann ist es plötzlich ganz still. Kein Lüftchen regt sich mehr.
- else:
    # bild: szene/erwachen-erde-{freund_kurz()}
    Du presst die Hände auf den Boden. Und der Boden antwortet.
    Das Pflaster bricht auf. Aus der Erde schieben sich Steine, einer über dem anderen, eine Treppe aus Fels, die neben dem brennenden Turm in die Höhe wächst, Stufe um Stufe, bis hinauf zur Plattform. Gleichzeitig hebt sich der Boden am Fuß des Turms wie eine Welle und begräbt die brennenden Kohlen und das Stroh unter sich.
    {freund()} klettert die Felsentreppe herunter, zitternd, rußig. Und am Leben.
}

Du sinkst auf die Knie. Du bist so müde, als wärst du drei Tage lang gerannt.

Um dich herum ist es still geworden. Selbst die Wasserräder scheinen leiser zu drehen. Alle starren dich an. Weber, Schmiede, Kobolde.

Dann schreit eine Frau: „Ein Magier! Ein Magier!“

Und vom Ende der Gasse hörst du Stiefelschritte. Schwarze Mäntel. Goldene Waagen.

Eine Hand packt dich am Arm. Eine rußige Hand.

„Komm“, sagt {yrsa_getroffen:Yrsa|eine alte Frau mit Lederschürze, die du schon einmal gesehen hast. Auf dem Marktplatz}. „Jetzt.“
->->


=== p2_keller
# karte: grosse-schmiede
# bild: szene/schmiedekeller
Sie zieht dich und {freund()} durch die Schmiede, eine schmale Treppe hinunter, durch eine Tür, die hinter euch ins Schloss fällt. Ein Keller. Warm, dunkel, nur eine Lampe brennt. Es riecht nach Kohle und Eisen.

Über euch poltern Stiefel durch die Schmiede. Stimmen. Dann wird es wieder leiser.
{ not yrsa_getroffen:
    ~ yrsa_getroffen = true
    „Ich bin Yrsa“, sagt die alte Frau. „Ich schmiede seit fünfzig Jahren für diese Gilde. Und seit fünfzig Jahren weiß niemand hier, was ich wirklich bin.“
}

Yrsa setzt sich auf eine Kiste und sieht dich lange an.

„Gestern auf dem Marktplatz“, sagt sie, „habe ich es an dir gespürt. Wie ein Funke unter der Asche. Heute hat er Feuer gefangen.“ Sie lächelt schief. „Im wahrsten Sinne.“
* [„Was ist mit mir passiert?“]
    „Du hast ein Element gerufen“, sagt Yrsa. „Und es hat geantwortet.“
* [„Bin ich … ein Magier?“]
    „Das Wort benutzen die Stillen“, sagt Yrsa. „Wir sagen: Du hast ein Element gerufen. Und es hat geantwortet.“
* [Schweigen. Deine Hände zittern noch.]
    Yrsa nimmt deine Hände in ihre. Sie sind rau und sehr warm. „Das geht vorbei“, sagt sie. „Das erste Mal ist immer das schwerste.“
- -> erklaerung

= erklaerung
# tutorial: magie
„Es gibt vier Elemente“, sagt Yrsa. „Erde, Wasser, Feuer, Wind. Die meisten Menschen hören keines davon. Für sie schweigen die Elemente.“

„Die Stillen“, sagt {freund()} leise.

Yrsa nickt. „So nennen wir sie. Unter uns. Nicht böse gemeint.“ Sie zögert. „Meistens nicht.“

„Wer ein Element hört, kann es rufen. Aber nur, wenn es da ist. Feuer braucht Feuer, Wasser braucht Wasser, Erde braucht Stein oder Boden. Nur der Wind ist überall. Dafür ist er am schwersten zu fassen. Ich kenne in ganz Meridel nur einen Einzigen, der ihn hört.“

„Und jedes Rufen kostet Kraft. Du spürst es jetzt, nicht wahr? Diese Müdigkeit. Am Anfang reicht deine Kraft für zwei kleine Rufe. Dann musst du rasten. Mit der Zeit wird es mehr.“

Sie beugt sich vor. „Und jetzt hör gut zu, denn das ist das Wichtigste: Die Stillen haben Angst vor uns. Nicht alle. Aber genug. Und die Goldene Waage weiß das. Deshalb dieses Gesetz. Wer zaubert, soll sich bei einer Gilde einschreiben. Damit die Gilden wissen, wo wir sind. Und uns benutzen können.“
{ kisten_gesehen:
    ~ kugeln_verstanden = true
    Du erzählst ihr von den Glaskugeln am Nordkai. Von dem Licht, das darin zuckte wie ein gefangener Blitz.
    Yrsa wird sehr still. „Dann ist es schlimmer, als ich dachte“, sagt sie schließlich. „Das ist kein Blitz, Kind. Das ist Kraft. Gerufene Kraft, eingesperrt in Glas. Jemand füllt diese Kugeln. Und ich möchte nicht wissen, woher er die Kraft dafür nimmt.“
}
{ magie_oeffentlich:
    „Heute haben dich viele gesehen“, sagt Yrsa. „Sei in den nächsten Tagen vorsichtig. Zaubere nicht vor Fremden. Und schon gar nicht vor schwarzen Mänteln.“
}
-> element_hoeren

= element_hoeren
„Und nun“, sagt Yrsa, „zu dir.“

„Ich habe gesehen, was du getan hast. Du hast {element_artikel(element_erkannt)} gerufen.“ Sie hebt einen Finger. „Aber das erste Mal sagt nicht alles. In der Not antwortet oft das Element, das am lautesten ist. Nicht immer das, das am besten zu dir passt.“

„Schließ die Augen. Hör in dich hinein. Welches Element ruft dich?“

Du schließt die Augen. Und tatsächlich: Wenn du ganz still bist, hörst du sie alle vier. Ganz leise. Das Rauschen des Flusses über dir. Das Knistern der Esse. Das Summen der Steine in den Kellerwänden. Und, ganz fern, durch ein Lüftungsloch, das Pfeifen des Windes.
+ [{element_wort(element_erkannt)}. Es hat dich gerettet, und es fühlt sich richtig an.]
    ~ element_waehlen(element_erkannt)
    Du öffnest die Augen. „{element_wort(element_erkannt)}“, sagst du.
    Yrsa nickt langsam. „Das dachte ich mir.“
+ {element_erkannt != "erde"} [Erde. Ruhig, geduldig, unerschütterlich.]
    ~ element_waehlen("erde")
    ~ element_gewechselt = true
    -> gewechselt
+ {element_erkannt != "wasser"} [Wasser. Beweglich, tief, voller Überraschungen.]
    ~ element_waehlen("wasser")
    ~ element_gewechselt = true
    -> gewechselt
+ {element_erkannt != "feuer"} [Feuer. Warm, wild, voller Kraft.]
    ~ element_waehlen("feuer")
    ~ element_gewechselt = true
    -> gewechselt
+ {element_erkannt != "wind"} [Wind. Frei, leicht, schwer zu fassen.]
    ~ element_waehlen("wind")
    ~ element_gewechselt = true
    -> gewechselt
- -> zum_mentor

= gewechselt
Du öffnest die Augen. „{element_wort(element)}“, sagst du.

Yrsa zieht die Augenbrauen hoch. Dann lacht sie leise. „Nicht das, was in der Not geantwortet hat. Sondern das, was du gewählt hast.“ Sie nickt. „Das ist mutig. Und klug. Ein Element, das man wählt, bleibt einem treuer als eines, das man nur gefunden hat.“
-> zum_mentor

= zum_mentor
# tagebuch: Das Erwachen
{ element:
- "feuer":
    „Dann bleibst du bei mir“, sagt Yrsa. „Ich werde dir zeigen, wie man Feuer ruft, ohne dabei die halbe Gasse anzuzünden.“
- "erde":
    „Dann bin ich die Falsche für dich“, sagt Yrsa. „Aber ich kenne den Richtigen. Im Zwergenviertel, am Steinmetzhof, arbeitet ein alter Zwerg namens Borrik. Sag ihm, Yrsa schickt dich. Und sag es leise.“
- "wasser":
    „Dann bin ich die Falsche für dich“, sagt Yrsa. „Aber ich kenne die Richtige. Im Hafen, am Liegeplatz sieben, liegt ein altes Schiff namens Morgentau. Die Kapitänin heißt Nerelle. Sag ihr, Yrsa schickt dich.“
- "wind":
    Yrsa sieht dich an, als hättest du gerade gesagt, du wolltest auf dem Mond spazieren gehen. „Wind“, wiederholt sie. „Natürlich. Ausgerechnet.“
    Sie seufzt. „Es gibt nur einen, der dir helfen kann. Er wohnt im alten Leuchtturm an den Klippen von Ahrn. Er heißt Vael, und er hasst Besuch. Mehr als alles andere auf der Welt.“
}

Über euch ist es still geworden. Die Söldner sind fort.

„Geht jetzt“, sagt Yrsa. „Durch die Hintertür. Und denk daran: nicht vor Fremden.“
->->
