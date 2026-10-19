# Zeichnet das Zeichen der Leisen Hand als exakte Vorlage: ein Gesicht von vorn, Augen geschlossen,
# der ZEIGEfinger liegt senkrecht über den Lippen („Psst“), Daumen und eingerollte Finger sind sichtbar,
# damit die Geste nie als anderer Finger gelesen werden kann.
# Aufruf: python tools/leise-hand-vorlage.py  → docs/art/requisiten/leise-hand-vorlage.png
from PIL import Image, ImageDraw

S = 1024
im = Image.new('RGB', (S, S), 'white')
d = ImageDraw.Draw(im)
T = 14  # Strichstärke
schwarz = (20, 20, 20)

# Gesicht
d.ellipse((232, 140, 792, 760), outline=schwarz, width=T)
# geschlossene Augen (Bögen nach unten)
d.arc((330, 330, 450, 410), 20, 160, fill=schwarz, width=T)
d.arc((574, 330, 694, 410), 20, 160, fill=schwarz, width=T)
# Mund: geschlossene Lippen als Oval mit Mittellinie (der Finger liegt darüber)
d.ellipse((392, 568, 632, 662), outline=schwarz, width=T)
d.line((400, 615, 624, 615), fill=schwarz, width=8)

# Hand von unten: Faust mit eingerollten Fingern, Zeigefinger senkrecht nach oben über den Mund
weiss = (255, 255, 255)
# Zeigefinger
d.rounded_rectangle((470, 500, 554, 820), 42, fill=weiss, outline=schwarz, width=T)
d.line((480, 560, 544, 560), fill=schwarz, width=6)          # Fingernagel-Andeutung
d.arc((478, 505, 546, 570), 200, 340, fill=schwarz, width=6)
# Faust (eingerollte Finger) unter dem Zeigefinger, deutlich breiter
d.rounded_rectangle((420, 760, 700, 960), 70, fill=weiss, outline=schwarz, width=T)
for x in (510, 580, 640):                                       # Fingerknöchel
    d.line((x, 770, x, 860), fill=schwarz, width=8)
# Daumen links, quer über die Faust
d.rounded_rectangle((360, 800, 560, 880), 40, fill=weiss, outline=schwarz, width=T)
# Zeigefinger noch einmal oben drüber, damit er vor der Faust liegt
d.rounded_rectangle((470, 500, 554, 790), 42, fill=weiss, outline=schwarz, width=T)
d.arc((478, 505, 546, 570), 200, 340, fill=schwarz, width=6)

im.save('docs/art/requisiten/leise-hand-vorlage.png')
print('docs/art/requisiten/leise-hand-vorlage.png')
