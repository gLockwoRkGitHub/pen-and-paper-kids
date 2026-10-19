# Anleitung: Das Spiel im Internet bereitstellen (Cloudflare)

Stand: 19.10.2026 · einmalig ca. 30 Minuten · Kosten: 0 €

---

## So funktioniert es

- **GitHub baut das Spiel selbst.** Jede Nacht baut GitHub das Spiel neu, wenn sich etwas geändert hat, und lädt es zu Cloudflare hoch. Auf Knopfdruck geht das auch sofort. Dein PC muss dafür nicht laufen.
- **Cloudflare Pages stellt das Spiel bereit**, unter einer festen Adresse, z. B. `https://der-weg-hinaus.pages.dev`.
- **Cloudflare Access schützt es:**
  - Beim Öffnen fragt Cloudflare nach einer E-Mail-Adresse und schickt einen Code dorthin.
  - Nur Adressen, die du einträgst, kommen hinein. Alle anderen sehen nichts, auch keine Bilder.
- **Am Heimnetz änderst du nichts.**

Du brauchst: deinen GitHub-Zugang zum Repo, eine private E-Mail-Adresse (nicht die der Firma) und etwa 30 Minuten.

> **Reihenfolge ist wichtig:** Erst den Zugangsschutz einrichten (Teil 4), dann freigeben (Teil 5). Vorher veröffentlicht GitHub absichtlich nichts.

Die Menüs bei Cloudflare sind auf Englisch und ändern sich manchmal ein wenig. Wenn ein Name nicht genau passt, such den ähnlichsten.

---

## Teil 1 – Cloudflare-Konto anlegen

1. Im Browser `https://dash.cloudflare.com/sign-up` öffnen.
2. Mit deiner **privaten** E-Mail-Adresse und einem Passwort registrieren.
3. Die Bestätigungs-Mail öffnen und auf den Link klicken.
4. Fragt Cloudflare nach einer Website oder Domain: **überspringen**. Wir brauchen keine eigene Domain.

## Teil 2 – Zwei Angaben aus Cloudflare holen

### a) Die Konto-ID (Account ID)
1. Links im Menü auf **Workers & Pages** klicken.
2. Rechts steht **Account ID**, eine lange Zeichenfolge. Mit dem Kopier-Symbol daneben kopieren.
3. Kurz in einen Texteditor einfügen, du brauchst sie gleich.

### b) Einen Schlüssel für GitHub (API-Token)
1. Oben rechts auf das Personen-Symbol klicken → **Profile** → links **API Tokens**.
2. **Create Token** → ganz unten bei „Custom token“ auf **Get started**.
3. Ausfüllen:
   - **Token name:** `GitHub – Der Weg hinaus`
   - **Permissions:** `Account` · `Cloudflare Pages` · `Edit`
   - **Account Resources:** `Include` · dein Konto
4. **Continue to summary** → **Create Token**.
5. Den angezeigten Schlüssel **kopieren**. Er wird nur dieses eine Mal angezeigt. Ebenfalls kurz in den Texteditor legen.

## Teil 3 – Die beiden Angaben bei GitHub eintragen

1. Das Repo **pen-and-paper-kids** auf github.com öffnen.
2. **Settings** (oben im Repo) → links **Secrets and variables** → **Actions**.
3. Reiter **Secrets** → **New repository secret**:
   - Name: `CLOUDFLARE_API_TOKEN` · Secret: der Schlüssel aus 2b → **Add secret**
4. Noch einmal **New repository secret**:
   - Name: `CLOUDFLARE_ACCOUNT_ID` · Secret: die Konto-ID aus 2a → **Add secret**
5. Den Texteditor ohne Speichern schließen. Die Angaben liegen jetzt sicher bei GitHub, niemand kann sie dort lesen.

**Jetzt einmal anstoßen:** Im Repo oben auf **Actions** → links **Spiel veröffentlichen** → rechts **Run workflow** → grüner Knopf **Run workflow**.

Nach etwa 5 Minuten ist der Lauf grün. Damit ist das Projekt **der-weg-hinaus** bei Cloudflare angelegt, aber noch leer. Es ist noch nichts zu sehen, das ist richtig so.

## Teil 4 – Zugangsschutz einrichten (Cloudflare Access)

### a) Zero Trust einschalten
1. In Cloudflare links auf **Zero Trust** klicken.
2. Beim ersten Mal einen **Team-Namen** wählen, z. B. `familie-vdr`. Er erscheint später auf der Anmeldeseite.
3. Den Tarif **Free** (0 $, bis 50 Personen) wählen. Fragt Cloudflare nach einer Zahlungsart, kannst du sie angeben. Im Free-Tarif wird nichts abgebucht.

### b) Den Schutz für das Spiel anlegen
*(an die Cloudflare-Oberfläche vom Oktober 2026 angepasst)*

1. Zurück ins normale Cloudflare-Menü: **Workers & Pages** → Projekt **der-weg-hinaus** → **Settings**, ganz unten bei **General**.
2. In der Zeile **Preview access** auf **Restrict previews** klicken. Das schützt zunächst nur die Vorschau-Adressen und legt in Zero Trust eine Anwendung an.
3. In **Zero Trust** → **Access** → **Applications** die neue Anwendung für **der-weg-hinaus** öffnen (**Edit** / **Configure**).
4. Bei den Adressen (**Public hostnames** bzw. **Application domain**) steht schon `*.der-weg-hinaus.pages.dev`. Mit **Add public hostname** (oder **+ Add domain**) eine **zweite** Adresse hinzufügen:
   - **Subdomain:** leer lassen
   - **Domain:** `der-weg-hinaus.pages.dev` (eintippen, falls sie nicht in der Liste steht)
