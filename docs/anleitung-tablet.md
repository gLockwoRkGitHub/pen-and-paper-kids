# Anleitung: Das Spiel auf dem iPad spielen

Stand: 19.10.2026 · für Pascos PC (Windows) und das iPad zu Hause

---

## So funktioniert es

- **Der PC stellt das Spiel bereit.** Ein kleines Programm auf dem PC liefert das Spiel aus, ähnlich wie eine Webseite aus dem Internet. Solange es läuft, ist ein schwarzes Fenster offen.
- **Das iPad öffnet das Spiel in Safari**, wie eine normale Webseite, nur mit der Adresse des PCs.
- **Der Spielstand liegt auf dem iPad**, nicht auf dem PC.
- **Der PC muss an sein, solange gespielt wird**, und das schwarze Fenster muss offen bleiben. Es darf hinter anderen Fenstern liegen oder minimiert sein.

---

## Einmalig einrichten (ca. 15 Minuten)

### 1. Prüfen, ob PC und iPad sich erreichen können

Dass der PC am Kabel (LAN) hängt und das iPad im WLAN ist, macht nichts. Beide müssen nur **am selben Router** hängen, also im selben Heimnetz sein.

**Adresse des PCs herausfinden:**
1. Windows-Taste drücken, `cmd` eintippen, Enter.
2. `ipconfig` eintippen, Enter.
3. Beim Abschnitt **Ethernet-Adapter** die Zeile **IPv4-Adresse** suchen, z. B. `192.168.178.23`.

**Adresse des iPads herausfinden:**
Einstellungen → WLAN → beim verbundenen Netz auf **(i)** tippen → **IP-Adresse**, z. B. `192.168.178.41`.

**Vergleichen:** Die ersten drei Zahlenblöcke müssen gleich sein (hier `192.168.178`). Dann passt es.

Wenn sie verschieden sind, ist das iPad wahrscheinlich im **Gast-WLAN**. Verbinde es mit dem normalen WLAN. Ein Gast-WLAN darf den PC absichtlich nicht erreichen.

### 2. Dem PC eine feste Adresse geben (wichtig)

Der Router vergibt die Adressen und kann dem PC irgendwann eine andere geben. Dann findet das iPad das Spiel nicht mehr, und Safari zeigt auch den Spielstand nicht mehr an, weil er an die Adresse gebunden ist.

Bei einer **FRITZ!Box**:
1. Im Browser am PC `http://fritz.box` öffnen und anmelden.
2. **Heimnetz → Netzwerk → Netzwerkverbindungen**.
3. Beim PC auf **Bearbeiten** (Stift) klicken.
4. Den Haken **„Diesem Netzwerkgerät immer die gleiche IPv4-Adresse zuweisen“** setzen und übernehmen.

Bei anderen Routern heißt das meist „feste IP“, „DHCP-Reservierung“ oder „statische Zuweisung“.

### 3. Netzwerk am PC auf „Privat“ stellen

Windows → **Einstellungen → Netzwerk und Internet → Ethernet** → auf die Verbindung klicken → **Netzwerkprofil: Privates Netzwerk**.

Bei „Öffentlich“ blockiert Windows die Verbindung vom iPad.

### 4. Das Spiel zum ersten Mal starten

1. Im Explorer den Projektordner öffnen: `E:\Projekte\pen-and-paper-kids`.
2. **Doppelklick auf `spielen.cmd`.**
3. Es öffnet sich ein schwarzes Fenster. Beim ersten Mal dauert es ein bis zwei Minuten, weil alle Bilder umgewandelt werden. Danach geht es schneller.
4. **Windows fragt nach der Firewall** („Windows-Sicherheitswarnung“ für Node.js):
   - Haken bei **Private Netzwerke** setzen.
   - Den Haken bei Öffentliche Netzwerke weglassen.
   - Auf **Zugriff zulassen** klicken.
