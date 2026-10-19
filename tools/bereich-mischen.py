# Übernimmt aus einer Bildbearbeitung nur einen ovalen Bereich (weich überblendet) ins Original, der Rest bleibt pixelgleich.
# Aufruf: python tools/bereich-mischen.py <original> <bearbeitung> <ziel> <cx> <cy> <rx> <ry>
# Entstanden 19.10.2026: Aufnäher auf Finks Mütze vom Modell malen lassen, ohne dass sich Fink selbst verändert.
import sys
from PIL import Image, ImageDraw, ImageFilter
orig, edit, out = sys.argv[1:4]; cx, cy, rx, ry = map(int, sys.argv[4:8])
O = Image.open(orig).convert('RGB'); E = Image.open(edit).convert('RGB').resize(O.size)
m = Image.new('L', O.size, 0); ImageDraw.Draw(m).ellipse((cx-rx, cy-ry, cx+rx, cy+ry), fill=255)
m = m.filter(ImageFilter.GaussianBlur(min(rx, ry) // 4))
Image.composite(E, O, m).save(out)