5. Den **Application name** z. B. in `Der Weg hinaus` ändern und **Save**.

Damit schützt diese eine Anwendung die echte Adresse **und** die Vorschau-Adressen.

### c) Festlegen, wer hinein darf
In derselben Anwendung:
1. Die Anwendung öffnen (**Edit** / **Configure**) → Bereich **Policies** → die vorhandene Regel öffnen.
2. Bei **Include** den Typ **Emails** wählen und die erlaubten Adressen eintragen, z. B. deine private Adresse und die deiner Frau.
3. Gibt es dort eine Regel „Everyone“ oder ähnlich: **entfernen**.
4. **Session duration** (bei der Anwendung, nicht der Regel) auf **1 month** stellen. Dann muss man sich nur einmal im Monat neu anmelden.
5. Speichern.

Die Codes kommen an die eingetragene Adresse. Dein Sohn braucht keine eigene E-Mail. Beim Anmelden auf dem iPad gibst du deine Adresse ein und tippst den Code ein.

## Teil 5 – Freigeben

1. GitHub → Repo → **Settings** → **Secrets and variables** → **Actions** → Reiter **Variables** → **New repository variable**:
   - Name: `FREIGABE` · Value: `ja` → **Add variable**
2. **Actions** → **Spiel veröffentlichen** → **Run workflow**.
3. Nach etwa 5 Minuten ist das Spiel online.

## Teil 6 – Prüfen, ob der Schutz wirklich greift (wichtig)

1. Am PC ein **privates Browserfenster** öffnen (Chrome/Edge: Strg+Umschalt+N).
2. `https://der-weg-hinaus.pages.dev` öffnen. Die genaue Adresse steht in Cloudflare unter Workers & Pages → der-weg-hinaus.
3. **Richtig:** Es erscheint eine Cloudflare-Anmeldeseite, die nach der E-Mail fragt.
4. **Falsch:** Das Spiel erscheint sofort ohne Anmeldung. Dann:
   - In GitHub die Variable `FREIGABE` löschen.
   - In Cloudflare unter **Workers & Pages → der-weg-hinaus → Deployments** die Veröffentlichung löschen.
   - Mir im Technologie-Chat Bescheid geben.
5. Mit deiner Adresse anmelden, den Code aus der Mail eingeben. Der Einband „Der Weg hinaus“ erscheint.

## Teil 7 – Auf dem iPad einrichten

1. **Safari** öffnen und die Adresse eingeben, z. B. `https://der-weg-hinaus.pages.dev`. Kein privates Fenster verwenden.
2. Mit deiner E-Mail-Adresse und dem Code anmelden.
3. Auf **Teilen** tippen (Viereck mit Pfeil) → **Zum Home-Bildschirm** → **Hinzufügen**.
4. Das neue Symbol **„Der Weg hinaus“** öffnen. Eventuell fragt es noch einmal nach der Anmeldung, das ist normal, weil das Symbol einen eigenen Speicher hat.
5. Ab jetzt **immer über dieses Symbol spielen**. Dort bleibt der Spielstand erhalten, und das Spiel läuft auch ohne Internet weiter, wenn es einmal geladen war.

**Falls die Anmeldung im Symbol nicht klappt** (Code wird angenommen, aber man landet wieder bei der Anmeldung): Das Symbol löschen und stattdessen in Safari ein **Lesezeichen** anlegen. Das funktioniert sicher. Sag mir dann Bescheid, dann suche ich eine bessere Lösung.

---

## Danach

- **Neue Versionen kommen von allein**, jede Nacht. Soll eine Änderung sofort aufs iPad: GitHub → **Actions** → **Spiel veröffentlichen** → **Run workflow**, nach etwa 5 Minuten ist sie online. Unter **Actions** siehst du, ob ein Lauf grün (fertig) oder rot (Fehler) ist.
- **Warum nicht nach jeder Änderung?** Story-Chat und Heim-PC speichern sehr oft. Das würde die kostenlosen GitHub-Minuten aufbrauchen.
- **Spielstand:** Er liegt auf dem iPad. Hat sich die Geschichte geändert, beginnt die aktuelle Perle eventuell von vorn. Das sagt das Spiel dann auch.
- **Jemand Neues soll mitspielen:** in Zero Trust bei der Anwendung „Der Weg hinaus“ die E-Mail-Adresse ergänzen.
- **Alles abschalten:** In GitHub die Variable `FREIGABE` löschen und in Cloudflare das Projekt löschen (**Settings → Delete project**).

## Wenn etwas nicht klappt

| Was passiert | Was hilft |
|---|---|
| Actions-Lauf ist rot bei „Story prüfen“ | In der Geschichte ist ein Fehler. Dem Story-Chat Bescheid geben. Online bleibt die letzte funktionierende Version |
| Actions-Lauf ist rot bei „Cloudflare-Projekt anlegen“ oder „Veröffentlichen“ | Schlüssel oder Konto-ID falsch: Teil 2 und 3 wiederholen (Secret mit **Update** überschreiben) |
| Lauf grün, aber „Noch nicht veröffentlicht – Variable FREIGABE fehlt“ | Teil 5, Schritt 1 |
| Kein Code in der Mail | Spam-Ordner prüfen. Die Adresse muss genau so in der Regel stehen (Teil 4c). Cloudflare sagt bei falscher Adresse nichts |
| Seite zeigt „Access denied“ | Die Adresse fehlt in der Regel (Teil 4c) |

Kommst du nicht weiter, schick mir im Technologie-Chat ein Bildschirmfoto.
