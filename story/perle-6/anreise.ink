// =====================================================================
// Perle 6 – Anreise auf der Spaltstraße und der Weg in die Festung
// =====================================================================

=== p6_anreise
# bild: entdeckung/spaltstrasse-vardholm
# karte: vardholm
Von den Minen gehst du nach Süden, bis du wieder auf die Spaltstraße triffst. Dann nach Osten. Den ganzen Tag lang wird der Kharvan-Kamm größer und größer, bis er der Himmel selbst zu sein scheint. Und dann siehst du sie: die Schlucht.

Der Nyrrspalt ist ein Schnitt im Berg, so schmal, als hätte ein Riese mit der Axt hineingeschlagen. Und in dem Schnitt, quer über die ganze Breite, liegt Vardholm. Mauern aus grauem Stein, drei Türme, ein Tor aus schwarzem Eisen. Auf dem höchsten Turm steht etwas, das in der Abendsonne blitzt wie ein riesiges Auge.

Auf der Straße vor dir ziehen Menschen. Keine Händler. Eine lange, stille Reihe von Leuten, junge und alte, manche mit Bündeln auf dem Rücken. Vor und hinter ihnen reiten Söldner der Waage. Jeder in der Reihe trägt eine Messingplakette um den Hals.

Die Eingeschriebenen. Gerufen nach Vardholm. Für das Werk.
{ talin_hilft:
    In der Reihe entdeckst du ein dünnes Gesicht mit strubbeligen schwarzen Haaren. Talin. Er sieht dich und hebt kaum merklich die Hand.
}
{ magie_registriert == "waage":
    Ein Söldner reitet auf dich zu und sieht auf deine Plakette. „Da ist ja noch einer“, sagt er. „In die Reihe, Rufer. Du wirst erwartet.“
}
->->


=== p6_hinein
{ magie_registriert == "waage":
    -> gerufen
}
Am Tor stehen zwanzig Söldner. Niemand kommt hinein, der nicht eingeschrieben ist oder Kisten liefert.

Wie kommst du in die Festung?
* {strell_schuldet} [Nach Hauptmann Strell fragen. Er schuldet dir etwas.]
    -> strell
* {talin_hilft} [Dich als Talins Gehilfe in die Reihe der Eingeschriebenen stellen]
    -> talin
* {vardholm_hinweis || yrsa_getroffen} [Nach Yrsas Lieferkarren Ausschau halten]
    -> yrsa
* [Nachts über die Mauer klettern, dort, wo sie an den Fels stößt (Geschick)]
    -> mauer

= gerufen
~ vardholm_zugang = "gerufen"
Du gehst in der Reihe der Eingeschriebenen. Niemand spricht. Am Tor nimmt ein Schreiber deine Plakette, liest die Nummer und macht einen Haken in seinem Buch.

„Morgen Abend“, sagt er, ohne aufzusehen. „Bei der Vorführung. Bis dahin wartest du im Hof wie alle anderen.“

Du bist drin. So einfach war es noch nie. Und es hat sich noch nie so falsch angefühlt.
->->

= strell
~ vardholm_zugang = "strell"
Es dauert eine Stunde, bis Strell ans Tor kommt. Er sieht dich lange an.

„Ich habe gesagt, ich weiß nicht, wie man das zurückzahlt“, sagt er schließlich. „Vielleicht so.“ Er nickt den Wachen zu. „Gehört zu mir.“

Im Hof bleibt er stehen. „Was immer du hier willst“, sagt er leise, „tu es nicht vor meinen Augen. Dann muss ich nichts sehen.“
->->

= talin
~ vardholm_zugang = "talin"
Du stellst dich neben Talin in die Reihe. Am Tor hält der Schreiber dich auf. „Plakette?“

„Mein Gehilfe“, sagt Talin schnell. „Trägt mein Werkzeug. Ich bin Erd-Rufer, ich brauche Werkzeug.“

Der Schreiber sieht euch beide an, dann die lange Reihe hinter euch, dann seufzt er und winkt. „Weiter.“
->->

= yrsa
~ vardholm_zugang = "yrsa"
~ yrsa_in_vardholm = true
# bild: szene/yrsas-karren
Ein schwerer Karren rollt die Straße herauf, beladen mit Kisten voller kleiner eiserner Körbe. Auf dem Bock sitzt nicht der Fuhrmann. Auf dem Bock sitzt eine alte Frau mit einem rostroten Tuch über dem grauen Haar.

Yrsa.

„Fünfzig Jahre schmiede ich Dinge, ohne zu wissen, wofür“, sagt sie, als du neben den Karren trittst. „Diesmal will ich es sehen.“ Sie hebt eine Plane an. „Rein mit dir. Zwischen die Körbe. Und mach dich dünn.“

Am Tor werfen die Söldner einen Blick auf die Körbe und winken den Karren durch. Sie kennen die Lieferung.
->->

= mauer
~ vardholm_zugang = "mauer"
# bild: szene/mauer-vardholm
Du wartest, bis es dunkel ist. Dort, wo die Mauer an den Fels der Schlucht stößt, ist der Stein rau und voller Risse.
~ temp e = probe(geschick)
~ probe_zeile("Geschick", e)
{ e:
- ERFOLG:
    Griff um Griff kletterst du hinauf. Oben schaust du dich um, niemand da, und lässt dich auf der anderen Seite in einen Heuhaufen fallen.
- JA_ABER:
    Du kommst hinauf. Beim Hinunterklettern rutschst du ab und landest in einem Wassertrog. Ein Pferd sieht dich vorwurfsvoll an. Aber niemand sonst.
- else:
    Auf halber Höhe brechen dir zwei Steine unter den Fingern weg. Du klammerst dich fest, hängst, schwitzt. Oben hörst du Schritte. Ein Söldner beugt sich über die Mauer, sieht dich und starrt.
    Dann zieht er dich hoch. „Noch einer, der zum Werk will?“, sagt er und lacht. „Komm, Kind. Rufer gehören in den Hof. Die Waagmeisterin will alle sehen.“
    Er hält dich für einen Eingeschriebenen. Du widersprichst nicht.
    ~ gesucht = true
}
->->
