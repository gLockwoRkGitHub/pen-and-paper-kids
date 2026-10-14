// =====================================================================
// Perle 1 – Finale: Der Ausrufer, Abschied von Tickwort, Tagebuch
// =====================================================================

=== p1_ausrufer
# karte: marktplatz
# bild: entdeckung/ausrufer-ratshalle
Am späten Nachmittag läuten alle Glocken der Stadt gleichzeitig. Das passiert nur, wenn der Rat etwas zu verkünden hat.

Auf dem Marktplatz drängen sich die Leute. Auf den Stufen der Ratshalle steht ein Herold in rotem Mantel, und um ihn herum, in einem Halbkreis, Söldner in schwarzen Mänteln mit der goldenen Waage auf der Brust.
{ gesehen_worden:
    Du ziehst den Kopf ein und drückst dich hinter einen breiten Fischhändler.
}

Der Herold entrollt ein Pergament. „Bürger von Lysmara! Auf Beschluss des Rates ist der Nyrrspalt ab sofort geschlossen.“

Ein Raunen geht durch die Menge.

„Wegen zunehmender Überfälle durch Gnolle kann die Sicherheit der Reisenden nicht länger gewährleistet werden. Den Schutz des Passes übernimmt der Bund der Goldenen Waage. Niemand passiert ohne ihr Siegel.“

„Und wie bekommt man das Siegel?“, ruft jemand.

Der Herold blickt nicht einmal auf. „Gar nicht.“

Aus dem Raunen wird ein Brausen.{grumak_gewarnt: Irgendwo ganz vorn brüllt eine tiefe Stimme: „Gnolle! Pah!“ Das muss Grumak sein.}

Du denkst an die {zahl(silber)} Silberlinge in deiner Tasche. Den ganzen Tag hast du dafür geschuftet. Für den Zoll sind sie jetzt nichts mehr wert.

Der Herold hebt die Hand, und es wird wieder etwas ruhiger. „Ferner berät der Rat in den kommenden Tagen über ein neues Gesetz. Jeder, der die Elemente ruft, soll sich bei einer Gilde einschreiben lassen. Zum Schutz der Bürger.“

Diesmal wird es still auf dem Platz. Ganz still.

Neben dir murmelt eine alte Frau mit rußigen Händen und einer Lederschürze: „Jetzt haben die Stillen also endgültig Angst bekommen.“
~ schmiedin_gesehen = true

Du drehst dich zu ihr um. Sie sieht dich an, einen Moment zu lang, als würde sie etwas an dir wiedererkennen. Dann zieht sie ihr Tuch über den Kopf und verschwindet in der Menge. In Richtung Fluss.

„Die Stillen?“, flüsterst du. „Was meint sie damit?“

„Das“, sagt Tickwort langsam, „ist das erste Mal, dass ich etwas nicht erklären kann.“
{ freund_getroffen:
    Am Rand des Platzes entdeckst du {freund()} neben einem dünnen Mann mit Brille. Magister Pell hat {fr_ihn()} also gefunden. {freund()} starrt zu den Söldnern hinüber, und das Gesicht ist weiß wie Kreide. Als {fr_er()} dich bemerkt, schaut {fr_er()} schnell weg.
}
{ fremder_getroffen:
    Und auf der anderen Seite des Platzes, im Schatten eines Torbogens, steht eine Gestalt in einem grauen Mantel.{brief_erhalten: Sie hebt die Hand an die Brust, genau dorthin, wo du den Brief trägst.} Als die Menge sich bewegt, ist sie fort.
}

{ ausloeser:
- "verschwunden":
    Du denkst an {bp()}. Irgendwo da draußen am Nyrrspalt. Und jetzt ist der Weg dorthin versperrt.
- "brief":
    Du legst die Hand auf den Brief. Er muss auf die andere Seite. Jetzt erst recht.
- "schulden":
    Eine Lieferung von jenseits der Berge, hat Fesk gesagt. Durch einen geschlossenen Pass. Bis zum Neumond. Er hat es gewusst. Ganz bestimmt hat er es gewusst.
- "flucht":
    {kisten_gesehen:Bis zum Neumond muss alles in Vardholm sein, und dann wird der Spalt dichtgemacht. Das haben die Söldner gesagt. Es war kein Gerücht. Es war ein Plan.} Und jetzt sitzt du in Lysmara fest. Zusammen mit der Waage.
}

