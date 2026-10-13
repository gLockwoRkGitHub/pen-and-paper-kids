# Erzeugt die Lagevorlagen für Meridel und Lysmara (SVG + PNG).
# Aufruf: python3 tools/karten-vorlage.py   (PNG braucht Playwright mit Chromium)
# Maßstab Meridel: 1 km = 20 px. Die Vorlagen sind schematisch, keine fertigen Karten.
# Zusätzlich entstehen die Grundvorlagen (*-grundvorlage): gleiche Lage, aber nur Küste, Fluss,
# Gebirge und Stadtmauer als schwarze Linien auf Weiß – ohne Orte, Straßen und Schrift.
# Sie dienen als Linienvorlage für die gemalten Grundkarten (siehe docs/art/karten/README.md).
import math, os, random
random.seed(7)
ZIEL = os.path.join(os.path.dirname(__file__), '..', 'docs', 'art', 'karten')
GRUND = False  # True: Grundvorlage ohne Orte, Straßen und Schrift
K = 20

def P(x, y): return (x * K, y * K)

def pfad(punkte, schliessen=False):
    s = 'M ' + ' L '.join(f'{x:.0f},{y:.0f}' for x, y in punkte)
    return s + (' Z' if schliessen else '')

def glatt(punkte):
    # Catmull-Rom -> kubische Bezier
    pts = [punkte[0]] + punkte + [punkte[-1]]
    s = f'M {pts[1][0]:.0f},{pts[1][1]:.0f}'
    for i in range(1, len(pts) - 2):
        p0, p1, p2, p3 = pts[i-1], pts[i], pts[i+1], pts[i+2]
        c1 = (p1[0] + (p2[0]-p0[0])/6, p1[1] + (p2[1]-p0[1])/6)
        c2 = (p2[0] - (p3[0]-p1[0])/6, p2[1] - (p3[1]-p1[1])/6)
        s += f' C {c1[0]:.0f},{c1[1]:.0f} {c2[0]:.0f},{c2[1]:.0f} {p2[0]:.0f},{p2[1]:.0f}'
    return s

def entlang(punkte, abstand):
    out = []
    for (x1, y1), (x2, y2) in zip(punkte, punkte[1:]):
        d = math.hypot(x2-x1, y2-y1); n = max(1, int(d / abstand))
        for i in range(n):
            t = i / n; out.append((x1 + (x2-x1)*t, y1 + (y2-y1)*t))
    return out

def berg(x, y, g):
    h = g * random.uniform(0.85, 1.2); b = g * random.uniform(0.55, 0.75)
    return (f'<path d="M {x-b:.0f},{y:.0f} L {x:.0f},{y-h:.0f} L {x+b:.0f},{y:.0f} Z" fill="#b9b2a6" stroke="#4a4038" stroke-width="2"/>'
            f'<path d="M {x:.0f},{y-h:.0f} L {x+b:.0f},{y:.0f} L {x+b*0.3:.0f},{y:.0f} Z" fill="#8f877b"/>'
            f'<path d="M {x-b*0.28:.0f},{y-h*0.72:.0f} L {x:.0f},{y-h:.0f} L {x+b*0.28:.0f},{y-h*0.72:.0f} L {x:.0f},{y-h*0.62:.0f} Z" fill="#fff"/>')

def text(x, y, t, g=22, fett=False, farbe='#2b241e', anker='start', kursiv=False):
    t = t.replace('&', '&amp;')
    w = 'bold' if fett else 'normal'; st = 'italic' if kursiv else 'normal'
    return (f'<text x="{x:.0f}" y="{y:.0f}" font-family="Georgia, serif" font-size="{g}" font-weight="{w}" '
            f'font-style="{st}" fill="{farbe}" text-anchor="{anker}" paint-order="stroke" stroke="#f4ecd8" stroke-width="5">{t}</text>')

def punkt(x, y, r=7, farbe='#2b241e'):
    return f'<circle cx="{x:.0f}" cy="{y:.0f}" r="{r}" fill="{farbe}" stroke="#f4ecd8" stroke-width="2"/>'

