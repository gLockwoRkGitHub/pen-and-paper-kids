// =====================================================================
// Tagebuch: Taschen und Menschen
// Der Player ruft diese Funktionen auf (inkjs: story.EvaluateFunction(name, [id], true))
// und zeigt die Textausgabe als Handschrift. Beschluss Pasco 14.10.2026:
// Bereiche Ich, Erlebtes, Karte, Taschen, Menschen. Details: docs/tagebuch.md
// =====================================================================

// ---------------------------------------------------------------------
// TASCHEN
// ---------------------------------------------------------------------

// Alle Gegenstände in der Reihenfolge, in der sie im Buch stehen.
=== function taschen_liste()
~ return "silber,kompass,erzmarke,quelle,brief,gildenzeichen,plakette,gnollstein,herzsplitter,singlampe,goldknopf,seil,pfeife,ring,paeckchen"

// 0 = nicht da, 1 = dabei, 2 = abgegeben (wird durchgestrichen gezeigt)
=== function tasche_status(id)
{ id:
- "silber":
    { silber > 0:
        ~ return 1
    }
- "kompass":
    { kompass:
        ~ return 1
    }
- "erzmarke":
    { erzmarke:
        ~ return 1
    }
- "quelle":
    { quelle && element != "wind":
        ~ return 1
    }
- "brief":
    { brief_uebergeben:
        ~ return 2
    }
    { brief_erhalten:
        ~ return 1
    }
- "gildenzeichen":
    { gilde != "":
        ~ return 1
    }
- "plakette":
    { magie_registriert == "waage":
        { funken_frei && (seraphine_einsicht || waage_gestuerzt):
            ~ return 2
        }
        ~ return 1
    }
- "gnollstein":
    { gnollstein:
        ~ return 1
    }
- "herzsplitter":
    { herz_beruhigt:
        ~ return 2
    }
    { herzsplitter:
        ~ return 1
    }
- "singlampe":
    { singlampe:
        ~ return 1
    }
- "goldknopf":
    { goldknopf_gefunden || freund_heimgeholt:
        ~ return 1
    }
- "seil":
    { seil:
        ~ return 1
    }
- "pfeife":
    { tickwort_pfeife:
        ~ return 1
    }
- "ring":
    { grumak_ring && p7_dornfurt.halber_hauer:
        ~ return 2
    }
    { grumak_ring:
        ~ return 1
    }
- "paeckchen":
    { fesk_auftrag && p7_dornfurt.erledigen:
        ~ return 2
    }
    { fesk_auftrag:
        ~ return 1
    }
}
~ return 0

// Dateiname der Skizze (ohne Endung) für bilder/taschen/<name>.webp
// und docs/art/tagebuch/taschen/<name>.prompt.txt
=== function tasche_bild(id)
{ id:
- "quelle":
    ~ return "quelle-" + element
- "gildenzeichen":
    ~ return "gildenzeichen-" + gilde
}
~ return id

// Name des Gegenstands (Überschrift unter der Skizze)
=== function tasche_name(id)
{ id:
- "silber":
    Silberlinge
- "kompass":
    Tickworts Kompass
- "erzmarke":
    Grisks Erzmarke
- "quelle":
    { element:
    - "erde":
        Ein Beutel Erde
    - "wasser":
        Der Wasserschlauch
    - "feuer":
        Die Glutlaterne
    }
- "brief":
    Der Brief mit dem Ringsiegel
- "gildenzeichen":
    { gilde:
    - "webstuhl_amboss":
        Das Abzeichen von Webstuhl und Amboss
    - "weite_feder":
        Die silberne Feder
    - "phiole":
        Das Fläschchen der Phiole
    - "leise_hand":
        Das Zeichen der Leisen Hand
    }
- "plakette":
    Die Plakette der Waage
- "gnollstein":
    Ashkas Stein
- "herzsplitter":
    Der Splitter vom Herz
- "singlampe":
    Mirks singende Lampe
- "goldknopf":
    Ein Goldknopf
- "seil":
    {bp()}s Seil
- "pfeife":
    Tickworts Pfeife
- "ring":
    Grumaks Ring
- "paeckchen":
    Fesks Päckchen
}

