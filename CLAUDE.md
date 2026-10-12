# CLAUDE.md

Kontext für die Zusammenarbeit an diesem Projekt.

## Projekt

Storygetriebenes Pen-&-Paper-Spiel für Kinder ab 10, gespielt durch Lesen und Antworten auf Handy oder Tablet.
Erster Spieler und Beta-Tester ist Pascos Sohn. Die Geschichte entsteht gemeinsam (Pasco + Claude).

## Leitplanken für Inhalte

- **Zielgruppe 10+:** Sprache klar und lebendig, nicht kindlich-verniedlicht.
- **Ton:** darf ernst und an manchen Stellen finster sein.
- **Kein endgültiger Tod** der Spielfigur. Niederlagen führen zu Gefangenschaft, Flucht, Verlust oder Ohnmacht – die Geschichte geht weiter.
- **Keine grafische Gewalt**, keine Inhalte, die für Kinder ungeeignet sind.
- **Entscheidungen müssen Folgen haben** – positiv wie negativ. Das Weltgedächtnis ist ein Kernelement.

## Wo wir stehen

Aktueller Stand, nächste Schritte und offene Fragen: `docs/stand.md`. Zu Beginn jeder Sitzung lesen und am Ende aktualisieren.

## Feste Entscheidungen

Siehe `docs/entscheidungen.md`. Diese Punkte nicht stillschweigend ändern; Änderungen dort mit Datum dokumentieren.

## Arbeitsweise

- Sprache im Repo: **Deutsch**.
- Neue Ideen landen zuerst in `docs/ideen.md`, erst nach Zustimmung in `docs/entscheidungen.md`.
- Vorschläge von Claude klar als Vorschlag kennzeichnen, nicht als Entscheidung.
- World-Building wird separat besprochen und in `docs/worldbuilding/` abgelegt.
- Story-Kapitel liegen in `story/` und werden in **Ink** geschrieben (siehe `story/format.md`).
- Neue Variablen fürs Weltgedächtnis immer in `story/variablen.ink` eintragen.
- Würfel und Magie nur über die Funktionen in `story/funktionen.ink` (`probe`, `zauber`, `kann_zaubern`, `rasten`).
- Nach jeder Änderung an Story-Dateien `npm test` ausführen; nur fehlerfrei committen.
- Kurze, aussagekräftige Commit-Nachrichten auf Deutsch.

## Git-Abgleich (automatisch)

- **Zu Beginn:** Ein SessionStart-Hook (`.claude/settings.json`) führt beim Start jeder Claude-Code-Sitzung `git pull --rebase --autostash` aus. Zur Sicherheit vor dem ersten Ändern trotzdem kurz `git status` prüfen.
- **Nach jedem abgeschlossenen Arbeitsschritt:** selbstständig committen und pushen, ohne nachzufragen: `git pull --rebase --autostash`, dann `git push`. Vorher `npm test`, falls Story-Dateien geändert wurden.
- **Nie committen:** `Krita/`, `node_modules/`, `.env`, große Rohdateien. Bilder nur, wenn sie bewusst ausgewählt wurden.
- **Bei einem Konflikt:** nichts überschreiben, sondern Pasco fragen.
