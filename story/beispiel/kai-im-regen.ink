// Beispielszene – zeigt das Story-Format (Ink).
// Kein Teil der echten Story.

// --- Werte der Spielfigur ---
VAR geschick = 1

// --- Weltgedächtnis ---
VAR kobold_gerettet = false
VAR tasche_verloren = false

// --- Unsichtbare Element-Neigung ---
VAR neigung_wasser = 0
VAR neigung_feuer = 0

-> hafen_nacht

=== hafen_nacht ===
Der Regen trommelt auf die Dächer von Lysmara. Unten am Kai ruft jemand um Hilfe.
* [Zum Kai hinunterlaufen]
    ~ neigung_wasser += 1
    -> kai
* [Am Kamin bleiben und lauschen]
    ~ neigung_feuer += 1
    -> kamin

=== kai ===
Ein kleiner Kobold hängt an einem Tau über dem schwarzen Hafenwasser. Seine Finger rutschen.
* [Ihn hochziehen (Geschick)]
    ~ temp wurf = wuerfeln(geschick)
    {
    - wurf >= 10:
        Mit einem Ruck ziehst du ihn aufs Pflaster. Er starrt dich an – und merkt sich dein Gesicht.
        ~ kobold_gerettet = true
    - wurf >= 7:
        Du bekommst ihn zu fassen. Dabei rutscht deine Tasche ins Hafenbecken.
        ~ kobold_gerettet = true
        ~ tasche_verloren = true
    - else:
        Das Tau reißt. Der Kobold klatscht ins Wasser und paddelt fluchend davon.
    }
    -> morgen
* [Nach der Hafenwache rufen]
    Bis die Wache kommt, ist der Kobold verschwunden.
    -> morgen

=== kamin ===
Die Rufe werden leiser und verstummen. Im Feuer knackt ein Scheit.
-> morgen

=== morgen ===
{kobold_gerettet: Am Morgen liegt ein glänzender Erzbrocken vor deiner Tür.}
{not kobold_gerettet: Am Morgen erinnert nichts mehr an die Nacht.}
-> END

// --- Würfelprobe: 2W6 + Wert ---
=== function wuerfeln(wert) ===
~ return RANDOM(1, 6) + RANDOM(1, 6) + wert
