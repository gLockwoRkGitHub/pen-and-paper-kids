# Zeichnet das Zeichen des Kreises der Vier: vier ineinander verschlungene Ringe
# (je einer für Erde, Wasser, Feuer, Wind), jedes Nachbarpaar einmal über-, einmal untereinander.
# Bewusst KEINE Reihe (Audi) und keine 3+2-Anordnung (Olympia): Die vier Ringe bilden einen
# geschlossenen Kreis, jeder ist mit seinen beiden Nachbarn verschlungen. Die Mitte bleibt frei –
# würden sich alle vier dort kreuzen, entstünde ein kleines Windrad aus Haken (verboten, siehe
# docs/art/art-style.md, „Verbotene Formen“). Festgelegt 14.10.2026 (Pasco).
#
# Aufruf: python3 tools/siegel-vorlage.py   (PNG braucht Playwright mit Chromium)
# Ergebnis in docs/art/requisiten/:
#   ringsiegel-vorlage.svg/.png – als Wachssiegel (grün), Referenz für das Siegelbild
#   ringzeichen.svg/.png        – nur das Zeichen, schwarz auf weiß (Kreide, Schnitzerei, Schließe, Bodenintarsie)
import itertools, math, os, re

ZIEL = os.path.join(os.path.dirname(__file__), '..', 'docs', 'art', 'requisiten')
GROESSE = 1024
MITTE = GROESSE / 2
D = 162          # Abstand der Ringmitten von der Mitte
R = 0.79 * D     # Ringradius: jeder Ring kreuzt nur seine beiden Nachbarn, die Kreuzungen stehen frei, die Mitte bleibt offen
WINKEL = (90, 0, 270, 180)


def ringe():
    return [(MITTE + D * math.cos(math.radians(a)), MITTE - D * math.sin(math.radians(a))) for a in WINKEL]


def kreuzungen(C):
    X = []
    for i, j in itertools.combinations(range(4), 2):
        (x1, y1), (x2, y2) = C[i], C[j]
        dd = math.hypot(x2 - x1, y2 - y1)
        if dd >= 2 * R:
            continue
        a = dd / 2
        h = math.sqrt(R * R - a * a)
        mx, my = (x1 + x2) / 2, (y1 + y2) / 2
        ux, uy = (x2 - x1) / dd, (y2 - y1) / dd
        for s in (1, -1):
            X.append((i, j, (mx - s * h * uy, my + s * h * ux)))
    return X


def flechten(C, X):
    """Spiegelbildliches Flechtmuster ohne Drehrichtung: An den inneren Kreuzungen (nah an der Mitte)
    liegen der obere und der untere Ring oben, an den äußeren der linke und der rechte.
    So ist jedes Nachbarpaar wirklich verschlungen (einmal oben, einmal unten), und das Zeichen
    ist links-rechts und oben-unten symmetrisch – kein Windrad, keine Drehung."""
    senkrecht = {0, 2}   # Ringe oben (0) und unten (2), siehe WINKEL
    abstand = lambda p: math.hypot(p[0] - MITTE, p[1] - MITTE)
    oben = []
    for i, j, p in X:
        # innen = die nähere der beiden Kreuzungen desselben Ringpaars
        partner = [q for a, b, q in X if {a, b} == {i, j} and q != p]
        innen = not partner or abstand(p) < abstand(partner[0])
        if innen:
            oben.append(i if i in senkrecht else j)
        else:
            oben.append(i if i not in senkrecht else j)
    return oben


def bogen(cx, cy, w1, w2):
    x1, y1 = cx + R * math.cos(w1), cy + R * math.sin(w1)
    x2, y2 = cx + R * math.cos(w2), cy + R * math.sin(w2)
    return f'M {x1:.1f},{y1:.1f} A {R:.1f},{R:.1f} 0 0 1 {x2:.1f},{y2:.1f}'


