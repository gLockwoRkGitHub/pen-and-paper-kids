# Ideen-Liste

Noch nicht entschiedene Ideen. Was angenommen wird, wandert nach `entscheidungen.md`.

## Vorgemerkt
- **Vorlesefunktion** – damit Texte vorgelesen werden können (z. B. als Abendabenteuer). Könnte mit der ElevenLabs-Vertonung zusammenfallen: eine Erzählerstimme für den Erzähltext.
- **Vertonung – technischer Vorschlag:** Dialogzeilen in Ink mit `# sprecher: tickwort` markieren; ein Skript sammelt alle Zeilen je Figur, erzeugt die Audiodateien über die ElevenLabs-API und legt sie unter einer festen ID ab. Zeilen mit Varianten (Liora/Cassian, Pronomen) brauchen je Variante eine eigene Aufnahme.

## Vorschläge aus den ersten Gesprächen
- **Narben statt Tod:** Niederlagen hinterlassen bleibende Spuren – verlorene Gegenstände, Gefangenschaft, eine Verletzung oder ein Ruf, der einem vorauseilt.
- **„Was bisher geschah“:** kurze Zusammenfassung beim Wiedereinstieg, erzeugt aus dem Weltgedächtnis.
- **Karte mit Nebel des Unbekannten**, der sich beim Erkunden lichtet.
- **Erinnerungs-Markierungen auf der Karte** an Orten wichtiger Entscheidungen; Antippen öffnet die Erinnerung.
- **Reiseereignisse** zwischen Orten, gefärbt vom Weltgedächtnis.
- **Abschied des Begleiters als Story-Moment**; spätere Rückkehr je nachdem, wie man ihn behandelt hat.
- **Völker wirken über Reaktionen der Welt** (z. B. ein Ork wird in der Menschenstadt misstrauisch beäugt).
- **Hintergründe bringen je drei Dinge mit:** passive Fähigkeit, exklusive Antwortoptionen, Startkontakte.
- **Echte Dilemmata** ohne erhobenen Zeigefinger.

## Vorschlag: Die größere Bedrohung – „das Schweigen“ (Claude, 13.10.2026)
**In Perle 4 schon verwendet, Bestätigung durch Pasco offen.**
- Wo es hinkommt, **verstummen die Elemente**: Feuer geht aus, Wind steht still, Wasser fließt, aber rauscht nicht, das Gras wird grau wie Asche.
- Menschen und Tiere, die darin schlafen, **stehen auf und gehen fort**, mit offenen Augen, ins Graue hinein. Keine Gewalt, kein Blut. Das erklärt die leeren Dörfer hinter den Bergen (Türen offen, Essen auf dem Tisch).
- Die Gnolle nennen es **Hrrsh**. Es kam im Frühling über ihr Land jenseits der Berge.
- Es **folgt allem, was eine Stimme hat**, also auch Magie. Laute Rufe (Elemente, Heulen, Singen, Ziegen!) drängen es zurück.
- Ashkas Verdacht: Es kommt **nicht über die Berge, sondern aus ihnen**. Dazu passt das Brummen tief im Berg (Perle 2) und führt zu Perle 5.
- **Die Waage** sammelt Kraft in Glaskugeln, weil Seraphine Arvelle Angst vor dem Schweigen hat („Wenn es über die Berge kommt, brauchen wir jede Kugel“). Das macht sie nicht gut, aber verständlich. **Festgelegt 13.10.2026:** Die Kraft soll einen Schutzwall speisen, der vor allem die Oberstadt schützt (siehe `entscheidungen.md`).
- **Der Kreis der Vier / Ithren** wacht über das Gleichgewicht der Elemente. Das Schweigen ist das Gegenteil: keine Elemente.
- Passt zum Wort **„die Stillen“** (Magier über Unbegabte). Später ist eine Wendung möglich: Ist Stille immer schlecht?
- **In Perle 5 verwendet (Vorschlag):** Das Schweigen sickert aus einem Riss im **Herz des Berges**, einem Kristall, in dem die vier Elemente kreisen. Den Riss hat ein Stollen geschlagen, den Webstuhl und Amboss im Auftrag der Waage nach Stimmerz gegraben hat. Die Waage hat das Schweigen also selbst geweckt, ohne es zu wissen.
- Offen bleibt bewusst: was es ist, wer oder was es geweckt hat, und ob es aufzuhalten ist (Folgeabenteuer).
- **In Perle 7 verwendet (Vorschlag, 13.10.2026):**
  - Es gibt **mehrere Herzen** unter verschiedenen Bergen und Meeren. Eines ist „schon still“. Das ist der Haken für das Folgeabenteuer.
  - Städte jenseits der Berge halten das Schweigen fern, indem sie **nie still sind** (Dornfurt mit Glocken und Trommeln, Kar Duun mit Trommeln und singenden Trollen).
  - Ithren nennt am Ende seinen Namen, verrät aber nichts über den Kreis der Vier.

