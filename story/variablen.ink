// =====================================================================
// Variablen – alles, was sich das Spiel merkt.
// Alle Variablen in Ink sind global. Sie stehen hier gesammelt,
// damit man jederzeit sieht, was das Weltgedächtnis enthält.
// =====================================================================

// --- Spielfigur ---
VAR name = ""            // wird von der App gesetzt (Freitext)
VAR geschlecht = ""      // "m" oder "w"
VAR volk = ""            // "mensch", "zwerg", "gnom", "ork", "troll"
VAR hintergrund = ""     // "reisender", "schausteller", "strassenkind",
                         // "botenlaeufer", "kartografenlehrling", "schiffsjunge"
VAR level = 1

// --- Werte (Start 0, Höchstwert 3) ---
VAR kraft = 0
VAR geschick = 0
VAR verstand = 0
VAR ausstrahlung = 0

// --- Magie ---
VAR element = ""         // leer bis zum Erwachen in Perle 2
VAR elementstufe = 0     // 1 Funke, 2 Strom, 3 Sturm
VAR kraftfunken = 0
VAR quelle = false       // trägt eine Quelle bei sich (Wasserschlauch, Glut, Erde)

// --- Unsichtbare Element-Neigung ---
VAR neigung_erde = 0
VAR neigung_wasser = 0
VAR neigung_feuer = 0
VAR neigung_wind = 0

// --- Start ---
VAR ausloeser = ""       // Grund für den Aufbruch, aus den Start-Fragen

// --- Gilde ---
VAR gilde = ""           // Beitritt etwa in Perle 3

// --- Weltgedächtnis: Ruf (-3 bis +3) ---
VAR ruf_goldene_waage = 0
VAR ruf_silbermark = 0
VAR ruf_phiole = 0
VAR ruf_leise_hand = 0
VAR ruf_weite_feder = 0
VAR ruf_webstuhl_amboss = 0
VAR ruf_kobolde = 0
VAR ruf_gnolle = 0
VAR ruf_stadtwache = 0

// --- Weltgedächtnis: Beziehungen (-3 bis +3) ---
VAR beziehung_freund = 0     // Freund bzw. Freundin
VAR beziehung_tickwort = 0   // der Gnomen-Automat
VAR beziehung_mentor = 0

// --- Besitz ---
VAR silber = 0           // Silberlinge
VAR erzmarke = false     // Geschenk von Grisk – öffnet Türen in den Kobold-Minen
VAR kompass = false      // Geschenk von Tickwort – zeigt „nach Hause“

// --- Anzeige der letzten Würfelprobe ---
VAR letzter_augen = 0    // Augen der zwei Würfel
VAR letzter_gesamt = 0   // Augen + Wert

// --- Start-Fragen (Perle 1): Punkte für die Auslöser ---
VAR pkt_verschwunden = 0
VAR pkt_brief = 0
VAR pkt_schulden = 0
VAR pkt_flucht = 0

// --- Weltgedächtnis: Taten ---
// Namensschema: sprechend und in der Vergangenheit, z. B. kobold_gerettet.

// Perle 1 – Die Nacht
VAR bp_nachgefragt = false        // Bezugsperson nach dem Ziel gefragt
VAR fremder_getroffen = false     // die geheimnisvolle Figur getroffen
VAR brief_erhalten = false        // Brief mit dem Ringsiegel angenommen
VAR fremder_ausgefragt = false
VAR schulden_versprochen = false  // dem Eintreiber Fesk Zahlung versprochen
VAR fesk_getaeuscht = false
VAR vor_fesk_geflohen = false
VAR kisten_gesehen = false        // die Glaskugeln der Goldenen Waage gesehen
VAR gesehen_worden = false        // von Söldnern der Waage bemerkt

// Perle 1 – Die Hafenstadt
VAR auftraege = 0
VAR kobold_gerettet = false       // Grisk am Hafen geholfen
VAR kobold_ignoriert = false
VAR kuestenmauer_gesehen = false  // neue Mauern der Waage an der Küste entdeckt
VAR skizze = 0                    // Qualität der Klippen-Skizze: 1 schlecht, 2 brauchbar, 3 gut
VAR leuchtturm_geklopft = false
VAR paeckchen_geliefert = false
VAR paeckchen_geoeffnet = false
VAR schmugglerpfad_gesehen = false
VAR paeckchen_zur_wache = false
VAR grumak_gewarnt = false        // von den leeren Dörfern hinter den Bergen gehört
VAR freund_getroffen = false
VAR freund_will_mit = false       // nur bei „Klar. Zu zweit …“ (Perle 1); Folge in Perle 2, p2_morgen
VAR obstkarren_gestoppt = false
VAR schmiedin_gesehen = false     // die alte Frau mit den rußigen Händen
VAR tickwort_bei_goblins = false