def zeichen(band, rand, grund, breite=30):
    """Ringe als Bänder mit Lücken: Liegt ein Ring an einer Kreuzung unten, wird er dort unterbrochen.
    (rand und grund bleiben für die Aufrufer gleich, werden aber nicht mehr gebraucht.)"""
    C = ringe()
    X = kreuzungen(C)
    oben = flechten(C, X)
    luecken = {i: [] for i in range(4)}
    for (i, j, p), o in zip(X, oben):
        unten = j if o == i else i
        (ax, ay), (bx, by) = C[i], C[j]
        # Schnittwinkel der beiden Kreise an diesem Punkt
        t1 = (p[0] - ax, p[1] - ay)
        t2 = (p[0] - bx, p[1] - by)
        cosw = abs(t1[0] * t2[0] + t1[1] * t2[1]) / (R * R)
        sinw = math.sqrt(max(1e-6, 1 - cosw * cosw))
        halb = (breite / (2 * sinw) + breite * 0.28) / R
        cx, cy = C[unten]
        w = math.atan2(p[1] - cy, p[0] - cx)
        luecken[unten].append((w - halb, w + halb))
    teile = []
    for ring, (cx, cy) in enumerate(C):
        if not luecken[ring]:
            teile.append(f'<circle cx="{cx:.1f}" cy="{cy:.1f}" r="{R:.1f}" fill="none" stroke="{band}" stroke-width="{breite}"/>')
            continue
        lst = sorted(((a % (2 * math.pi)), (b % (2 * math.pi))) for a, b in luecken[ring])
        # Bögen zwischen den Lücken
        for k, (a1, b1) in enumerate(lst):
            a2, _ = lst[(k + 1) % len(lst)]
            start, ende = b1, a2
            if ende <= start:
                ende += 2 * math.pi
            gross = 1 if ende - start > math.pi else 0
            x1, y1 = cx + R * math.cos(start), cy + R * math.sin(start)
            x2, y2 = cx + R * math.cos(ende), cy + R * math.sin(ende)
            teile.append(f'<path d="M {x1:.1f},{y1:.1f} A {R:.1f},{R:.1f} 0 {gross} 1 {x2:.1f},{y2:.1f}" '
                         f'fill="none" stroke="{band}" stroke-width="{breite}" stroke-linecap="butt"/>')
    return '\n'.join(teile)


def svg(inhalt, hintergrund):
    return (f'<svg xmlns="http://www.w3.org/2000/svg" width="{GROESSE}" height="{GROESSE}" viewBox="0 0 {GROESSE} {GROESSE}">\n'
            f'<rect width="{GROESSE}" height="{GROESSE}" fill="{hintergrund}"/>\n{inhalt}\n</svg>\n')


def siegel():
    gruen, dunkel = '#1F4F33', '#0B2416'
    scheibe = (f'<circle cx="{MITTE}" cy="{MITTE}" r="350" fill="{gruen}"/>'
               f'<circle cx="{MITTE}" cy="{MITTE}" r="322" fill="none" stroke="{dunkel}" stroke-width="5"/>')
    # Rillen im Wachs: dunkles Band mit grünem Rand, Lücken in Wachsgrün
    return svg(scheibe + '\n' + zeichen(band=dunkel, rand=gruen, grund=gruen, breite=20), '#F9F6EE')


def nur_zeichen():
    return svg(zeichen(band='#111111', rand='#FFFFFF', grund='#FFFFFF', breite=22), "#FFFFFF")


if __name__ == '__main__':
    os.makedirs(ZIEL, exist_ok=True)
    for name, inhalt in (('ringsiegel-vorlage', siegel()), ('ringzeichen', nur_zeichen())):
        pfad = os.path.join(ZIEL, name + '.svg')
        open(pfad, 'w').write(inhalt)
        try:
            from playwright.sync_api import sync_playwright
            with sync_playwright() as p:
                b = p.chromium.launch()
                seite = b.new_page(viewport={'width': GROESSE, 'height': GROESSE})
                seite.goto('file://' + os.path.abspath(pfad))
                seite.screenshot(path=os.path.join(ZIEL, name + '.png'))
                b.close()
        except Exception as e:
            print('PNG nicht erzeugt:', e)
        print('geschrieben:', name)
