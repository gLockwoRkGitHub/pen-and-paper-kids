// =====================================================================
// Perle 4 – Das Lager der Gnolle: Ashka erzählt vom Schweigen.
// Helfen, vermitteln oder verraten.
// =====================================================================

=== p4_gnolle
# bild: szene/gnollenlager
# karte: gnollenlager
Das Junge führt euch einen Ziegenpfad hinauf, durch Ginster und Geröll, bis in eine enge Schlucht. Dort, zwischen Felsen und einem kleinen Bach, stehen Zelte aus Fellen und Ästen. Ein Feuer qualmt. Und um das Feuer sitzen Gnolle.

Du hast dir Gnolle immer groß und wild vorgestellt. Diese hier sind groß. Aber sie sind nicht wild. Sie sind dünn, das Fell struppig, die Augen müde. Die meisten sind alt oder sehr jung. Ein paar halten Speere, aber so, wie man einen Wanderstock hält, nicht wie eine Waffe.

Als sie dich sehen, springen sie auf. Dann sehen sie das Junge, das vor dir herläuft.

Ein Schrei. Eine Gnollin stürzt heran, packt das Junge und drückt es an sich, und das Junge quietscht und leckt ihr übers Gesicht.
-> ashka

= ashka
# bild: figur/ashka
Aus dem größten Zelt tritt eine alte Gnollin. Ihr Fell ist grau mit dunklen Flecken, ein Ohr ist eingerissen, und um den Hals trägt sie eine Kette aus Knochenperlen und kleinen, glatten Steinen. Sie stützt sich auf einen Stab. Sie sieht dich lange an, mit gelben, klugen Augen.

„Wuk“, sagt sie und zeigt auf das Junge. Ihre Stimme ist rau wie ein Reibeisen. „Wuk ist ins Graue gelaufen. Heute früh. Wir konnten nicht hinein. Niemand kann hinein.“ Sie legt die Hand auf die Brust. „Ashka.“
{ wuk_gerettet:
    ~ aendern(ruf_gnolle, 2)
    „Du warst drin“, sagt Ashka. „Wuk riecht nach dir. Und nach dem Grauen.“ Sie neigt den Kopf, tief, bis ihre Nase fast den Boden berührt. „Das vergessen die Gnolle nicht. Nie.“
- else:
    ~ aendern(ruf_gnolle, 1)
    „Du hast Wuk gebracht“, sagt Ashka. Sie schnuppert. „Und noch jemand war dabei. Einer, der nach allen vier Winden riecht.“ Ihre Ohren zucken. „Seltsam. Sehr seltsam.“
}
{ erster_auftrag == "ginsterhof":
    Jorrit hält ihr Finks Karte hin. „Von der Hand. Ein Versteck. Weiter oben, sicher vor den schwarzen Mänteln.“
    Ashka nimmt die Karte und schnüffelt daran. „Die Hand hält Wort“, sagt sie.
}
-> erzaehlt

= erzaehlt
Ihr sitzt am Feuer. Jemand reicht dir eine Schale mit heißem, bitterem Tee. Wuk hat sich neben dich gelegt und schläft, den Kopf auf deinem Knie.

„Warum seid ihr hier?“, fragst du. „Über die Berge?“

Ashka starrt ins Feuer.

„Jenseits der Berge“, sagt sie, „ist unser Land. Gras, so weit man laufen kann. Im Frühling kam das Graue. Erst klein. Ein Fleck hier, ein Fleck da. Dann größer. Es kommt in der Nacht. Das Feuer geht aus und will nicht wieder brennen. Der Wind hört auf. Der Bach fließt, aber er rauscht nicht mehr.“

„Die Gnolle nennen es Hrrsh. Das Schweigen. Es nimmt den Dingen die Stimme. Und wer darin schläft, steht auf und geht. Hinein. Mit offenen Augen.“ Sie schweigt. „Unsere Alten sind gegangen. Meine Schwester ist gegangen. Die Dörfer der Menschen an der Straße: alle gegangen.“

{ grumak_gewarnt:
    Du denkst an die offenen Türen, von denen Grumak erzählt hat. Jetzt weißt du, wohin die Leute gegangen sind.
}

„Und jetzt ist es auch hier“, sagt Ashka. „Es ist uns gefolgt. Über die Berge. Oder …“ Ihre Ohren legen sich flach an den Kopf.

„Oder?“

„Bevor das Graue kam“, sagt Ashka langsam, „hat der Berg gebrummt. Tief unten. Wie ein Bienenstock.“ Sie sieht zu den Gipfeln hinauf, schwarz vor dem Abendhimmel. „Ich glaube, das Graue kommt nicht über die Berge. Ich glaube, es kommt aus ihnen.“
{ berg_brummt:
    Der Berg brummt. Das hast du schon einmal gehört. Dir läuft ein Schauer über den Rücken.
}
{ ausloeser == "verschwunden" && bp_nachricht:
    Und {bp()} ist in die Tiefe Stiege gegangen. Unter den Berg. Allein.
}
-> entscheidung

= entscheidung
Die Sonne sinkt. Am Hang unter euch, weit entfernt, siehst du Fackeln. Schwarze Mäntel. Strells Patrouille, auf dem Weg nach Süden.

„Sie suchen uns“, sagt Ashka ruhig. „Jeden Tag kommen sie näher.“
{ magie_registriert == "waage":
    Du denkst an Strells Befehl. Vor Sonnenuntergang will ich wissen, wo es ist. Dafür bist du hier.
- else:
    Du denkst an das Blatt am Pfahl in Wollmark. Fünf Silberlinge.
}
Was tust du?
* [Den Gnollen helfen: ihnen Jorrits Versteck zeigen und schweigen]
    -> helfen
