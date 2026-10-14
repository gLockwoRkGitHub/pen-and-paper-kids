# Ersetzt eine Stelle in einem Bild durch das Ringzeichen (docs/art/requisiten/ringzeichen.png).
# Aufruf: python tools/zeichen-einsetzen.py <bild> <cx> <cy> <groesse> <farbe> [--decke dx,dy,r]
#   cx, cy   Mitte der Stelle, groesse = Durchmesser des Zeichens in Pixeln
#   farbe    z. B. 5a4630 (eingeschnitzt) oder f2efe6 (Kreide)
#   --decke  übermalt vorher einen Kreis mit Radius r an der Stelle mit dem Bildinhalt, der um dx,dy verschoben liegt
#            (entfernt das alte Zeichen; weich überblendet)
# Überschreibt das Bild. Entstanden 14.10.2026 für die Aufträge R4/R5 (Spirale entfernen).
import sys
from PIL import Image, ImageDraw, ImageFilter, ImageOps

bild, cx, cy, g, farbe = sys.argv[1], int(sys.argv[2]), int(sys.argv[3]), int(sys.argv[4]), sys.argv[5]
B = Image.open(bild).convert('RGB')
if '--decke' in sys.argv:
    dx, dy, r = map(int, sys.argv[sys.argv.index('--decke') + 1].split(','))
    p = B.crop((cx + dx - r, cy + dy - r, cx + dx + r, cy + dy + r))
    m = Image.new('L', (2 * r, 2 * r), 0)
    ImageDraw.Draw(m).ellipse((2, 2, 2 * r - 2, 2 * r - 2), fill=255)
    B.paste(p, (cx - r, cy - r), m.filter(ImageFilter.GaussianBlur(max(2, r // 6))))
Z = Image.open('docs/art/requisiten/ringzeichen.png').convert('L').resize((g, g), Image.LANCZOS)
maske = ImageOps.invert(Z).point(lambda v: 255 if v > 110 else int(v * 2.2)).filter(ImageFilter.GaussianBlur(0.6))
fl = Image.new('RGB', (g, g), '#' + farbe)
B.paste(fl, (cx - g // 2, cy - g // 2), maske)
B.save(bild)
