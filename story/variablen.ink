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

// --- Weltgedächtnis: Taten ---
// Einzelne Ereignisse werden hier ergänzt, sobald sie in einer Perle vorkommen.
// Namensschema: sprechend und in der Vergangenheit, z. B. kobold_gerettet.