// Perle 2 – Am Fluss der Räder
VAR spuren = 0                    // erledigte Erkundungen am Fluss
VAR bp_spur = false               // Hinweis, wohin die Bezugsperson gegangen ist
VAR grisk_wiedergesehen = false
VAR tiefe_stiege_bekannt = false  // alter Stollen unter dem Kharvan-Kamm
VAR berg_brummt = false           // Hinweis auf die Bedrohung: der Berg brummt
VAR fesk_wiedergesehen = false
VAR gilde_bietet_minen = false    // Webstuhl und Amboss: Mitglieder kommen in die Minen
VAR yrsa_getroffen = false        // Feuer-Mentorin
VAR spirale_erkannt = false       // ein Magier hat das Ringsiegel erkannt (Name aus der Zeit der Spirale, 14.10.2026 durch vier Ringe ersetzt)
VAR element_erkannt = ""          // Element, das beim Erwachen geantwortet hat
VAR element_gewechselt = false    // Spieler hat bewusst ein anderes Element gewählt
VAR freund_gerettet = false
VAR magie_oeffentlich = false     // Leute haben die Magie gesehen
VAR kugeln_verstanden = false     // weiß: die Glaskugeln der Waage fangen Magie ein
VAR seeweg_bekannt = false        // Hinweis auf heimliche Überfahrt
VAR vardholm_hinweis = false      // Hinweis auf die Festung und ihre Lieferungen
VAR ziegenstiege_bewacht = false
VAR lehrling_schweigt = false     // Ole, der Schmiedelehrling, verrät der Waage nicht, wer am Färberturm gezaubert hat
VAR freund_kennt_magie = false
VAR freund_vertraut = false       // dem Freund / der Freundin die ganze Wahrheit erzählt
VAR fink_hat_gestohlen = false

// Perle 3 – Die Gildenprobe
VAR p3_besuch = ""                // Besuch vor dem Gildentag: "tickwort", "grumak", "mentor"
VAR gildentag_regeln = false      // weiß von Tickwort, wie der Gildentag abläuft
VAR mentor_tipp = false           // zusätzliche Übung beim Mentor (+1 auf eine Zauberprobe)
VAR pell_versprecher = false      // Magister Pell verspricht sich beim Familiennamen
VAR pruefungen = 0                // abgelegte Gildenprüfungen (zwei pro Gildentag)
VAR angebot_webstuhl = false      // Webstuhl und Amboss bietet die Mitgliedschaft an
VAR angebot_feder = false         // Gesellschaft der Weiten Feder
VAR angebot_phiole = false        // Zirkel der Glühenden Phiole
VAR angebot_hand = false          // Die Leise Hand
VAR sabotage_entdeckt = false     // Das Silbermark-Kontor hat das Wasserrad sabotiert
VAR spirale_im_gewoelbe = false   // altes Mosaik mit den vier Ringen gefunden
VAR register_geheimnis = false    // weiß: registrierte Magier müssen Kraft für die Kugeln abgeben
VAR goldknopf_gefunden = false    // Goldknopf von Liora/Cassians Jacke im Zelt der Waage
VAR freund_hat_gedeckt = false    // Liora/Cassian hat die Spielfigur vor der Waage gedeckt
VAR freund_auf_tribuene = false   // Liora/Cassian auf der Tribüne der Waage gesehen
VAR freund_ausrede = false        // Liora/Cassian hat eine Ausrede über die Familie erzählt
VAR tickwort_wiedergesehen = false
VAR gnolle_gesichtet = false      // Gnolle innerhalb des Kamms gesehen – wie sind sie hereingekommen?
VAR fesk_aufschub = false         // Fesk gibt Aufschub, weil die Figur in einer Gilde ist
VAR bp_nachricht = false          // Nachricht über die verschwundene Bezugsperson
VAR magie_gildentag = false       // vor vielen Leuten gezaubert
VAR magie_registriert = ""        // "gilde", "waage" oder "" (nicht eingeschrieben)
VAR von_waage_notiert = false     // die Waage hat den Namen der Spielfigur notiert
VAR spirale_an_tuer = false       // jemand hat die vier Ringe mit Kreide an die Tür gemalt
VAR erster_auftrag = ""           // erster Gildenauftrag (führt zu Perle 4)