def meridel():
    random.seed(7)  # gleiche Berge in Lage- und Grundvorlage
    W, H = 64 * K, 52 * K
    s = [f'<svg xmlns="http://www.w3.org/2000/svg" width="{W}" height="{H}" viewBox="0 0 {W} {H}">',
         f'<rect width="{W}" height="{H}" fill="{"#ffffff" if GRUND else "#f4ecd8"}"/>']
    # Meer im Westen
    kueste = [P(0,0), P(7,0), P(6,6), P(4.5,12), P(3.2,17), P(3.8,19.5), P(5.5,23), P(4.4,25), P(5.2,27),
              P(4.6,31), P(5.6,36), P(4.4,40), P(6.2,41.5), P(5,44), P(6.5,48), P(7,52), P(0,52)]
    if GRUND:
        s.append(f'<path d="{glatt(kueste[1:-1])}" fill="none" stroke="#000" stroke-width="3"/>')
    else:
        s.append(f'<path d="{glatt(kueste[1:-1])} L 0,{52*K} L 0,0 Z" fill="#bcd3d6" stroke="#4a6a70" stroke-width="3"/>')
    for i in range(10):
        y = 40 + i * 100
        s.append(f'<path d="M 20,{y} q 15,-8 30,0 t 30,0" fill="none" stroke="{"#000" if GRUND else "#6f8f95"}" stroke-width="2"/>')
    # Weiden-Schraffur (in der Grundvorlage nicht gezeichnet, Zufallszahlen trotzdem verbrauchen)
    for _ in range(170):
        x, y = random.uniform(10, 52), random.uniform(12, 42)
        if not GRUND:
            s.append(f'<path d="M {x*K:.0f},{y*K:.0f} l 6,-6 l 6,6" fill="none" stroke="#9fb07a" stroke-width="2"/>')
    # Orin
    orin = [P(50,6.5), P(47,9), P(42,11), P(36,13.5), P(29,16), P(22,18.5), P(15,21), P(10,23.5), P(8.2,25.3), P(7.4,26.6), P(5.1,27.3)]
    s.append(f'<path d="{glatt(orin)}" fill="none" stroke="{"#000" if GRUND else "#4a6a70"}" stroke-width="9" stroke-linecap="round"/>')
    s.append(f'<path d="{glatt(orin)}" fill="none" stroke="{"#fff" if GRUND else "#bcd3d6"}" stroke-width="5" stroke-linecap="round"/>')
    if GRUND:
        # jenseits des Kamms (erst im Finale sichtbar): ein Fluss am Ostrand
        jenseits = [P(62.6,0), P(62,10), P(63,20), P(62.2,30), P(63.2,40), P(62.4,52)]
        s.append(f'<path d="{glatt(jenseits)}" fill="none" stroke="#000" stroke-width="6" stroke-linecap="round"/>')
    # Spaltstraße
    strasse = [P(7.5,25), P(15,25.6), P(23,25.2), P(30,26), P(38,25.4), P(46,25.2), P(54,25)]
    if not GRUND:
        s.append(f'<path d="{glatt(strasse)}" fill="none" stroke="#7a5a3a" stroke-width="4" stroke-dasharray="14 8"/>')
    # Ziegenstiege
    zieg = [P(38,38), P(39.5,39.5), P(38.6,40.6), P(40.3,41.6), P(39.4,42.7), P(41.2,43.6), P(43,45.5)]
    if not GRUND:
        s.append(f'<path d="{pfad(zieg)}" fill="none" stroke="#a03c2c" stroke-width="3" stroke-dasharray="6 6"/>')
    # Kharvan-Kamm als Hufeisen
    kamm = [P(4.2,18.5), P(7,13), P(10,8), P(17,5), P(26,4), P(36,4), P(46,4.5), P(54,6), P(58,10), P(59.5,17),
            P(59.5,22.5)]
    kamm2 = [P(59.5,27.5), P(59.5,34), P(57.5,41), P(52,46), P(43,48), P(32,48.5), P(22,48), P(14,46.5), P(8,44), P(5.6,42.5)]
    for teil in (kamm, kamm2):
        for (x, y) in sorted(entlang(teil, 38), key=lambda p: p[1]):
            b = berg(x + random.uniform(-8, 8), y + random.uniform(-6, 10), random.uniform(34, 50))
            if GRUND:
                b = b.split('/>')[0] + '/>'  # nur der Umriss
                b = b.replace('fill="#b9b2a6"', 'fill="#fff"').replace('stroke="#4a4038"', 'stroke="#000"')
            s.append(b)
    # Nyrrspalt mit Vardholm
    sx, sy = P(59.5, 25)
    s.append(f'<path d="M {sx-40},{sy-30} L {sx+60},{sy-12} M {sx-40},{sy+30} L {sx+60},{sy+12}" stroke="{"#000" if GRUND else "#4a4038"}" stroke-width="3"/>')
    if GRUND:
        s.append('</svg>')
        return '\n'.join(s)
    s.append(f'<rect x="{sx-58}" y="{sy-16}" width="30" height="32" fill="#6b5b4b" stroke="#2b241e" stroke-width="2"/>')
    s.append(f'<path d="M {sx-58},{sy-16} l 0,-8 l 7,0 l 0,8 m 8,0 l 0,-8 l 7,0 l 0,8 m 8,0 l 0,-8 l 7,0 l 0,8" fill="#6b5b4b" stroke="#2b241e" stroke-width="2"/>')
    s.append(f'<path d="M {sx+60},{sy} l 40,0" stroke="#7a5a3a" stroke-width="4" stroke-dasharray="14 8"/>')
    s.append(text(W - 12, sy + 34, 'nach Kar Duun →', 18, kursiv=True, anker='end'))
    # Orte
    lx, ly = P(6.6, 25.3)
    s.append(f'<circle cx="{lx}" cy="{ly}" r="22" fill="#d9a441" stroke="#2b241e" stroke-width="3"/>')
    s.append(text(lx + 30, ly - 22, 'LYSMARA', 30, fett=True))
    ax, ay = P(4.4, 19.3)
    s.append(f'<path d="M {ax-6},{ay+18} L {ax-3},{ay-22} L {ax+5},{ay-22} L {ax+8},{ay+18} Z" fill="#fff" stroke="#2b241e" stroke-width="2" transform="rotate(8 {ax} {ay})"/>')
    s.append(text(ax + 18, ay - 6, 'Klippen von Ahrn', 22, fett=True))
    s.append(text(ax + 18, ay + 18, 'Leuchtturm (Vael), neue Mauer der Waage', 17, kursiv=True))
    for (x, y, t, u) in [(30, 26, 'Wollmark', 'Hirtendorf (Vorschlag)'), (38, 38, 'Ginsterhof', 'Hirtendorf (Vorschlag)')]:
        px, py = P(x, y); s.append(punkt(px, py)); s.append(text(px + 12, py - 10, t, 22, fett=True)); s.append(text(px + 12, py + 14, u, 16, kursiv=True))
    mx, my = P(48.5, 8.6)
    s.append(f'<path d="M {mx-14},{my+10} a 14,14 0 0 1 28,0 Z" fill="#2b241e"/>')
    s.append(text(mx - 20, my + 40, 'Kobold-Minen / Tiefe Stiege', 21, fett=True, anker='end'))
    s.append(text(P(42.8,45.6)[0] - 14, P(42.8,45.6)[1] - 22, 'Ziegenstiege', 21, fett=True, farbe='#a03c2c', anker='end'))
    bx, by = P(5.8, 41.3)
    s.append(punkt(bx, by, 6, '#4a6a70'))
    s.append(text(bx + 14, by + 6, 'Schwarzwasserbucht (Vorschlag)', 19, kursiv=True))
    s.append(text(sx - 70, sy + 60, 'Nyrrspalt', 26, fett=True, anker='end'))
    s.append(text(sx - 70, sy + 86, 'Festung Vardholm', 19, kursiv=True, anker='end'))
    s.append(text(P(16,25.1)[0], P(16,25.1)[1] + 30, 'Spaltstraße', 19, kursiv=True, farbe='#7a5a3a'))
    s.append(text(P(27,16.5)[0], P(27,16.5)[1] - 18, 'Orin', 26, kursiv=True, farbe='#355057'))
    s.append(text(P(24,33)[0], P(24,33)[1], 'W E I D E N', 40, fett=True, farbe='#6c7d48'))
    s.append(text(P(30,1.6)[0], P(30,1.6)[1] + 14, 'K H A R V A N - K A M M', 30, fett=True, anker='middle'))
    s.append(text(60, 1000, 'MEER', 40, fett=True, farbe='#355057'))
    # Kompass und Maßstab
    cx, cy = 1180, 940
    s.append(f'<path d="M {cx},{cy-44} L {cx+12},{cy} L {cx},{cy-8} L {cx-12},{cy} Z" fill="#2b241e"/>')
    s.append(text(cx, cy - 52, 'N', 24, fett=True, anker='middle'))
    s.append(f'<path d="M 860,1010 l 200,0 m -200,-8 l 0,16 m 100,-16 l 0,16 m 100,-16 l 0,16" stroke="#2b241e" stroke-width="3"/>')
    s.append(text(860, 994, '0', 16)); s.append(text(1060, 994, '10 km', 16))
    s.append(text(260, 1030, 'Meridel – Lagevorlage (keine fertige Karte)', 20, fett=True))
    s.append('</svg>')
    return '\n'.join(s)