Als sich der Platz leert, sitzt du mit Tickwort auf dem Brunnenrand. Lange sagt keiner von euch etwas. Für Tickwort ist das eine beachtliche Leistung.

„Wenn eine Tür zu ist“, sagt er schließlich, „sucht man ein Fenster. Das ist keine Erklärung. Das ist ein Sprichwort. Aber ein gutes.“

„Welches Fenster?“

„Das Erz am Hafen kommt aus den Bergen. Aus den Kobold-Minen. Wer Erz aus den Bergen holt, kennt die Berge. Und am Fluss, bei Webstuhl und Amboss, kommt alles zusammen, was aus den Bergen kommt. Wenn jemand einen anderen Weg kennt, dann dort.“
{ schmugglerpfad_gesehen:
    „Außerdem“, fügt er leise hinzu, „habe ich mir eine Karte gemerkt. Jede Linie. Die Ziegenstiege.“
}
{ kuestenmauer_gesehen:
    Du denkst an die neue Mauer an den Klippen. Die Waage bewacht nicht nur den Pass. Sie bewacht auch das Meer.
}
->->


=== p1_abschied
# bild: szene/goblin-werkstatt
Auf dem Heimweg durchs Hafenviertel knallt es plötzlich so laut, dass ihr beide zusammenzuckt. Aus einer Werkstatt quillt grüner Rauch. Über der Tür hängt ein schiefes Schild:

„KNALLFUNKE & SÖHNE. WIR REPARIEREN ALLES. (MEISTENS)“

Drinnen stehen zwei Goblins vor einer Maschine, die aussieht wie eine Mischung aus Kessel, Spinne und Teekanne. Sie qualmt. Aus allen Ritzen.

„Mehr Druck!“, kreischt der eine Goblin.

„Weniger Druck!“, kreischt die andere.

„Wo ist die Anleitung?“

„Verbrannt! Letzten Winter! Als es kalt war!“

Tickwort zittert. Sein Glasauge surrt hin und her. Du siehst, wie sehr er sich zusammenreißt.

„Geh schon“, sagst du.

Tickwort trippelt in die Werkstatt. „Verzeihung“, sagt er. „Darf ich erklären?“

Was dann passiert, dauert sehr lange. Tickwort erklärt. Das Ventil, die Kolben, den Unterschied zwischen Druck und Überdruck, die Geschichte des Teekessels im Allgemeinen. Die beiden Goblins sitzen vor ihm auf dem Boden, mit offenem Mund, als würde er ihnen das spannendste Märchen der Welt erzählen.

Schließlich dreht einer der Goblins an einem Rad. Die Maschine hört auf zu qualmen. Sie schnurrt.

„ER ERKLÄRT!“, kreischt die Goblinfrau. „Brakka, er erklärt ALLES!“

„Bleib!“, ruft Brakka. „Bleib bei uns! Wir haben so viele Maschinen! Und keine einzige Anleitung!“

Tickwort dreht sich zu dir um. Sein Schornstein raucht nicht.

„Ich …“, sagt er. „Ich würde gerne. Wenn das in Ordnung ist. Bisher wollte noch nie jemand, dass ich länger rede.“
* [„Bleib. Hier gehörst du hin.“]
    ~ aendern(beziehung_tickwort, 1)
    Tickworts Schornstein stößt eine ganze Kette kleiner Dampfringe aus, einen nach dem anderen, bis sie unter der Decke der Werkstatt schweben wie Seifenblasen.
* [„Und wer erklärt mir dann alles?“]
    „Du selbst“, sagt Tickwort. „Du hast jetzt ein Buch. Und gute Augen. Und, wenn ich das sagen darf, einen ordentlichen Verstand. Das sind drei Dinge. Drei ist eine sehr gute Zahl.“
