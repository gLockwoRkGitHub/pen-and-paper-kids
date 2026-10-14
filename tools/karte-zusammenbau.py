# Baut Prüfbilder: Grundkarte + alle Ortsskizzen an ihrer Stelle (Mitte = x,y, Breite = breite) + Wege.
# Aufruf: python tools/karte-zusammenbau.py   → docs/art/karten/pruefung-<karte>-komplett.png
import json
from PIL import Image, ImageChops, ImageDraw
K = 'docs/art/karten/'
d = json.load(open(K + 'karten.json', encoding='utf-8'))
for name, karte in d['karten'].items():
    B, H = karte['breite'], karte['hoehe']
    bild = Image.open(K + karte['grundkarte'].split('/')[-1]).convert('RGB').resize((B, H))
    for ort in d['orte'].values():
        if ort.get('karte') != name or not ort.get('skizze'):
            continue
        try:
            s = Image.open(K + ort['skizze']).convert('RGB')
        except FileNotFoundError:
            print('fehlt:', ort['skizze']); continue
        # Weißraum abschneiden, damit 'breite' die Breite des Symbols ist
        box = ImageChops.invert(s.convert('L')).point(lambda v: 255 if v > 25 else 0).getbbox() or (0, 0, s.width, s.height)
        s = s.crop(box); w = ort['breite']; h = max(1, int(w * s.height / s.width))
        s = s.resize((w, h)); x, y = int(ort['x'] - w / 2), int(ort['y'] - h / 2)
        teil = bild.crop((x, y, x + w, y + h)); bild.paste(ImageChops.multiply(teil, s), (x, y))
    dr = ImageDraw.Draw(bild)
    for weg in d['wege'].values():
        if weg.get('karte') == name:
            dr.line([tuple(p) for p in weg['punkte']], fill=(120, 60, 20), width=3 if weg.get('stil') == 'strasse' else 2)
    bild.save(K + f'pruefung-{name}-komplett.png'); print(K + f'pruefung-{name}-komplett.png')