* [Merla und die Hirten holen und zwischen ihnen und den Gnollen vermitteln]
    -> vermitteln
* [Zu Strell gehen und ihm sagen, wo das Lager ist]
    -> verraten

= helfen
~ gnolle_geholfen = true
~ aendern(ruf_gnolle, 1)
„Jorrit kennt ein Versteck“, sagst du. „Weiter oben. Dort sucht keiner.“
{ erster_auftrag == "ginsterhof":
    „Die Karte der Hand“, sagt Jorrit. „Das Versteck darauf. Ich bring sie hin.“
- else:
    Jorrit nickt langsam. „Die alte Schäferhütte unter dem Wolfspfad“, sagt er. „Dort findet sie keiner.“
}
Ashka sieht dich lange an. Dann legt sie dir eine Pfote auf die Schulter. Sie ist schwer und warm. „Mensch-Kind“, sagt sie. „Du hast Wuk zurückgebracht. Und jetzt bringst du uns weg. Das ist zweimal.“

Die Gnolle packen ihre Zelte zusammen, schnell und lautlos. Als die Fackeln der Patrouille die Schlucht erreichen, ist das Lager leer. Nur das Feuer qualmt noch.
{ magie_registriert == "waage":
    ~ von_waage_notiert = true
    Morgen wirst du Strell erklären müssen, warum du nichts gefunden hast.
}
->->

= vermitteln
„Die Hirten glauben, ihr stehlt ihre Schafe“, sagst du. „Aber die Schafe laufen ins Graue. Genau wie Wuk. Wenn die Hirten das wüssten …“

„Dann?“, fragt Ashka.

„Dann wären sie keine Feinde. Dann hättet ihr denselben Feind.“

Ashka denkt lange nach. Dann nickt sie. „Hol sie.“

Du rennst. Den ganzen Weg nach Wollmark, als die Sonne untergeht. Merla steht am Pferch und zählt Schafe.
{ schafe_gefunden:
    Und zum ersten Mal seit einem Monat stimmt ihre Zählung wieder. Die Schafe vom grauen Rand sind von selbst heimgelaufen.
}
Du erzählst ihr alles. Vom Grauen, von Wuk, von Ashka.{ruf_hirten > 0: Merla kennt dich inzwischen. Das hilft.}
~ temp e = probe(ausstrahlung + MAX(0, MIN(ruf_hirten, 2)))
~ probe_zeile("Ausstrahlung", e)
-> vermitteln_ergebnis(e)

= vermitteln_ergebnis(e)
{ e:
- ERFOLG:
    ~ gnolle_vermittelt = true
    ~ aendern(ruf_hirten, 1)
    ~ aendern(ruf_gnolle, 1)
    Merla hört zu, ohne dich zu unterbrechen. Dann nimmt sie ihren Stab und ruft drei ihrer Hirten. „Wenn das gelogen ist“, sagt sie, „dann jag ich dich mit dem Stab vom Hof. Wenn nicht …“ Sie zögert. „Dann haben wir ein größeres Problem als Gnolle.“
    Im letzten Licht sitzen sie sich in der Schlucht gegenüber: Merla mit ihrem Stab, Ashka mit ihrem. Zwei alte Frauen, die beide ihre Herde verloren haben. Es dauert lange. Am Ende reichen sie sich die Hand. Die Hand und die Pfote.
    „Gnolle riechen das Graue“, sagt Ashka. „Wir warnen eure Schafe.“
    „Und wir geben euch Brot“, sagt Merla. „Und schweigen, wenn der Hauptmann fragt.“
- JA_ABER:
    ~ gnolle_vermittelt = true
    ~ aendern(ruf_gnolle, 1)
    Merla glaubt dir nicht. Nicht ganz. Aber sie kommt mit, mit zwei Hirten und ihrem Stab. In der Schlucht sieht sie die Gnollenkinder, mager und müde, und ihr Gesicht verändert sich.
    „Ich verspreche nichts“, sagt sie zu Ashka. Dann reicht sie ihr doch die Hand. Kurz.
- else:
    ~ gnolle_geholfen = true
    Merla schüttelt den Kopf. „Gnolle“, sagt sie. „Du warst zu lange in der Sonne, Kind.“ Sie geht ins Haus.
    Du rennst zurück zur Schlucht, so schnell du kannst. Wenigstens die Gnolle sollst du warnen. Jorrit führt sie zu seinem Versteck, gerade als die Fackeln der Patrouille die Schlucht erreichen.
}
->->

= verraten
~ gnolle_verraten = true
~ aendern(ruf_gnolle, -3)
~ silber += 5
Du stehst auf. Wuk wacht auf und sieht dich an.

Du gehst den Hang hinunter, den Fackeln entgegen. Strell hört dir zu, ohne eine Miene zu verziehen. Dann zählt er dir fünf Silberlinge in die Hand.

„Gut“, sagt er. „Die Waage dankt.“
{ magie_registriert == "waage":
    „Rufer, die sich bewähren, dürfen reisen“, fügt er hinzu. „Ich werde mich daran erinnern.“
    ~ aendern(ruf_goldene_waage, 1)
}

Jorrit ist nicht mitgekommen. Als du dich umdrehst, ist er verschwunden.

Die Patrouille zieht an dir vorbei, den Hang hinauf, zur Schlucht. Du hörst Rufe, Gebell, dann nichts mehr.
->->
