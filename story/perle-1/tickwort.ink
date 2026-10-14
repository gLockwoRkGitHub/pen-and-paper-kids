// =====================================================================
// Perle 1 – Tickwort, der Erklärautomat
// Begegnung und Einführung: Werte, Würfelprobe, Tagebuch und Karte.
// =====================================================================

=== p1_tickwort
# bild: szene/zwirbelgasse
# karte: lysmara
Du ziehst los. Irgendwo in dieser Stadt muss es Silber zu verdienen geben.

Der kürzeste Weg zum Markt führt durch die Zwirbelgasse, wo die Werkstätten der Gnome Wand an Wand stehen. Hier riecht es nach Öl und heißem Metall, und aus jedem Fenster tickt, rattert oder pfeift es.

Du bist gerade an der Werkstatt Pimpelgrund & Zahnrad vorbei, als hinter dir eine Tür auffliegt.

„… und DREI STUNDEN für eine einzige Schraube! RAUS!“

Etwas fliegt in hohem Bogen auf die Gasse, kullert über das Pflaster und bleibt direkt vor deinen Füßen liegen.

# bild: figur/tickwort
Es ist ein kleiner Automat aus Messing, ungefähr so groß wie eine Katze. Er hat einen kugelrunden Bauch, zwei dünne Arme, drei kurze Beine und ein einziges großes Glasauge, das sich surrend scharf stellt. Aus einem winzigen Schornstein auf seinem Kopf steigt ein empörtes Dampfwölkchen.

„Ich möchte festhalten“, ruft der Automat Richtung Tür, „dass es sich um eine Schraube mit Linksgewinde handelte und eine Erklärung in vier Teilen daher durchaus angemessen …“

Die Tür knallt zu.

Der Automat seufzt. Es klingt wie ein Teekessel, der aufgibt.
* [Ihm aufhelfen]
    ~ aendern(beziehung_tickwort, 1)
    Du hebst ihn hoch und stellst ihn auf seine drei Beine. Er ist schwerer, als er aussieht, und warm wie ein Ofen am Morgen.
    „Oh“, sagt er. „Danke. Das … passiert mir nicht oft.“
* [Lachen. Du kannst nicht anders.]
    Du prustest los. Der Automat sieht dich vorwurfsvoll an. Dann gibt er ein kleines Pfeifen von sich, das verdächtig nach Kichern klingt.
    „Ja“, sagt er. „Von außen betrachtet ist es vermutlich komisch.“
* [Einfach weitergehen]
    Du steigst über ihn hinweg und gehst weiter. Hinter dir klappert es. Er rappelt sich auf und läuft dir nach, tick-tack-tick, auf seinen drei kurzen Beinen.
    „Warte! Bitte! Du siehst aus wie jemand, der ein Problem hat. Und ich bin sehr gut mit Problemen.“
- „Tickwort“, stellt er sich vor und verbeugt sich so tief, dass er fast umkippt. „Erklärautomat der dritten Baureihe. Ich erkläre Dinge. Ausführlich. Offenbar zu ausführlich.“

Sein Glasauge surrt, während er dich mustert.

„Übrigens duze ich dich. Das spart pro Satz im Schnitt eine Drittelsilbe. Bei meiner Redemenge lohnt sich das.“ Er legt den Kopf schief. „Du hast ein Problem. Deine Stirn hat genau drei Falten. Drei Falten bedeuten: ernstes Problem. Darf ich fragen, welches?“
* [Ihm alles erzählen]
    ~ aendern(beziehung_tickwort, 1)
    Du erzählst ihm alles.
    { ausloeser:
    - "verschwunden":
        Von {bp()}, dem Zettel auf dem Tisch und dem Nyrrspalt.
    - "brief":
        Von dem Fremden mit den Mondlicht-Augen, dem Brief und dem Spiralsiegel.
    - "schulden":
        Von Fesk, den vierzig Silbermark und davon, dass das Kontor {pfand()} nehmen will.
    - "flucht":
        Von den Kisten am Nordkai, der Glaskugel mit dem gefangenen Blitz und den Söldnern, die jetzt von Tür zu Tür gehen.
    }
    Tickwort hört zu, ohne dich ein einziges Mal zu unterbrechen. Das scheint ihn große Mühe zu kosten.
* [Nur das Nötigste sagen]
    „Ich muss durch den Nyrrspalt“, sagst du. „Und dafür brauche ich Geld.“
- „Ah!“ Tickworts Schornstein pufft begeistert. „Dann brauchst du einen Plan. Ich liebe Pläne. Darf ich erklären?“

Ohne auf eine Antwort zu warten, fängt er an.
-> werte

= werte
# tutorial: werte
„Erstens: Jedes Wesen hat Stärken. Ich messe vier davon.“ Sein Glasauge surrt. „Bei dir sehe ich …“

