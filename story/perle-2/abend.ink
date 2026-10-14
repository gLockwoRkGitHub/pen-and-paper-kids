// =====================================================================
// Perle 2 – Abend am Fluss und Tagebuch
// =====================================================================

=== p2_abend
# bild: szene/bruecke-abend-{freund_kurz()}
# karte: orinbruecke
Als du zurückkommst, sitzt {freund()} auf der alten Steinbrücke über den Orin und lässt die Beine baumeln. Die Wasserräder stehen still, nur das Wasser rauscht. Die Sonne geht hinter der Stadt unter.

Du setzt dich neben {fr_ihn()}. Eine Weile sagt keiner von euch etwas.

„Du hast mir heute das Leben gerettet“, sagt {freund()} schließlich. „Mit … mit Magie.“
{ ruf_leise_hand < 0:
    -> fink_klaut
}
{ ruf_leise_hand > 0:
    -> fink_warnt
}
-> gespraech

= fink_klaut
~ fink_hat_gestohlen = true
~ silber = MAX(0, silber - 3)
Da rempelt dich jemand an, ein Junge mit einer tief ins Gesicht gezogenen Mütze. „Verzeihung“, murmelt er und ist schon weg.

Erst Augenblicke später merkst du, dass dein Geldbeutel leichter ist. Viel leichter. Darin steckt jetzt ein Zettel. Darauf ist eine Hand gemalt, die einen Finger an die Lippen legt.

„Die Hand vergisst nicht.“
-> gespraech

= fink_warnt
Da setzt sich jemand auf deine andere Seite. Fink, die Mütze tief im Gesicht.

„Die Hand dankt für den Botengang“, sagt er, ohne dich anzusehen. „Und schickt dir eine Nachricht. Gratis.“ Er senkt die Stimme. „Die Ziegenstiege ist dicht. Die Waage hat Leute oben auf dem Pass. Wer jetzt dort hochgeht, kommt nicht weit.“
~ ziegenstiege_bewacht = true

Dann ist er so schnell verschwunden, wie er gekommen ist.
-> gespraech

= gespraech
~ freund_kennt_magie = true
„Hast du Angst vor mir?“, fragst du.

{freund()} denkt lange nach. „Nein“, sagt {fr_er()} dann. „Doch. Ein bisschen. Aber nicht vor dir.“ {Fr_er()} zupft an einem Faden der Arbeiterjacke. „Mein Vater sagt immer, Magie gehöre in sichere Hände. Dass man die Leute, die sie haben, beschützen muss. Vor sich selbst.“

„Und was denkst du?“

„Ich glaube …“ {freund()} sieht dich an. „Ich glaube, deine Hände sind ziemlich sicher.“
* [{freund()} alles erzählen: Yrsa, die Stillen, das Gesetz und dein Element]
    ~ freund_vertraut = true
    ~ aendern(beziehung_freund, 1)
    Du erzählst alles. Von Yrsa und den Stillen, von dem Gesetz, von deinem Mentor. Von {element_wort(element)}.
    {freund()} hört zu, ohne dich ein einziges Mal zu unterbrechen. Als du fertig bist, ist {fr_er()} sehr still.
    „Ich verrate nichts“, sagt {fr_er()} dann. „Niemandem. Auch nicht zu Hause. Versprochen.“
    Etwas an der Art, wie {fr_er()} „zu Hause“ sagt, klingt seltsam. Aber du bist zu müde, um nachzufragen.
* [Vorsichtig sein und nur wenig erzählen]
    „Es ist besser, wenn du nicht zu viel weißt“, sagst du.
    {freund()} nickt langsam. „Das sagt mein Vater auch immer“, sagt {fr_er()}. „Ich hasse es.“ Dann lächelt {fr_er()} schief. „Aber gut. Ich frage nicht. Noch nicht.“
* [{freund()} bitten, niemandem davon zu erzählen]
    „Versprochen“, sagt {freund()} sofort. „Ich kann Geheimnisse bewahren. Ich habe ziemlich viel Übung darin.“
- -> plan

= plan
{ tickwort_bei_goblins:
    Unter der Brücke treibt ein flacher Kahn vorbei, beladen mit Kisten. Auf den Kisten sitzt eine kleine Gestalt aus Messing und winkt.
    „Tickwort!“, rufst du.
    „Guten Abend!“, ruft Tickwort zurück. „Wir liefern eine Maschine! Ich erkläre sie gerade! Unterpunkt dreiundvierzig!“ Hinter ihm am Ruder sitzen zwei Goblins und hören ihm mit leuchtenden Augen zu. Dann ist der Kahn unter der Brücke hindurch und verschwindet in der Dämmerung.
}