// Perle 4 – Die Weiden
VAR ruf_hirten = 0                // Ruf bei den Hirten von Wollmark und Ginsterhof (-3 bis +3)
VAR freund_heimgeholt = false     // Hauptmann Strell lässt Liora/Cassian zurückbringen („Befehl von ganz oben“)
VAR strell_getroffen = false      // Hauptmann Strell, Patrouille der Waage in Wollmark
VAR waagen_wagen = false          // mit dem Wagen der Waage nach Wollmark gefahren
VAR kugeln_auf_wagen = false      // auf dem Wagen leere Glaskugeln für Vardholm gesehen
VAR schafe_gefunden = false       // die verschwundenen Schafe am Rand des Grauen gefunden
VAR jorrit_getroffen = false      // Jorrit, alter Ziegenhirte bei Ginsterhof
VAR wolfspfad_bekannt = false     // Pfad neben der Ziegenstiege, an den Fackeln der Waage vorbei
VAR schweigen_gesehen = false     // das Graue (das Schweigen) mit eigenen Augen gesehen
VAR fremder_p4 = false            // dem Fremden auf den Weiden begegnet
VAR gnolle_geholfen = false       // den Gnollen geholfen
VAR gnolle_verraten = false       // die Gnolle an Strell verraten
VAR gnolle_vermittelt = false     // zwischen Hirten und Gnollen vermittelt
VAR wuk_gerettet = false          // das Gnollenjunge Wuk aus dem Grauen geholt
VAR schweigen_zurueck = false     // das Graue in der Nacht zurückgedrängt
VAR auftrag_p4 = 0                // Ergebnis des Gildenauftrags: 0 nicht erfüllt, 1 halb, 2 erfüllt
VAR freund_mutter_angst = false   // Liora/Cassian: „Meine Mutter hat Angst. Wenn es über die Berge kommt, brauchen wir jede Kugel.“
VAR strell_belohnung = false      // Strell hat Belohnung für das Gnollenlager versprochen
VAR strell_schuldet = false        // die Spielfigur hat Strell in der Nacht aus dem Grauen geholt
VAR gnollstein = false            // Geschenk von Ashka: Stein aus dem Land der Gnolle – zeigt jedem Gnoll: Freund

// Perle 5 – Unter dem Berg
VAR mutter_nach_vardholm = false  // Brief von Liora/Cassian: die Mutter reist in vier Tagen nach Vardholm
VAR minen_zugang = ""             // wie die Figur in die Minen kam: "gilde", "grisk", "mirk", "geschlichen", "strell"
VAR grisk_begleitet = false       // Grisk geht mit in die Tiefe
VAR neumond_funke = false         // in der Neumondnacht hat die Waage einen Funken genommen (eingeschrieben)
VAR vermisste_gerettet = false    // die verschwundenen Kobolde aus der Tiefe geholt
VAR bp_gefunden = false           // die verschwundene Bezugsperson in der Tiefen Stiege gefunden
VAR herz_gesehen = false          // das Herz des Berges gesehen
VAR waage_stollen_gesehen = false // den frischen Stollen mit dem Zeichen der Waage gesehen
VAR stollen_versiegelt = false    // den Stollen zum Herz versiegelt – vorerst kein Grau mehr in Meridel
VAR herzsplitter = false          // Splitter vom Herz als Beweis mitgenommen
VAR tiefe_stiege_weg = false      // weiß: Die Tiefe Stiege führt bis auf die andere Seite (Licht am Ende gesehen)
VAR singlampe = false            // Geschenk von Mirk: Grubenlampe mit Stimmerz, brennt eine Weile auch im Grauen
VAR runen_gelernt = false        // mit Mirk die alten Zwergenzeichen der Tiefen Stiege gelernt
VAR pip_himmel = false            // dem Koboldkind Pip vom Himmel oder vom Meer erzählt
VAR talin_getroffen = false      // Talin, junger Erd-Rufer, bei der Waage eingeschrieben, gräbt für sie
VAR talin_hilft = false          // Talin hat aufgehört zu graben und geht mit hinab