* [„Komm mit mir. Bitte.“]
    ~ aendern(beziehung_tickwort, 1)
    Tickwort schweigt. Für seine Verhältnisse sehr lange.
    „Ich wäre dir nur im Weg“, sagt er schließlich. „Auf einer Reise braucht man jemanden, der schnell ist. Ich habe drei Beine und eine Schwäche für Unterpunkte.“
    Sein Glasauge surrt leise. „Aber ich werde dich vermissen. Ich habe ausgerechnet, wie sehr. Die Zahl hat sehr viele Stellen.“
- ~ tickwort_bei_goblins = true
~ kompass = true
Tickwort öffnet die Klappe in seinem Bauch und holt einen kleinen Kompass aus Messing heraus.

„Er zeigt nicht nach Norden“, sagt er. „Er zeigt nach Hause. Wohin das auch immer für dich ist. Ich habe ihn selbst gebaut. Die Erklärung dazu hat elf Seiten, aber ich erspare sie dir.“

Er macht eine Pause. „Das ist ein Geschenk. Und ein Beweis, dass ich mich kurzfassen kann.“

# tagebuch: Tickworts Kompass
Du klappst den Kompass auf. Die Nadel zittert, dreht sich einmal im Kreis und bleibt stehen.
{ beziehung_tickwort >= 3:
    Sie zeigt genau auf Tickwort.
    Tickwort sieht es auch. Er sagt nichts. Aber sein Schornstein stößt einen einzigen, sehr kleinen Dampfring aus. # tagebuch_ende
- else:
    Sie zeigt nach Osten. Zu den Bergen.
    „Interessant“, sagt Tickwort. „Sehr interessant. Das würde ich gern erklären. Aber ich glaube, das musst du selbst herausfinden.“ # tagebuch_ende
}

Die Goblins bieten dir einen Schlafplatz an. „Neben der Esse ist es warm!“, ruft Brakka. „Meistens explodiert da nachts nichts!“
* [Neben der Esse schlafen]
    ~ neigung_feuer += 1
    Du rollst dich neben der Esse zusammen. Die Glut knistert leise, und ihre Wärme fühlt sich an wie eine Decke. Bevor du einschläfst, könntest du schwören, dass die Glut im Takt deines Atems heller und dunkler wird.
* [Nach Hause gehen]
    Du verabschiedest dich und gehst durch die dunklen Gassen nach Hause. Hinter dir hörst du noch lange Tickworts Stimme: „… und nun zu Unterpunkt zwölf …“
- ->->


=== p1_tagebuch
# bild: tagebuch/perle-1
# tagebuch: Die Hafenstadt
Spät in der Nacht schlägst du dein Buch auf. Du zeichnest Lysmara noch einmal, diesmal genauer. Die Zwirbelgasse. Knallfunke & Söhne.{p1_hafen: Den Hafen mit dem Kran.}{p1_feder: Die Klippen von Ahrn und den schiefen Leuchtturm.}{p1_markt: Den Brunnen und Grumaks Stand.}

Und ganz am Rand, wo die Weiden enden, eine Reihe spitzer Zacken: den Kharvan-Kamm. Mittendrin einen schmalen Strich. Den Nyrrspalt.
# karte: kharvan-kamm

Darunter schreibst du: # handschrift

„Heute ist der Nyrrspalt geschlossen worden.
{ ausloeser:
- "verschwunden":
    {bp()} ist irgendwo dort draußen. Ich werde {bp_ihn()} finden.
- "brief":
    Der Brief muss trotzdem auf die andere Seite. Ich habe es versprochen. Fast.
- "schulden":
    Bis zum Neumond brauche ich vierzig Silbermark oder eine Lieferung von jenseits der Berge. Sonst ist {pfand()} weg.
- "flucht":
    Die Goldene Waage sucht mich. Ich muss hier weg.
}
{ kobold_gerettet:
    Ich habe einem Kobold namens Grisk geholfen. Er sagt, er vergisst nicht.
}
{ kobold_ignoriert:
    Ich habe einem Kobold nicht geholfen. Er hat mich angesehen, als würde er sich mein Gesicht merken.
}
{ freund_getroffen:
    Ich habe {freund()} kennengelernt. {Fr_er()} fällt gern von Bäumen.
}
Tickwort ist jetzt bei den Goblins. Endlich hört ihm jemand zu.
Wer sind die Stillen?
Morgen gehe ich zum Fluss.“ # tagebuch_ende
->->