## Tagebuch – Einführung durch den Erklärroboter (Pasco, Handy-Chat 13.10.2026)
Das Tagebuch steht dem Spieler nicht von Beginn an zur Verfügung. Es wird in der Einstiegsszene durch den Erklärroboter eingeführt: Wenn der Roboter sich dem Spieler anschließt, übergibt beziehungsweise erklärt er das Tagebuch und beschreibt dabei, wozu die einzelnen Bereiche dienen – die Werte wie Kraft, Geschick, Verstand und Ausstrahlung, der Story-Verlauf sowie die festgehaltenen Entscheidungen und Erinnerungen. Diese Erklärung ist zugleich das Onboarding für das Würfel- und Weltensystem. Da der Roboter den Spieler kurz darauf wieder verlässt, bleibt das Tagebuch als sein Vermächtnis das zentrale Werkzeug des Spielers.

**Abgleich mit der Story (Claude, 13.10.2026):** Zum größten Teil schon so umgesetzt. In Perle 1 (`story/perle-1/tickwort.ink`) wird Tickwort aus der Werkstatt geworfen, erklärt Werte und Würfelprobe und zieht dann ein leeres Buch aus seinem Bauch und schenkt es der Spielfigur (`# tutorial: tagebuch`). Am Ende von Perle 1 bleibt er bei den Goblins („Du hast jetzt ein Buch“). Unterschiede:
- Tickwort kommt **vor** der ersten Aufgabe (auf dem Weg zum Markt), nicht danach. So kann er die Würfelprobe erklären, bevor die erste echte Probe kommt.
- Er erklärt das Buch bisher nur kurz („Schreib auf, was du erlebst. Und zeichne, wo du warst.“), **nicht die einzelnen Bereiche**. **Vorschlag:** Tickwort erklärt die Bereiche, passend zum Player (Werte/Charakterbogen, Einträge, Karte), in seinem eigenen Stil mit Unterpunkten.
- **Entschieden 13.10.2026:** Zeitpunkt bleibt wie er ist. Die Erklärung der Bereiche wird umgesetzt, aber erst nach der Ausarbeitung des Tagebuchs (siehe `entscheidungen.md`, `stand.md` Punkt 4b).

## Später / nach der Beta
- **Weitere Hintergründe:** Bettelmönch (Orden ohne Götter), Schankwirtskind, Schmiedelehrling, Bauernkind, Kräutersammler, Tüftlerlehrling, Minenhelfer.
- **Addons / Folgeabenteuer:** Die Figur wird wieder stärker (z. B. höhere Obergrenze) oder verbessert sich in anderen Bereichen.
- **Familienmodus:** ein Gerät reihum, jedes Kind mit eigener Figur.
- **Spielleiter-Modus für Eltern:** App liefert das Skript, gespielt wird am Tisch.
- **KI als Erzähler** für Freitext-Antworten – nur mit Blick auf Inhaltssicherheit, Kosten und Datenschutz.

## Technik
- **Geschichten als Daten**, getrennt von der App (z. B. Ink von inkle oder eigenes JSON-/Markdown-Format).
- **PWA** (installierbare Webseite) als möglicher Start: ein Code für alle Geräte, offline spielbar.
- **Kinderschutz von Anfang an:** keine Werbung, kein Chat mit Fremden, möglichst keine Accounts.