// Perle 6 – Die Festung am Pass
VAR jaro_gesprochen = false      // mit Jaro, dem jungen Söldner, am Straßenlager vor Vardholm geredet
VAR brina_freundin = false       // mit Brina, der alten Wasser-Ruferin, im Hof von Vardholm gesprochen
VAR brina_wahl = ""             // was man Brina am Abend im Hof gegeben hat: "brot", "spiegel" (nach dem Spiegel gefragt), "schweigen"
VAR jaro_kugeln = false          // Jaro erzählt, was in den Glaskugeln steckt (nicht nur über Vardholm gefragt)
VAR vardholm_zugang = ""          // "gerufen", "yrsa", "strell", "talin", "mauer"
VAR yrsa_in_vardholm = false      // Yrsa fährt ihren Lieferkarren selbst nach Vardholm
VAR kugelhalle_gesehen = false    // die Halle mit den tausenden Kugeln gesehen
VAR werk_gesehen = false          // den Spiegel auf dem Turm gesehen („das Werk“, der gläserne Wall)
VAR wahrheit_freund = false       // weiß jetzt: Liora/Cassian ist das Kind der Waagmeisterin
VAR p6_weg = ""                   // "enthuellt", "freund", "funken"
VAR freund_steht_zu_dir = false   // Liora/Cassian stellt sich gegen die Mutter und zur Spielfigur
VAR seraphine_einsicht = false    // Seraphine sieht ihren Fehler ein und öffnet den Wall für alle
VAR waage_gestuerzt = false       // Seraphine vor dem Rat bloßgestellt, die Waage verliert ihre Macht
VAR funken_frei = false           // die gesammelten Funken sind zu ihren Rufern zurückgekehrt
VAR gesucht = false               // die Waage sucht die Spielfigur
VAR spalt_offen = false           // der Nyrrspalt ist für die Spielfigur offen (offizieller Weg im Finale)
VAR freund_kommt_mit = false      // Liora/Cassian will mit hinaus über die Berge
VAR gefangen_p6 = false           // in Vardholm eingesperrt (Kammer oder Keller), in der Nacht befreit
VAR freund_eingesperrt = false    // Liora/Cassian wurde von der Mutter eingesperrt (Weg „freund“ misslungen)
VAR seraphine_gerettet = false    // Spielfigur hat Seraphine auf dem Turm aus dem Grau gezogen
VAR strell_gerettet = false       // Spielfigur hat Strell am Osttor aus dem Grau gezogen
VAR p6_frueh_gerufen = false      // in der Nacht sofort gerufen statt jemanden zu retten
VAR ruf_vardholm = 0              // großer Ruf: 2 Schweigen weit zurück, 1 zurück + Ohnmacht, 0 nur bis zum Pass + Ohnmacht

// Perle 7 – Der Weg hinaus
VAR p7_route = ""                 // "spalt", "gipfel", "tiefe", "meer"
VAR p7_besuche = 0                // Abschiedsbesuche am letzten Abend in Lysmara
VAR bruecke_kontrolle = ""        // Kontrolle der Waage an der Orinbrücke (nur wenn gesucht): "unbemerkt", "nachgesehen" (ein Söldner hat der Figur nachgesehen), "versteckt" (bis spät unter der Brücke – nur Zeit für einen Abschied)
VAR fesk_auftrag = false          // Fesks Päckchen für das Silbermark-Kontor jenseits der Berge angenommen
VAR herz_beruhigt = false         // den Herzsplitter zurück an das Herz gegeben
VAR brief_uebergeben = false      // den Brief mit dem Ringsiegel jenseits der Berge übergeben
VAR ithren_name = false           // der Fremde hat seinen Namen gesagt
VAR tickwort_pfeife = false       // Tickworts Pfeife, „so laut wie zehn Ziegen“ – hilft gegen das Schweigen
VAR grumak_ring = false           // Grumaks eiserner Ring für seinen Bruder Durgash in Dornfurt
VAR ziege_folgt = false           // die geweckte Ziege aus dem leeren Dorf läuft mit (Perle 7)
VAR gnomfamilie_geholfen = false  // der Gnomenfamilie mit dem Dampfkarren geholfen (Perle 7)
VAR seil = false                  // Seil der Bezugsperson (Perle 7) – für die Taschen-Seite des Tagebuchs
VAR p7_erschoepft = false         // unterwegs gestürzt oder ohnmächtig, kommt erschöpft an
VAR seil_gehalten = false         // das Seil der Bezugsperson hat die Spielfigur gehalten (Grat, Schlund oder Kap)
VAR grenzstein_wahl = ""          // am Grenzstein: "gruss" (Auf Wiedersehen gesagt), "zeichnung", "kiesel" (Kiesel aus Meridel mitgenommen)
VAR lager_antwort = ""            // Antwort im Nachtlager auf „Hast du manchmal Angst?“: "angst", "mut", "holz" (Holz nachgelegt, geschwiegen)
VAR ithren_getragen = false       // Ithren hat die Spielfigur im Nyrrspalt aus dem Grauen getragen
VAR ithren_weg = ""              // Wahl am Ende des ersten Abenteuers: "mit" (mit Ithren nach Osten) oder "heim" – bestimmt den Anfang von Abenteuer 2 (Pasco, 19.10.2026)

