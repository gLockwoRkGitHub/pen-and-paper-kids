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
~ temp wurf = RANDOM(1, 6) + RANDOM(1, 6) + wert
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

// --- Kann gerade gezaubert werden? (für Bedingungen bei Entscheidungen) ---
=== function kann_zaubern(umgebung)
{
- element == "" || kraftfunken <= 0:
    ~ return false
- umgebung < 0 && element != "wind" && not quelle:
    ~ return false
}
~ return true

// --- Rasten: Kraftfunken auffüllen ---
=== function rasten()
{ elementstufe > 0:
    ~ kraftfunken = elementstufe + 1
}

// --- Stärkste Element-Neigung ---
// Bei Gleichstand gewinnt die Reihenfolge Erde, Wasser, Feuer, Wind.
=== function staerkste_neigung()
~ temp beste = neigung_erde
~ temp ergebnis = "erde"
{ neigung_wasser > beste:
    ~ beste = neigung_wasser
    ~ ergebnis = "wasser"
}
{ neigung_feuer > beste:
    ~ beste = neigung_feuer
    ~ ergebnis = "feuer"
}
{ neigung_wind > beste:
    ~ ergebnis = "wind"
}
~ return ergebnis

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