Kraft {kraft} · Geschick {geschick} · Verstand {verstand} · Ausstrahlung {ausstrahlung}

„Kraft brauchst du zum Heben, Schieben und Festhalten. Geschick zum Klettern, Schleichen und Fangen. Verstand zum Nachdenken, Erinnern und Durchschauen. Ausstrahlung zum Überzeugen, Beruhigen und, nun ja, Flunkern.“
-> probe_ueben

= probe_ueben
# tutorial: probe
„Zweitens: Wenn du etwas Schwieriges versuchst, würfelst du mit zwei Würfeln und zählst den passenden Wert dazu.“ Er hebt einen dünnen Finger. „Zehn oder mehr: Es klappt.“

Er hebt einen zweiten Finger. „Sieben bis neun: Es klappt, aber … Es gibt immer ein Aber.“

Ein dritter Finger. „Sechs oder weniger: Es klappt nicht. Aber die Welt geht davon nicht unter. Meistens.“

„Probieren wir es aus. Siehst du die Münze da im Rinnstein?“

Tatsächlich. Zwischen den Gitterstäben eines Abflusses glänzt etwas.
* [Die Münze herausfischen (Geschick)]
    ~ temp e = probe(geschick)
    ~ probe_zeile("Geschick", e)
    { e:
    - ERFOLG:
        ~ silber += 1
        Mit zwei Fingern angelst du die Münze heraus. Ein Silberling!
        „Hervorragend“, sagt Tickwort. „Lehrbuchhaft. Ich würde applaudieren, aber meine Hände sind dafür nicht gebaut.“
    - JA_ABER:
        ~ silber += 1
        Du bekommst die Münze zu fassen, aber dein Ärmel taucht tief in den Rinnstein. Er riecht jetzt nach Fisch und nach Dingen, über die man lieber nicht nachdenkt.
        „Ein klassisches Ja, aber“, sagt Tickwort zufrieden.
    - else:
        Die Münze rutscht dir von den Fingern und verschwindet gluckernd in der Tiefe.
        „Ein Misserfolg“, sagt Tickwort sanft. „Siehst du? Die Welt ist nicht untergegangen. Ich habe nachgesehen.“
    }
* [Tickwort machen lassen]
    ~ silber += 1
    Tickwort fährt einen Arm aus, der plötzlich dreimal so lang ist wie vorher, angelt die Münze heraus und reicht sie dir.
    „Manchmal“, sagt er, „ist die beste Probe die, die ein anderer würfelt.“
- -> buch

= buch
# tutorial: tagebuch
„Drittens.“ Tickwort öffnet eine Klappe in seinem Bauch und zieht ein kleines, in Leder gebundenes Buch hervor, dazu einen Kohlestift. „Ich trage immer ein leeres Buch bei mir. Für den Fall, dass jemand etwas aufschreiben möchte.“ Er seufzt. „Niemand möchte je.“

Er drückt dir beides in die Hand.

„Schreib auf, was du erlebst. Und zeichne, wo du warst. Eine Karte, die man selbst gezeichnet hat, vergisst man nie.“

# tagebuch: Die erste Seite
Du schlägst die erste Seite auf. Sie ist leer. Du denkst einen Moment nach. Dann zeichnest du eine Küstenlinie, einen Hafen, ein paar Dächer.

Lysmara.
# karte: lysmara

Es ist keine schöne Karte. Aber es ist deine. # tagebuch_ende
-> plan

= plan
„Viertens, und das ist der Plan.“ Tickwort reckt sich zu voller Größe, was nicht viel ist. „Zehn Silberlinge Zoll. Du hast {silberlinge(silber)}. Es fehlen also {zahl(10 - silber)}.“

„Ich habe heute Morgen, bevor man mich hinausgeworfen hat, alle Aushänge am Markt gelesen. Zweimal. Es gibt drei Möglichkeiten, schnell Silber zu verdienen. Am Hafen sucht der Hafenmeister Hilfe beim Entladen. Die Gesellschaft der Weiten Feder zahlt für Skizzen. Und auf dem Markt …“ Er senkt die Stimme. „… sucht jemand einen Boten, der keine Fragen stellt.“

„Ich schlage vor, wir fangen an. Ich komme natürlich mit.“ Er zögert. „Wenn ich darf.“
* [„Natürlich darfst du.“]
    ~ aendern(beziehung_tickwort, 1)
    Tickworts Schornstein stößt drei kleine Dampfringe aus. Du hast das Gefühl, dass das bei ihm ein Lächeln ist.
* [„Kann ich dich denn davon abhalten?“]
    „Rein technisch gesehen nein“, sagt Tickwort. „Ich habe drei Beine und keine anderen Termine.“
- ->->