// Ein, zwei Sätze in der Handschrift der Spielfigur
=== function tasche_text(id)
{ id:
- "silber":
    {Silberlinge(silber)}. {silber < 10:Für den Zoll hätte es nie gereicht.|Mehr, als ich je hatte.}
- "kompass":
    Er zeigt nicht nach Norden. Er zeigt nach Hause.
- "erzmarke":
    Von Grisk. Unter dem Berg öffnet sie Türen.
- "quelle":
    { element:
    - "erde":
        Erde aus {mentorname()}s Hof. Wo der Boden still ist, rufe ich damit trotzdem.
    - "wasser":
        Meerwasser von {mentorname()}. Wo kein Wasser ist, habe ich wenigstens das.
    - "feuer":
        Ein Stück Glut von {mentorname()}. Für Orte ohne Feuer.
    }
- "brief":
    { brief_uebergeben:
        Bei der Fährfrau in Dornfurt angekommen. Ich habe nie erfahren, was drinstand.
    - else:
        Vom Fremden im Regen. Für den Ersten, der mir dasselbe Zeichen zeigt. Auf der anderen Seite der Berge.
    }
- "gildenzeichen":
    { gilde:
    - "webstuhl_amboss":
        Webschiffchen und Hammer. Ich gehöre jetzt zu den Leuten vom Fluss.
    - "weite_feder":
        Meister Orwin hat sie mir angesteckt. Wer die Feder trägt, darf zeichnen, wo er will.
    - "phiole":
        Es riecht nach Rauch und ein bisschen nach verbrannten Augenbrauen.
    - "leise_hand":
        Eingenäht ins Futter. Niemand soll es sehen. Wer es sehen muss, findet es.
    }
- "plakette":
    { funken_frei && (seraphine_einsicht || waage_gestuerzt):
        Gilt nicht mehr. Niemand muss sich mehr einschreiben.
    - else:
        Eine Nummer. Mehr bin ich für die Waage nicht.
    }
- "gnollstein":
    Von Ashka. Jeder Gnoll sieht: Freund.
- "herzsplitter":
    { herz_beruhigt:
        Zurück im Herz des Berges. Der Riss ist ein kleines Stück kürzer.
    - else:
        Er summt. Darin kreisen vier winzige Lichter.
    }
- "singlampe":
    Von Mirk. Sie brennt eine Weile auch im Grauen. Und sie singt.
- "goldknopf":
    Von {freund()}s grüner Samtjacke. {freund_kommt_mit:Die Jacke ist trotzdem mitgekommen.|{freund_heimgeholt:Damit ich {fr_ihn()} nicht vergesse.|Damit ich zurückkommen muss.}}
- "seil":
    Ein Seil braucht man immer. {seil_gehalten:Es hat mich gehalten.|Hat {bp()} gesagt.}
- "pfeife":
    So laut wie zehn Ziegen. Tickwort hat es gemessen. Mit Ziegen.
- "ring":
    { p7_dornfurt.halber_hauer:
        Durgash hat ihn erkannt. Das Bett war gut.
    - else:
        Für Durgash, Grumaks Bruder, in Dornfurt.
    }
- "paeckchen":
    { p7_dornfurt.erledigen:
        Darin war ein Kiesel. Schuld erlassen.
    - else:
        Für das Silbermark-Kontor in Dornfurt. Nicht öffnen. Das ist keine Bitte.
    }
}


// ---------------------------------------------------------------------
// MENSCHEN
// Zeigt nur, wen man kennt – nie, wie gut man sich versteht.
// ---------------------------------------------------------------------

=== function menschen_liste()
~ return "bezugsperson,tickwort,freund,fremder,grisk,fesk,fink,grumak,mentor,yrsa,ole,kettrich,mirk,seraphine,pell,strell,jorrit,ashka,wuk,pip,talin,jaro,brina,durgash,faehrfrau,haldor"

=== function mensch_bekannt(id)
{ id:
- "bezugsperson":
    ~ return true
- "tickwort":
    ~ return p1_tickwort > 0
- "freund":
    ~ return freund_getroffen
- "fremder":
    ~ return fremder_getroffen || fremder_p4 || p7_ithren > 0
- "grisk":
    ~ return kobold_gerettet || kobold_ignoriert || grisk_wiedergesehen
- "fesk":
    ~ return p1_nacht.eintreiber > 0 || fesk_wiedergesehen
- "fink":
    ~ return p1_markt > 0 || fink_hat_gestohlen
- "grumak":
    ~ return grumak_gewarnt || p3_besuch == "grumak" || grumak_ring
- "mentor":
    ~ return element != ""
- "yrsa":
    ~ return yrsa_getroffen && element != "feuer"
- "ole":
    ~ return lehrling_schweigt
- "pip":
    ~ return p5_lampenlied > 0
- "jaro":
    ~ return jaro_gesprochen
- "brina":
    ~ return p6_brina > 0
- "kettrich":
    ~ return p2_tuchhalle > 0 || p3_gesetz > 0
- "mirk":
    ~ return p2_erzlaende.mirk > 0 || p5_grubenstadt > 0
- "seraphine":
    ~ return p3_gesetz > 0 || wahrheit_freund
- "pell":
    ~ return freund_getroffen
- "strell":
    ~ return strell_getroffen
- "jorrit":
    ~ return jorrit_getroffen
- "ashka":
    ~ return p4_gnolle > 0
- "wuk":
    ~ return wuk_gerettet
- "talin":
    ~ return talin_getroffen
- "durgash":
    ~ return p7_dornfurt.halber_hauer > 0
- "faehrfrau":
    ~ return brief_uebergeben
- "haldor":
    ~ return p7_meer.mit_haldor > 0
}
~ return false

