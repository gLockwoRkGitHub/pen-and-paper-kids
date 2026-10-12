# Setzt mehrere erzeugte Bilder (<praefix>-s1.png …) zu einer nummerierten Übersicht zusammen.
# Aufruf: powershell -File tools/bilduebersicht.ps1 <praefix> <anzahl> <spalten> <kachelbreite> <kachelhoehe>
param([string]$Praefix, [int]$Anzahl, [int]$Spalten, [int]$B, [int]$H)
Add-Type -AssemblyName System.Drawing
$zeilen = [math]::Ceiling($Anzahl / $Spalten)
$bmp = New-Object System.Drawing.Bitmap ($Spalten * $B), ($zeilen * $H)
$g = [System.Drawing.Graphics]::FromImage($bmp)
$g.InterpolationMode = 'HighQualityBicubic'
$schrift = New-Object System.Drawing.Font 'Arial', 20
1..$Anzahl | ForEach-Object {
  $i = [System.Drawing.Image]::FromFile("$Praefix-s$_.png")
  $x = (($_ - 1) % $Spalten) * $B
  $y = [math]::Floor(($_ - 1) / $Spalten) * $H
  $g.DrawImage($i, $x, $y, $B, $H)
  $g.DrawString("s$_", $schrift, [System.Drawing.Brushes]::Red, $x + 5, $y + 5)
  $i.Dispose()
}
$bmp.Save("$Praefix-uebersicht.png")
$g.Dispose(); $bmp.Dispose()
"$Praefix-uebersicht.png"
