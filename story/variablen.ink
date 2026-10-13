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
VAR brief_erhalten = false        // Brief mit dem Spiralsiegel angenommen
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
VAR freund_will_mit = false
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
VAR spirale_erkannt = false       // ein Magier hat das Spiralsiegel erkannt
VAR element_erkannt = ""          // Element, das beim Erwachen geantwortet hat
VAR element_gewechselt = false    // Spieler hat bewusst ein anderes Element gewählt
VAR freund_gerettet = false
VAR magie_oeffentlich = false     // Leute haben die Magie gesehen
VAR kugeln_verstanden = false     // weiß: die Glaskugeln der Waage fangen Magie ein
VAR seeweg_bekannt = false        // Hinweis auf heimliche Überfahrt
VAR vardholm_hinweis = false      // Hinweis auf die Festung und ihre Lieferungen
VAR ziegenstiege_bewacht = false
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
VAR spirale_im_gewoelbe = false   // altes Relief mit der Spirale aus vier Linien gefunden
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
VAR spirale_an_tuer = false       // jemand hat eine Kreide-Spirale an die Tür gemalt
VAR erster_auftrag = ""           // erster Gildenauftrag (führt zu Perle 4)