// Dateiname der Skizze (ohne Endung) für bilder/menschen/<name>.webp
// und docs/art/tagebuch/menschen/<name>.prompt.txt
=== function mensch_bild(id)
{ id:
- "bezugsperson":
    { hintergrund:
    - "reisender":
        ~ return "maren"
    - "schausteller":
        ~ return "bonifaz"
    - "strassenkind":
        ~ return "mutter-kessel"
    - "botenlaeufer":
        ~ return "holm"
    - "kartografenlehrling":
        ~ return "ysolde"
    - "schiffsjunge":
        ~ return "rhea"
    }
- "freund":
    ~ return freund_kurz()
- "mentor":
    { element:
    - "erde":
        ~ return "borrik"
    - "wasser":
        ~ return "nerelle"
    - "feuer":
        ~ return "yrsa"
    - "wind":
        ~ return "vael"
    }
}
~ return id

// Name, wie die Spielfigur ihn ins Buch schreibt
=== function mensch_name(id)
{ id:
- "bezugsperson":
    {bp()}
- "tickwort":
    Tickwort
- "freund":
    { wahrheit_freund:
        {freund()} Arvelle
    - else:
        {freund()}
    }
- "fremder":
    { ithren_name:
        Ithren
    - else:
        Der Fremde
    }
- "grisk":
    Grisk
- "fesk":
    Fesk
- "fink":
    Fink
- "grumak":
    Grumak
- "mentor":
    {mentorname()}
- "yrsa":
    Yrsa
- "ole":
    Ole
- "pip":
    Pip
- "jaro":
    Jaro
- "brina":
    Brina
- "kettrich":
    Meister Kettrich
- "mirk":
    Mirk
- "seraphine":
    Seraphine Arvelle
- "pell":
    Magister Pell
- "strell":
    Hauptmann Strell
- "jorrit":
    Jorrit
- "ashka":
    Ashka
- "wuk":
    Wuk
- "talin":
    Talin
- "durgash":
    Durgash
- "faehrfrau":
    Die Fährfrau
- "haldor":
    Haldor
}