„Also“, sagt {freund()}. „Was wissen wir?“

Du zählst auf:
{ tiefe_stiege_bekannt:
    Unter dem Berg gibt es einen alten Stollen, die Tiefe Stiege. Aber der Berg brummt.
}
{ gilde_bietet_minen:
    In die Minen kommt nur, wer zur Gilde von Webstuhl und Amboss gehört. Und dazu gehört nur, wer etwas für sie getan hat.
}
{ seeweg_bekannt:
    Auf dem Meer fahren Kapitäne ohne Laternen. Aber die Waage baut Türme an der Küste.
}
{ vardholm_hinweis:
    Die Waage baut in Vardholm etwas, das nichts mit Gnollen zu tun hat.
}
{ ziegenstiege_bewacht:
    Die Ziegenstiege über die Gipfel wird bewacht.
}
{ bp_spur:
    Und {bp()} hat nach den alten Stollen gefragt.
}

„Und das Gesetz“, sagt {freund()}. „Wer zaubert, muss sich bei einer Gilde einschreiben.“ {Fr_er()} runzelt die Stirn. „Aber wenn du sowieso einer Gilde beitrittst … dann suchst du dir wenigstens aus, welcher.“

Du siehst {fr_ihn()} überrascht an. Das ist eigentlich ziemlich klug.

„In drei Tagen ist Gildentag“, sagt {freund()}. „Dann öffnen alle Gilden ihre Hallen und suchen neue Leute. Lehrlinge, Helfer, Boten. Wer sich bewährt, darf bleiben.“ {Fr_er()} grinst. „Ich weiß, wo die Prüfungen stattfinden. Meine Familie … kennt ein paar Leute.“

Wieder dieses Zögern bei „meine Familie“.

{freund()} springt auf. „Ich muss los. Magister Pell zählt abends meine Schuhe.“ {Fr_er()} ist schon ein paar Schritte weg, als {fr_er()} sich noch einmal umdreht. „Danke. Für heute. Für alles.“
->->


=== p2_tagebuch
# bild: tagebuch/perle-2
# tagebuch: Am Fluss der Räder
In dieser Nacht schläfst du tief und traumlos. Als du aufwachst, fühlst du dich ausgeruht, und irgendwo tief in dir glimmt wieder die Kraft.
~ rasten()
Du schlägst dein Buch auf. Du zeichnest den Orin, die Wasserräder, die Große Schmiede und den Färberturm, schwarz und verkohlt.{p2_erzlaende: Die Erzlände mit den Kähnen.}{p2_tuchhalle: Die Tuchhalle mit ihren Stoffbahnen.}
{ element:
- "erde":
    # karte: steinmetzhof
    Und den Steinmetzhof im Zwergenviertel.
- "wasser":
    Und am Hafen ein altes Schiff mit grauen Segeln.
- "wind":
    Und ganz oben auf den Klippen den Leuchtturm, diesmal mit einem offenen Fenster.
}
# karte: orin

Darunter schreibst du: # handschrift

„Heute hat mir {element_artikel(element)} geantwortet.
{ element_gewechselt:
    Zuerst hat {element_artikel(element_erkannt)} geantwortet. Aber ich habe {element_artikel(element)} gewählt.
}
{ element:
- "erde":
    Borrik sagt, ich soll bitten, nicht befehlen.
- "wasser":
    Nerelle sagt, Wasser folgt. Man muss ihm einen Weg zeigen.
- "feuer":
    Yrsa sagt, das wichtigste Wort beim Feuer ist: genug.
- "wind":
    Vael sagt, man kann den Wind nicht festhalten. Nur einladen.
}
Ich habe {freund()} gerettet.
{ freund_vertraut:
    {Fr_er()} weiß jetzt alles. {Fr_er()} hat versprochen, es niemandem zu sagen.
}
Die Waage will, dass sich alle Magier bei einer Gilde einschreiben.
{ kugeln_verstanden:
    Die Glaskugeln sind voller gefangener Kraft. Wer füllt sie?
}
{ berg_brummt:
    Der Berg brummt. Was ist da unten?
}
In drei Tagen ist Gildentag.“ # tagebuch_ende

Kraftfunken: {kraftfunken}
->->
