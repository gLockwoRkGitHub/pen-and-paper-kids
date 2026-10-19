// =====================================================================
// Funktionen und wiederverwendbare Abläufe
// =====================================================================

CONST MISSERFOLG = 0
CONST JA_ABER = 1
CONST ERFOLG = 2
CONST KEINE_KRAFT = -1
CONST HOECHSTWERT = 3

// --- Würfelprobe: 2W6 + Wert ---
// Ergebnis: ERFOLG (10+), JA_ABER (7–9), MISSERFOLG (6 oder weniger)
=== function probe(wert)
~ letzter_augen = RANDOM(1, 6) + RANDOM(1, 6)
~ letzter_gesamt = letzter_augen + wert
~ temp wurf = letzter_gesamt
{
- wurf >= 10:
    ~ return ERFOLG
- wurf >= 7:
    ~ return JA_ABER
- else:
    ~ return MISSERFOLG
}

// --- Zauberprobe: 2W6 + Elementstufe + Umgebung ---
// umgebung: 1 = Element stark vorhanden, 0 = vorhanden, -1 = fehlt
// Kostet einen Kraftfunken. Fehlt das Element, wird die Quelle verbraucht.
// Wind braucht nie eine Quelle.
=== function zauber(umgebung)
{
- kraftfunken <= 0:
    ~ return KEINE_KRAFT
- umgebung < 0 && element != "wind" && not quelle:
    ~ return KEINE_KRAFT
}
{ umgebung < 0 && element != "wind":
    ~ quelle = false
}
~ kraftfunken -= 1
~ return probe(elementstufe + MAX(umgebung, 0))

// --- Ergebnis als Wort ---
=== function ergebnis(e)
{ e:
- ERFOLG:
    ~ return "Erfolg!"
- JA_ABER:
    ~ return "Ja, aber …"
- else:
    ~ return "Misserfolg"
}

// --- Zeigt die letzte Probe an, z. B. „(Geschick: Würfel 8 + 1 = 9 – Ja, aber …)“ ---
// Aufruf direkt nach probe(): ~ probe_zeile("Geschick", e)
=== function probe_zeile(wertname, e)
# probe
({wertname}: Würfel {letzter_augen} + {letzter_gesamt - letzter_augen} = {letzter_gesamt} – {ergebnis(e)})

// --- Kann gerade gezaubert werden? (für Bedingungen bei Entscheidungen) ---
=== function kann_zaubern(umgebung)
{
- element == "" || kraftfunken <= 0:
    ~ return false
- umgebung < 0 && element != "wind" && not quelle:
    ~ return false
}
~ return true

// --- Einmaliger Bonus aus der Extra-Übung beim Mentor (Perle 3) ---
// Nur bei Zaubern mit Umgebung 0 oder 1 verwenden: zauber(1 + tipp_bonus())
=== function tipp_bonus()
{ mentor_tipp:
    ~ mentor_tipp = false
    ~ return 1
}
~ return 0

// --- Rasten: Kraftfunken auffüllen ---
=== function rasten()
{ elementstufe > 0:
    ~ kraftfunken = elementstufe + 1
    // Wer bei der Waage eingeschrieben ist, gibt seit dem ersten Neumond dauerhaft einen Funken ab.
    { neumond_funke && magie_registriert == "waage":
        ~ kraftfunken = kraftfunken - 1
    }
}

// --- Stärkste Element-Neigung ---
// Bei Gleichstand entscheidet der Zufall zwischen den gleich starken Elementen.
=== function staerkste_neigung()
~ temp beste = MAX(MAX(neigung_erde, neigung_wasser), MAX(neigung_feuer, neigung_wind))
~ temp anzahl = 0
{ neigung_erde == beste:
    ~ anzahl += 1
}
{ neigung_wasser == beste:
    ~ anzahl += 1
}
{ neigung_feuer == beste:
    ~ anzahl += 1
}
{ neigung_wind == beste:
    ~ anzahl += 1
}
~ temp los = RANDOM(1, anzahl)
{ neigung_erde == beste:
    ~ los -= 1
    { los == 0:
        ~ return "erde"
    }
}
{ neigung_wasser == beste:
    ~ los -= 1
    { los == 0:
        ~ return "wasser"
    }
}
{ neigung_feuer == beste:
    ~ los -= 1
    { los == 0:
        ~ return "feuer"
    }
}
~ return "wind"

// --- Wert um 1 erhöhen, höchstens bis HOECHSTWERT ---
=== function steigern(ref wert)
~ wert = MIN(wert + 1, HOECHSTWERT)

// --- Ruf und Beziehungen bleiben zwischen -3 und +3 ---
=== function aendern(ref wert, um)
~ wert = MAX(-3, MIN(3, wert + um))

// --- Alle Werte ausgereizt? ---
=== function ausgereizt()
~ return kraft >= HOECHSTWERT && geschick >= HOECHSTWERT && verstand >= HOECHSTWERT && ausstrahlung >= HOECHSTWERT