// Ein, zwei Sätze. Der Text ändert sich mit der Geschichte.
=== function mensch_text(id)
{ id:
- "bezugsperson":
    { ausloeser == "verschwunden" && not bp_gefunden:
        Ist zum Nyrrspalt gegangen und nicht zurückgekommen. Ich finde {bp_ihn()}.
    - else:
        { bp_gefunden:
            Ich habe {bp_ihn()} unter dem Berg gefunden. {Bp_er()} wartet zu Hause auf mich.
        - else:
            Bei {bp_ihm()} bin ich zu Hause.
        }
    }
- "tickwort":
    Erklärautomat. Hilfsbereit. Redet manchmal zu viel. (Das hat er selbst so eingetragen.) Hat mir dieses Buch geschenkt. {tickwort_bei_goblins:Wohnt jetzt bei den Goblins, die ihm zuhören.}
- "freund":
    { wahrheit_freund:
        Fällt gern von Bäumen. Ist das Kind der Waagmeisterin. {freund_kommt_mit:Ist mit mir über die Berge gegangen.|Mein bester Freund trotzdem.}
    - else:
        Fällt gern von Bäumen. Wohnt in der Oberstadt. Erzählt nicht alles.
    }
- "fremder":
    { ithren_name:
        Hat mir am Fluss seinen Namen gesagt. Lügt nie. {ithren_weg == "mit":Ich gehe mit ihm nach Osten.|}{ithren_weg == "heim":Er geht allein nach Osten. Wenn das Herz ruft, findet er mich.|}{ithren_weg == "":Geht nach Osten.|}
    - else:
        Grauer Mantel, Augen wie Mondlicht. Taucht auf, wenn sich etwas entscheidet.
    }
- "grisk":
    { kobold_ignoriert && not kobold_gerettet:
        Kobold. Ich habe ihm nicht geholfen. Er vergisst nicht.
    - else:
        Kobold. Ich habe ihn aus dem Hafen gefischt. Grisk vergisst nicht.
    }
- "fesk":
    { fesk_auftrag && p7_dornfurt.erledigen:
        Eintreiber des Silbermark-Kontors. Hat am Ende doch Humor.
    - else:
        Eintreiber des Silbermark-Kontors. Kann Münzen riechen.
    }
- "fink":
    Junge mit tief gezogener Mütze. Gehört zur Leisen Hand. Stellt keine Fragen.
- "grumak":
    Ork, Gewürzhändler am Marktbrunnen. Hat als Erster von den leeren Dörfern erzählt. {grumak_ring:Sein Bruder heißt Durgash.}
- "mentor":
    { element:
    - "erde":
        Blinder Zwerg, hört die Steine. Hat mir beigebracht: bitten, nicht befehlen.
    - "wasser":
        Kapitänin, die ihr Schiff nie verlässt. Wasser folgt, sagt sie.
    - "feuer":
        Schmiedin am Fluss. Das wichtigste Wort beim Feuer ist: genug.
    - "wind":
        Wohnt im schiefen Leuchtturm und sagt fast nichts. Den Wind kann man nur einladen.
    }
- "yrsa":
    Alte Schmiedin am Fluss. Hat mich nach dem Feuer am Färberturm versteckt. {yrsa_in_vardholm:Ist mit mir nach Vardholm gefahren.}
- "ole":
    Schmiedelehrling am Fluss. Sein Kohlenkarren hat den Färberturm angezündet. Er hat mich nie gesehen. Sagt er.
- "pip":
    Koboldkind in Glimmhalde, Helm viel zu groß. {vermisste_gerettet:Hat seinen Onkel wieder.|Wartet auf seinen Onkel.} {pip_himmel:Will eines Tages den Himmel sehen.}
- "jaro":
    Junger Söldner aus dem Hafenviertel. Brustplatte eine Nummer zu groß. {p6_morgen > 0:Will jetzt Fischer werden.}
- "brina":
    Alte Wasser-Ruferin aus einem Dorf bei Wollmark. Hat Regen gerochen, zwei Tage bevor er kam. {funken_frei:Ihre Funken sind wieder da.}
- "kettrich":
    Gnom mit drei Brillengläsern. Hallenmeister von Webstuhl und Amboss. Hat für alles eine Regel.
- "mirk":
    Alte Koboldin mit gesprungener Brille. {p5_grubenstadt > 0:Älteste von Glimmhalde.|Brüllt gern Befehle.}
- "seraphine":
    {
    - seraphine_einsicht:
        Die Waagmeisterin. {freund()}s Mutter. Hat Mauern gebaut, weil sie Angst hatte. Jetzt nicht mehr.
    - wahrheit_freund:
        Die Waagmeisterin. {freund()}s Mutter. Sanfte Stimme, kalte Augen.
    - else:
        Die Frau in Schwarz auf der Tribüne. Die Waagmeisterin. Ihr gehört die halbe Oberstadt.
    }
- "pell":
    {freund()}s Hauslehrer. Dünn, Brille, sieht nie etwas. Wollte doch nur Rechenstunde geben.
- "strell":
    {
    - strell_gerettet || strell_schuldet:
        Hauptmann der Waage. Kühl, aber nicht gemein. Schuldet mir etwas.
    - strell_getroffen && p6_nacht > 0:
        Hauptmann der Waage. Seit der Nacht in Vardholm sagt er kein Wort mehr.
    - else:
        Hauptmann der Waage. Kühl, pflichtbewusst. Verbeugt sich vor {freund()}.
    }
- "jorrit":
    Alter Ziegenhirte in Ginsterhof. Drei Zähne. Kennt den Wolfspfad.
- "ashka":
    { gnolle_verraten:
        Älteste der Gnolle. Ich habe sie an die Waage verraten.
    - else:
        Älteste der Gnolle. Klug und stolz. Ihr Volk ist vor dem Schweigen geflohen.
    }
- "wuk":
    Gnollenjunges. Ich habe ihn aus dem Grauen geholt. Quietscht, wenn er sich freut.
- "talin":
    Junger Erd-Rufer mit Plakette. Hat für die Waage gegraben. {talin_hilft:Hat aufgehört.}
- "durgash":
    Grumaks Bruder, Wirt im Halben Hauer. Das Essen ist schlecht, das Bett ist gut.
- "faehrfrau":
    Stakt die Fähre in Dornfurt. In ihre Stange sind vier Ringe geschnitzt. Sie hat meinen Brief.
- "haldor":
    Schmuggler mit sehr viel Bart. Fährt nachts ohne Laterne. Das Meer hat mich gemocht, sagt er.
}
