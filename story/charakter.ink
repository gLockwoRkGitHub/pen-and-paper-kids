// =====================================================================
// Charaktererstellung
// Den Namen gibt die App als Freitext ein (Variable "name").
// Danach folgen die Start-Fragen in Perle 1.
// =====================================================================

=== charaktererstellung
# charaktererstellung
-> geschlecht_waehlen

= geschlecht_waehlen
Wer bist du?
+ [Ein Junge]
    ~ geschlecht = "m"
+ [Ein Mädchen]
    ~ geschlecht = "w"
- -> volk_waehlen

= volk_waehlen
Zu welchem Volk gehörst du?
+ [Mensch – anpassungsfähig, zu Hause in jeder Stadt]
    ~ volk = "mensch"
+ [Zwerg – stark und stur wie der Fels]
    ~ volk = "zwerg"
+ [Gnom – klein, klug und voller Ideen]
    ~ volk = "gnom"
+ [Ork – laut, stolz und mit dem Herz am rechten Fleck]
    ~ volk = "ork"
+ [Troll – geschmeidig, flink und schwer zu fassen]
    ~ volk = "troll"
- -> hintergrund_waehlen

= hintergrund_waehlen
Was hast du bisher getan?
+ [{geschlecht == "w":Reisende|Reisender} – du kennst Wege, die auf keiner Karte stehen]
    ~ hintergrund = "reisender"
+ [{geschlecht == "w":Schaustellerin|Schausteller} – du weißt, wie man ein Publikum fesselt]
    ~ hintergrund = "schausteller"
+ [Straßenkind – du kennst jede Gasse und jeden Trick]
    ~ hintergrund = "strassenkind"
+ [{geschlecht == "w":Botenläuferin|Botenläufer} – du bist schnell und kennst jeden Torwächter]
    ~ hintergrund = "botenlaeufer"
+ [Kartografenlehrling – du zeichnest, was andere übersehen]
    ~ hintergrund = "kartografenlehrling"
+ [{geschlecht == "w":Schiffsmädchen|Schiffsjunge} – du kennst Taue, Takelage und Luftschiffe]
    ~ hintergrund = "schiffsjunge"
- -> werte_verteilen

= werte_verteilen
Worin bist du am besten? (+2)
-> wert_waehlen(2) ->
Und worin bist du noch gut? (+1)
-> wert_waehlen(1) ->
Und noch eine Sache? (+1)
-> wert_waehlen(1) ->
-> volksbonus

= volksbonus
// Vorschlag: Bonus +1 je nach Volk (siehe docs/regeln.md)
{ volk:
- "mensch":
    Als Mensch passt du dich an. Worin wirst du noch besser? (+1)
    -> wert_waehlen(1) ->
- "zwerg":
    Zwerge sind stark wie der Fels: +1 Kraft.
    ~ steigern(kraft)
- "gnom":
    Gnome stecken voller Ideen: +1 Verstand.
    ~ steigern(verstand)
- "ork":
    Orks sind laut und stolz, und man hört ihnen zu: +1 Ausstrahlung.
    ~ steigern(ausstrahlung)
- "troll":
    Trolle sind geschmeidig und flink: +1 Geschick.
    ~ steigern(geschick)
}
# werte_fertig
->->  // zurück zu main.ink

// Wählt einen Wert und erhöht ihn um "um". Nur Werte, die nach der Erhöhung
// den Höchstwert nicht übersteigen, werden angeboten.
=== wert_waehlen(um)
+ {kraft + um <= HOECHSTWERT} [Kraft ({kraft})]
    ~ kraft += um
+ {geschick + um <= HOECHSTWERT} [Geschick ({geschick})]
    ~ geschick += um
+ {verstand + um <= HOECHSTWERT} [Verstand ({verstand})]
    ~ verstand += um
+ {ausstrahlung + um <= HOECHSTWERT} [Ausstrahlung ({ausstrahlung})]
    ~ ausstrahlung += um
- ->->