// --- Level-Up am Ende jeder Perle (Aufruf als Tunnel: -> level_up ->) ---
=== level_up
~ level += 1
# level_up
Du spürst, dass du gewachsen bist.
{ ausgereizt():
    Stärker kannst du kaum werden – doch die Welt hat noch anderes für dich bereit.
    // Freischaltung aus der Geschichte (Fähigkeit, Titel) – wird je Perle ergänzt.
    ->->
}
Worin bist du besser geworden?
+ {kraft < HOECHSTWERT} [Kraft ({kraft} → {kraft + 1})]
    ~ steigern(kraft)
+ {geschick < HOECHSTWERT} [Geschick ({geschick} → {geschick + 1})]
    ~ steigern(geschick)
+ {verstand < HOECHSTWERT} [Verstand ({verstand} → {verstand + 1})]
    ~ steigern(verstand)
+ {ausstrahlung < HOECHSTWERT} [Ausstrahlung ({ausstrahlung} → {ausstrahlung + 1})]
    ~ steigern(ausstrahlung)
- ->->

// =====================================================================
// Sprache: Namen und Pronomen
// =====================================================================

// --- Spielfigur ---
=== function anrede()
{ geschlecht == "w":
    ~ return "junge Dame"
}
~ return "junger Herr"

=== function volk_wort()
{ volk:
- "mensch":
    ~ return "Mensch"
- "zwerg":
    ~ return "{geschlecht == "w":Zwergin|Zwerg}"
- "gnom":
    ~ return "{geschlecht == "w":Gnomin|Gnom}"
- "ork":
    ~ return "{geschlecht == "w":Orkin|Ork}"
- "troll":
    ~ return "{geschlecht == "w":Trollin|Troll}"
}
~ return "Wanderer"

// --- Wie die Kobolde die Spielfigur nennen: „Großer Mensch“, „Große Zwergin“ …
// akk = true: Akkusativ, klein („großen Menschen“, „große Zwergin“)
=== function grosse_figur(akk)
~ temp wort = volk_wort()
{ geschlecht == "w" && volk != "mensch" && volk != "":
    { akk:
        ~ return "große {wort}"
    }
    ~ return "Große {wort}"
}
{ akk:
    { volk == "mensch":
        ~ return "großen Menschen"
    }
    ~ return "großen {wort}"
}
~ return "Großer {wort}"

// --- Freund bzw. Freundin: Spielt man einen Jungen, ist es Liora, sonst Cassian ---
=== function freund()
{ geschlecht == "w":
    ~ return "Cassian"
}
~ return "Liora"

// --- Kurzname des Freundes in Kleinbuchstaben, für Bildvarianten ---
// z. B. # bild: szene/freund-faellt-{freund_kurz()}
=== function freund_kurz()
{ geschlecht == "w":
    ~ return "cassian"
}
~ return "liora"

=== function fr_ist_m()
~ return geschlecht == "w"

// Nominativ, Akkusativ, Dativ, Possessiv-Stamm (+e, +en, +er …)
=== function fr_er()
~ return "{fr_ist_m():er|sie}"
=== function Fr_er()
~ return "{fr_ist_m():Er|Sie}"
=== function fr_ihn()
~ return "{fr_ist_m():ihn|sie}"
=== function fr_ihm()
~ return "{fr_ist_m():ihm|ihr}"
=== function fr_sein()
~ return "{fr_ist_m():sein|ihr}"
=== function Fr_sein()
~ return "{fr_ist_m():Sein|Ihr}"
=== function fr_wort()
~ return "{fr_ist_m():Freund|Freundin}"

// --- Bezugsperson je Hintergrund ---
=== function bp()
{ hintergrund:
- "reisender":
    ~ return "Maren"
- "schausteller":
    ~ return "Bonifaz"
- "strassenkind":
    ~ return "Mutter Kessel"
- "botenlaeufer":
    ~ return "Meister Holm"
- "kartografenlehrling":
    ~ return "Meisterin Ysolde"
- "schiffsjunge":
    ~ return "Kapitänin Rhea"
}
~ return "Maren"

=== function bp_ist_m()
~ return hintergrund == "schausteller" || hintergrund == "botenlaeufer"

=== function bp_er()
~ return "{bp_ist_m():er|sie}"
=== function Bp_er()
~ return "{bp_ist_m():Er|Sie}"
=== function bp_ihn()
~ return "{bp_ist_m():ihn|sie}"
=== function bp_ihm()
~ return "{bp_ist_m():ihm|ihr}"
=== function bp_sein()
~ return "{bp_ist_m():sein|ihr}"

