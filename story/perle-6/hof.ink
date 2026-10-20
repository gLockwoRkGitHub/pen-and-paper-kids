// =====================================================================
// Perle 6 – Abend im Hof: Brina, die alte Wasser-Ruferin (Erweiterung 14.10.2026)
// =====================================================================

=== p6_brina
# bild: szene/brina-im-hof
Die alte Frau mit dem Becher sieht zu dir herüber. Sie hat ein Gesicht wie ein Apfel, der zu lange im Keller lag, und sehr helle, sehr wache Augen. Um ihren Hals hängt eine Messingplakette.

„Du bist zu jung für so einen Ort“, sagt sie. „Setz dich. Hier zieht es weniger.“

Sie heißt Brina und kommt aus einem Dorf bei Wollmark. Früher, erzählt sie, hat sie mit dem Wasser gesprochen. Brunnen gefunden, wo keiner einen vermutet hat. Regen gerochen, zwei Tage bevor er kam.

„Und dann kam die Waage mit ihrem Register“, sagt sie. „Mein Enkel war krank in dem Winter. Die Waage hat den Heiler bezahlt. Dafür habe ich unterschrieben.“ Sie dreht den Becher in den Händen. „Seitdem geben wir jeden Neumond einen Funken. Ich habe nicht mehr viele.“
* [Ihr dein Brot geben]
    ~ brina_freundin = true
    ~ brina_wahl = "brot"
    Du holst das letzte Stück Brot aus deinem Bündel und brichst es in zwei Hälften. Brina sieht es lange an. Dann nimmt sie es, und ihre Augen werden feucht.
    „Weißt du, wie lange mir niemand mehr etwas geschenkt hat?“, sagt sie. „Seit dem Register sieht jeder nur, was er von uns bekommen kann.“
* [Fragen, was sie über den Spiegel weiß]
    ~ brina_freundin = true
    ~ brina_wahl = "spiegel"
    „Den Spiegel?“ Brina sieht zum Turm hinauf. „Nachts, wenn alle schlafen, summt er. Leise. Und unter dem Nordturm summen die Kugeln mit, wie Bienen. Wenn man genau hinhört, kann man einzelne Stimmen erkennen.“ Sie schließt die Augen. „Gestern Nacht habe ich meine gehört. Meine eigenen Funken. Sie klangen nach Regen.“
* [Einfach neben ihr sitzen und schweigen]
    Ihr sitzt nebeneinander und seht zu, wie die Sterne über der Schlucht aufgehen. Nach einer Weile legt Brina dir eine Hand auf den Arm. Sie ist leicht wie ein Blatt.
    „Das ist gut“, sagt sie. „Nicht reden. Das können hier alle gut. Aber zusammen nicht reden, das ist etwas anderes.“
    ~ brina_freundin = true
    ~ brina_wahl = "schweigen"
-
{ element == "wasser":
    Dann sieht sie dich plötzlich scharf an. „Du hörst es auch“, sagt sie leise. „Das Wasser. Ich sehe es an deinen Händen.“ Sie lächelt. „Pass auf, dass sie es dir nicht nehmen.“
- else:
    { magie_registriert == "waage":
        Ihr Blick fällt auf deine Plakette. Sie sagt nichts. Sie nimmt nur deine Hand und drückt sie.
    }
}

„Morgen“, sagt Brina, „ist die Vorführung. Dann nehmen sie alles, was wir noch haben. Wenn ich umfalle, Kind, dann hilf mir nicht. Sonst sehen sie dich.“

Du sagst nichts. Aber du weißt schon jetzt, dass du dich nicht daran halten wirst.
->->


// =====================================================================
// Perle 6 – Lager an der Straße: Jaro, ein junger Söldner (Erweiterung 14.10.2026)
// =====================================================================

=== p6_strassenlager
Bis Vardholm ist es noch eine Stunde, aber die Sonne ist schon hinter den Weiden versunken. Die Söldner lassen die Reihe am Straßenrand Halt machen. Feuer werden angezündet, Decken ausgerollt. Niemand redet laut.
{ magie_registriert != "waage":
    Du suchst dir einen Platz etwas abseits, hinter einem Felsen, nah genug, um die Feuer zu sehen.
}

# bild: szene/jaro-am-feuer
Ein junger Söldner setzt sich mit seinem Napf ganz in deine Nähe. Er ist kaum älter als siebzehn, hat Sommersprossen und eine Brustplatte, die ihm eine Nummer zu groß ist. Er isst, ohne aufzusehen. Dann bemerkt er dich.

„Du bist doch {geschlecht == "w":keine Eingeschriebene|kein Eingeschriebener}“, sagt er{magie_registriert == "waage":. Dann sieht er deine Plakette. „Oh. Doch.“ Er verzieht das Gesicht. „Tut mir leid.“|. Dann zuckt er mit den Schultern. „Ist mir egal. Ich hab Feierabend.“}

Er heißt Jaro und kommt aus dem Hafenviertel von Lysmara. „Bei der Waage gibt es doppelten Lohn“, sagt er. „Meine Mutter hat sechs Kinder. Da fragt man nicht lange.“
* {kugeln_verstanden || kisten_gesehen || kugelhalle_gesehen} [Ihm erzählen, was in den Glaskugeln steckt]
    ~ jaro_gesprochen = true
    ~ jaro_kugeln = true
    Du erzählst es ihm. Von den Kugeln, die Funken fangen. Von Leuten, denen man ihre Gabe nimmt, Neumond für Neumond.
    Jaro hört auf zu essen. „Das …“, sagt er. Dann sieht er hinüber zu der langen Reihe der Eingeschriebenen, die an den Feuern sitzen und auf ihre Hände starren. „Ich hab gedacht, die sind einfach müde vom Laufen.“
    Lange sagt er nichts mehr. Dann steht er auf und bringt seinen halben Napf Eintopf zu einem alten Mann am nächsten Feuer.
* [Fragen, was in Vardholm passiert]
    ~ jaro_gesprochen = true
    „Die Vorführung“, sagt Jaro. „Morgen kommt die Waagmeisterin selbst, mit dem ganzen Rat. Sie wollen das Werk zeigen.“ Er senkt die Stimme. „Ich war einmal oben auf dem Turm, zum Wachehalten. Der Spiegel summt. Die ganze Nacht. Ich hab danach drei Tage nichts mehr richtig gehört.“ Er sieht dich an. „Ist das normal? Bei Magie?“
    Du weißt es nicht. Aber du glaubst es nicht.
* [Ihm nur zunicken und weiteressen]
    Ihr esst schweigend nebeneinander. Als er geht, sagt Jaro: „Gute Nacht.“ Er klingt, als hätte er das lange zu niemandem mehr gesagt.
-
In der Nacht liegst du lange wach. Über der Schlucht steht ein schmaler Mond. Und ganz leise, so leise, dass du nicht sicher bist, ob du es wirklich hörst, summt etwas aus der Richtung der Festung. Wie Bienen in einem Glas.

Am nächsten Morgen zieht die Reihe weiter. Die letzte Stunde bis zum Tor.
->->
