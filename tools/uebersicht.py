# Baut ein beschriftetes Übersichtsbild aus fertigen Bildern eines Ordners.
# Aufruf: python tools/uebersicht.py <ziel.png> <bild1.png> <bild2.png> ...  (4 Spalten)
import sys, os
from PIL import Image, ImageDraw, ImageFont
ziel, fs = sys.argv[1], sys.argv[2:]
sp, kb, kh = 4, 576, 384
ze = (len(fs) + sp - 1) // sp
c = Image.new('RGB', (sp * kb, ze * (kh + 28)), 'white'); d = ImageDraw.Draw(c)
try:
    font = ImageFont.truetype('arial.ttf', 15)
except Exception:
    font = None
for k, f in enumerate(fs):
    i = Image.open(f).convert('RGB'); w = int(kh * i.width / i.height)
    if w > kb: w = kb
    x, y = (k % sp) * kb, (k // sp) * (kh + 28)
    i = i.resize((w, int(w * i.height / i.width)))
    c.paste(i, (x + (kb - w) // 2, y))
    d.text((x + 4, y + kh + 5), os.path.basename(f)[:-4], fill='black', font=font)
c.save(ziel)