def lysmara():
    W, H = 1200, 900
    s = [f'<svg xmlns="http://www.w3.org/2000/svg" width="{W}" height="{H}" viewBox="0 0 {W} {H}">',
         f'<rect width="{W}" height="{H}" fill="{"#ffffff" if GRUND else "#f4ecd8"}"/>']
    if GRUND:
        orin = 'M 1200,120 C 1080,200 1020,300 1000,420 C 985,520 960,640 820,700 C 680,760 480,740 300,760'
        s += ['<path d="M 250,0 C 230,150 260,240 300,300 C 330,350 420,360 430,450 C 440,540 340,560 300,610 C 260,680 250,780 280,900" fill="none" stroke="#000" stroke-width="3"/>',
              '<path d="M 300,300 C 330,350 420,360 430,450 C 440,540 340,560 300,610" fill="none" stroke="#000" stroke-width="10"/>',
              f'<path d="{orin}" fill="none" stroke="#000" stroke-width="30" stroke-linecap="round"/>',
              f'<path d="{orin}" fill="none" stroke="#fff" stroke-width="24" stroke-linecap="round"/>',
              '<ellipse cx="760" cy="200" rx="230" ry="140" fill="none" stroke="#000" stroke-width="2" stroke-dasharray="8 6"/>',
              '<path d="M 260,120 C 500,60 900,60 1010,260 C 1060,420 1020,560 900,640 C 760,700 500,700 300,640" fill="none" stroke="#000" stroke-width="6"/>',
              '<path d="M 515,505 C 550,480 580,462 610,450 M 720,260 C 700,300 690,330 680,360 M 740,415 C 820,430 880,445 930,450 M 420,110 C 460,200 560,300 620,365" fill="none" stroke="#000" stroke-width="4"/>',
              '<rect x="610" y="360" width="130" height="110" fill="none" stroke="#000" stroke-width="2"/>',
              '</svg>']
        return '\n'.join(s)
    # Meer und Hafenbucht im Westen
    s.append('<path d="M 0,0 L 250,0 C 230,150 260,240 300,300 C 330,350 420,360 430,450 C 440,540 340,560 300,610 C 260,680 250,780 280,900 L 0,900 Z" fill="#bcd3d6" stroke="#4a6a70" stroke-width="3"/>')
    # Kaimauern
    s.append('<path d="M 300,300 C 330,350 420,360 430,450 C 440,540 340,560 300,610" fill="none" stroke="#5a4a3a" stroke-width="10"/>')
    # Orin: von Nordosten am Ostrand entlang, dann südlich der Stadt zur Mündung
    orin = 'M 1200,120 C 1080,200 1020,300 1000,420 C 985,520 960,640 820,700 C 680,760 480,740 300,760'
    s.append(f'<path d="{orin}" fill="none" stroke="#4a6a70" stroke-width="30" stroke-linecap="round"/>')
    s.append(f'<path d="{orin}" fill="none" stroke="#bcd3d6" stroke-width="22" stroke-linecap="round"/>')
    # Oberstadt-Hügel
    s.append('<ellipse cx="760" cy="200" rx="230" ry="140" fill="#e8dcc0" stroke="#9a8a6a" stroke-width="2" stroke-dasharray="8 6"/>')
    # Stadtmauer grob
    s.append('<path d="M 260,120 C 500,60 900,60 1010,260 C 1060,420 1020,560 900,640 C 760,700 500,700 300,640" fill="none" stroke="#6b5b4b" stroke-width="6" stroke-dasharray="20 6"/>')
    def ort(x, y, t, u=None, farbe='#2b241e', r=9, links=False):
        s.append(punkt(x, y, r, farbe)); dx, a = (-14, 'end') if links else (14, 'start')
        s.append(text(x + dx, y - 6, t, 21, fett=True, anker=a))
        if u: s.append(text(x + dx, y + 16, u, 15, kursiv=True, anker=a))
    s.append(text(120, 450, 'HAFEN', 34, fett=True, farbe='#355057'))
    ort(330, 300, 'Nordkai', 'Lagerhäuser')
    ort(450, 420, 'Altes Zollhaus', 'Torbogen')
    ort(330, 600, 'Fischmarkt', 'Garküche Mutter Kessel')
    ort(270, 360, 'Dampfkran', None, '#4a6a70', 7)
    ort(500, 520, 'Hafenviertel', 'Rostiger Anker, Seilerei, Knallfunke & Söhne')
    s.append('<path d="M 515,505 C 550,480 580,462 610,450" fill="none" stroke="#7a5a3a" stroke-width="5"/>')
    s.append(text(425, 478, 'Zwirbelgasse', 18, kursiv=True, farbe='#7a5a3a'))
    # Marktplatz
    s.append('<rect x="610" y="360" width="130" height="110" fill="#e1c98f" stroke="#2b241e" stroke-width="2"/>')
    s.append('<circle cx="672" cy="415" r="12" fill="#bcd3d6" stroke="#2b241e" stroke-width="2"/>')
    s.append('<rect x="742" y="372" width="34" height="86" fill="#a65a3a" stroke="#2b241e" stroke-width="2"/>')
    s.append(text(620, 495, 'Marktplatz · Brunnen', 20, fett=True))
    s.append(text(785, 420, 'Ratshalle', 20, fett=True))
    s.append(text(620, 518, 'Markt, Wachhaus, Botenhaus, Gewölbe darunter', 15, kursiv=True))
    s.append(text(700, 150, 'OBERSTADT', 28, fett=True))
    ort(900, 210, 'Haus der Weiten Feder', 'Fernrohre auf dem Dach')
    s.append('<path d="M 720,260 C 700,300 690,330 680,360" fill="none" stroke="#7a5a3a" stroke-width="5"/>')
    s.append(text(560, 300, 'Apfelgasse', 18, kursiv=True, farbe='#7a5a3a'))
    ort(420, 110, 'Nordtor', '→ Klippen von Ahrn (5 km)')
    ort(1000, 290, 'Räderviertel', 'Große Schmiede, Tuchhalle, Färberturm', links=True)
    ort(850, 600, 'Zwergenviertel', 'Steinmetzhof, am Hang über dem Fluss', links=True)
    ort(930, 450, 'Landtor', '→ Spaltstraße, Nyrrspalt', links=True)
    ort(978, 545, 'Erzlände', 'Erzkähne', '#4a6a70', 7)
    s.append('<rect x="875" y="634" width="70" height="22" fill="#9a8a6a" stroke="#2b241e" stroke-width="2" transform="rotate(55 910 645)"/>')
    s.append(text(950, 680, 'Orinbrücke', 19, fett=True))
    s.append(text(640, 790, 'Orin', 26, kursiv=True, farbe='#355057'))
    s.append(text(300, 800, 'Mündung des Orin', 16, kursiv=True))
    cx, cy = 1140, 820
    s.append(f'<path d="M {cx},{cy-44} L {cx+12},{cy} L {cx},{cy-8} L {cx-12},{cy} Z" fill="#2b241e"/>')
    s.append(text(cx, cy - 52, 'N', 24, fett=True, anker='middle'))
    s.append(text(30, 40, 'Lysmara – Lagevorlage (schematisch, keine fertige Karte)', 22, fett=True))
    s.append('</svg>')
    return '\n'.join(s)

if __name__ == '__main__':
    os.makedirs(ZIEL, exist_ok=True)
    dateien = [('meridel-lagevorlage', meridel()), ('lysmara-lagevorlage', lysmara())]
    GRUND = True
    dateien += [('meridel-grundvorlage', meridel()), ('lysmara-grundvorlage', lysmara())]
    for name, svg in dateien:
        pfad_svg = os.path.join(ZIEL, name + '.svg')
        open(pfad_svg, 'w').write(svg)
        try:
            from playwright.sync_api import sync_playwright
            with sync_playwright() as p:
                b = p.chromium.launch(); seite = b.new_page()
                seite.goto('file://' + os.path.abspath(pfad_svg))
                import re
                w, h = map(float, re.search(r'width="([\d.]+)" height="([\d.]+)"', svg).groups())
                seite.set_viewport_size({'width': int(w), 'height': int(h)})
                seite.screenshot(path=os.path.join(ZIEL, name + '.png')); b.close()
        except Exception as e:
            print('PNG nicht erzeugt:', e)
        print('geschrieben:', name)