// Wohin die Spielfigur heimkehrt (mit Präposition), z. B. „Als du {zuhause()} zurückkehrst“
=== function zuhause()
{ hintergrund:
- "reisender":
    ~ return "in eure Kammer im Gasthaus Zum Rostigen Anker"
- "schausteller":
    ~ return "in den Wagen der Funkelnden Narren"
- "strassenkind":
    ~ return "in die Garküche am Fischmarkt"
- "botenlaeufer":
    ~ return "in die Schlafkammer über dem Botenhaus"
- "kartografenlehrling":
    ~ return "in die Werkstatt der Weiten Feder"
- "schiffsjunge":
    ~ return "an Bord der Seemöwe"
}
~ return "in eure Kammer"

// Was das Silbermark-Kontor als Pfand nehmen will
=== function pfand()
{ hintergrund:
- "reisender":
    ~ return "Marens Packpferd und alle Waren"
- "schausteller":
    ~ return "die Wagen der Truppe"
- "strassenkind":
    ~ return "Mutter Kessels Garküche"
- "botenlaeufer":
    ~ return "das Botenhaus"
- "kartografenlehrling":
    ~ return "Ysoldes Karten"
- "schiffsjunge":
    ~ return "die Seemöwe"
}
~ return "alles"

// --- Zahl als Wort (0–20), sonst als Ziffer ---
=== function zahl(n)
{ n:
- 0:
    ~ return "null"
- 1:
    ~ return "eins"
- 2:
    ~ return "zwei"
- 3:
    ~ return "drei"
- 4:
    ~ return "vier"
- 5:
    ~ return "fünf"
- 6:
    ~ return "sechs"
- 7:
    ~ return "sieben"
- 8:
    ~ return "acht"
- 9:
    ~ return "neun"
- 10:
    ~ return "zehn"
- 11:
    ~ return "elf"
- 12:
    ~ return "zwölf"
- 13:
    ~ return "dreizehn"
- 14:
    ~ return "vierzehn"
- 15:
    ~ return "fünfzehn"
- 16:
    ~ return "sechzehn"
- 17:
    ~ return "siebzehn"
- 18:
    ~ return "achtzehn"
- 19:
    ~ return "neunzehn"
- 20:
    ~ return "zwanzig"
}
~ return n

// --- Silberlinge mit richtiger Endung: „keinen Silberling“, „einen Silberling“, „sechs Silberlinge“ ---
// Akkusativ (z. B. „Du hast …“)
=== function silberlinge(n)
{
- n <= 0:
    ~ return "keinen Silberling"
- n == 1:
    ~ return "einen Silberling"
}
~ return "{zahl(n)} Silberlinge"

// Nominativ, großgeschrieben am Satzanfang (z. B. „Sechs Silberlinge.“)
=== function Silberlinge(n)
{
- n <= 0:
    ~ return "Kein Silberling"
- n == 1:
    ~ return "Ein Silberling"
}
~ return "{Zahl(n)} Silberlinge"

=== function Zahl(n)
{ n:
- 2:
    ~ return "Zwei"
- 3:
    ~ return "Drei"
- 4:
    ~ return "Vier"
- 5:
    ~ return "Fünf"
- 6:
    ~ return "Sechs"
- 7:
    ~ return "Sieben"
- 8:
    ~ return "Acht"
- 9:
    ~ return "Neun"
- 10:
    ~ return "Zehn"
- 11:
    ~ return "Elf"
- 12:
    ~ return "Zwölf"
- 13:
    ~ return "Dreizehn"
- 14:
    ~ return "Vierzehn"
- 15:
    ~ return "Fünfzehn"
}
~ return n

// --- Element als Wort ---
=== function element_wort(el)
{ el:
- "erde":
    ~ return "Erde"
- "wasser":
    ~ return "Wasser"
- "feuer":
    ~ return "Feuer"
- "wind":
    ~ return "Wind"
}
~ return "?"

// --- Element festlegen: Stufe 1, Kraftfunken voll ---
=== function element_waehlen(el)
~ element = el
{ elementstufe < 1:
    ~ elementstufe = 1
}
~ rasten()

// --- Element im Dativ mit Artikel: „der Erde“, „dem Wasser“, „dem Feuer“, „dem Wind“ ---
=== function element_dativ(el)
{ el == "erde":
    ~ return "der Erde"
}
~ return "dem {element_wort(el)}"

// --- Element mit Artikel: „die Erde“, „das Wasser“, „das Feuer“, „der Wind“ ---
=== function element_artikel(el)
{ el:
- "erde":
    ~ return "die Erde"
- "wasser":
    ~ return "das Wasser"
- "feuer":
    ~ return "das Feuer"
- "wind":
    ~ return "der Wind"
}
~ return "?"

// --- Mentor (je nach Element) ---
=== function mentorname()
{ element:
- "erde":
    ~ return "Borrik"
- "wasser":
    ~ return "Nerelle"
- "feuer":
    ~ return "Yrsa"
- "wind":
    ~ return "Vael"
}
~ return "Borrik"

=== function mentorname_ist_m()
~ return element == "erde" || element == "wind"