5. Im Fenster steht dann zum Beispiel:
   ```
   Der Weg hinaus läuft.

   Auf diesem PC:      http://localhost:8080/
   Auf dem Tablet:     http://192.168.178.23:8080/
   ```
   Die Adresse hinter **„Auf dem Tablet“** brauchst du gleich. Wenn dort mehrere stehen, ist es die, die mit denselben drei Blöcken beginnt wie die Adresse des iPads.
6. **Das Fenster offen lassen.**

### 5. Das Spiel auf dem iPad öffnen

1. **Safari** öffnen. Kein privates Fenster verwenden, sonst wird nichts gespeichert.
2. Oben in die Adresszeile **genau** die Adresse aus dem schwarzen Fenster eintippen, mit `http://` und mit `:8080` am Ende, z. B. `http://192.168.178.23:8080`.
3. Der Einband „Der Weg hinaus“ erscheint.

### 6. Das Spiel auf den Home-Bildschirm legen (empfohlen)

In Safari auf **Teilen** tippen (Viereck mit Pfeil nach oben), dann **„Zum Home-Bildschirm“** und **Hinzufügen**.

- Dein Sohn startet das Spiel dann über ein eigenes Symbol, ohne Adresse und ohne Safari-Leisten.
- Safari löscht die Daten von Webseiten, die man länger als etwa eine Woche nicht besucht hat. Über das Symbol auf dem Home-Bildschirm passiert das nicht, der Spielstand bleibt erhalten.

Wichtig: Danach **immer über dieses Symbol** spielen, nicht über Safari. Das Symbol hat seinen eigenen Spielstand.

---

## Jedes Mal zum Spielen

1. Am PC **Doppelklick auf `spielen.cmd`**. Das holt auch gleich die neueste Version des Spiels.
2. Warten, bis „Der Weg hinaus läuft.“ im Fenster steht.
3. Auf dem iPad das Symbol **„Der Weg hinaus“** antippen.
4. Nach dem Spielen: das schwarze Fenster am PC schließen (oder Strg+C drücken).

Der Spielstand wird nach jeder Entscheidung von selbst gespeichert. Man kann das iPad jederzeit weglegen.

**Der PC darf beim Spielen nicht in den Ruhezustand gehen.** Falls er das tut: Windows → Einstellungen → System → **Netzbetrieb** → Ruhezustand auf „Nie“ oder eine lange Zeit stellen.

---

## Wenn etwas nicht klappt

| Was passiert | Woran es liegt | Was hilft |
|---|---|---|
| Safari: „Die Seite kann nicht geöffnet werden“ | Das schwarze Fenster ist zu, oder der PC schläft | `spielen.cmd` starten, PC wecken |
| Seite lädt ewig und bricht dann ab | Firewall oder Netzwerkprofil „Öffentlich“ | Schritt 3 prüfen. Firewall nachträglich erlauben: Windows-Suche „Firewall“ → **Eine App durch die Windows-Firewall zulassen** → bei **Node.js** den Haken bei **Privat** setzen |
| Ging gestern, heute nicht | Der PC hat eine neue Adresse bekommen | Schritt 2 (feste Adresse) erledigen. Die neue Adresse steht im schwarzen Fenster |
| Im Fenster steht „Port 8080 is already in use“ | Das Spiel läuft schon in einem anderen Fenster | Das andere schwarze Fenster benutzen oder schließen |
| Im Fenster steht „Story lässt sich nicht kompilieren“ | In der Geschichte ist gerade ein Fehler | Im Story-Chat Bescheid geben |
| Spielstand ist weg | Anderes Symbol oder Safari statt Symbol benutzt, oder die Adresse hat sich geändert | Immer dasselbe Symbol benutzen, feste Adresse einrichten (Schritt 2) |
| „Die Geschichte wurde inzwischen verbessert …“ | Die Story wurde geändert | Normal in der Testphase. Die aktuelle Perle beginnt noch einmal von vorn |

Kommst du nicht weiter, schreib in den Technologie-Chat, was im schwarzen Fenster steht. Ein Foto davon reicht.
