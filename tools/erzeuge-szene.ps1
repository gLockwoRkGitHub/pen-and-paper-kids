# Erzeugt Seeds für eine Prompt-Datei und liest Größe und Referenzen aus deren erster Kommentarzeile
# (z. B. "# 10 · szene/hafen-kran · Referenzen: figuren/grisk-einzel.png, orte/hafen.png · 1536x1024").
# Aufruf: powershell -File tools/erzeuge-szene.ps1 <prompt.txt> <zielordner> [-Anzahl 6] [-Seed 1] [-MaxRef 3]
# Ergebnis: <zielordner>\<name>-s<seed>.png und <name>-uebersicht.png
param([string]$Prompt, [string]$Ziel, [int]$Anzahl = 6, [int]$Seed = 1, [int]$MaxRef = 3)
$kopf = Get-Content $Prompt -Encoding utf8 -TotalCount 1
$name = [IO.Path]::GetFileName($Prompt) -replace '\.prompt\.txt$', ''
$b = 1536; $h = 1024
if ($kopf -match '(\d{3,4})x(\d{3,4})') { $b = [int]$Matches[1]; $h = [int]$Matches[2] }
$refs = @([regex]::Matches($kopf, '[a-z0-9/\-]+\.png') | ForEach-Object { 'docs/art/' + $_.Value } | Where-Object { $_ -notmatch 'nach-sturz' } | Select-Object -First $MaxRef)
$fehlt = @($refs | Where-Object { -not (Test-Path $_) })
if ($fehlt.Count) { Write-Output "FEHLT ($name): $($fehlt -join ', ')"; exit 1 }
$arg = @('tools/erzeuge-bild.js', $Prompt, "$Ziel\$name", '--anzahl', $Anzahl, '--seed', $Seed, '--breite', $b, '--hoehe', $h)
if ($refs.Count) { $arg += @('--referenz', ($refs -join ',')) }
node @arg | Out-Null
if ($LASTEXITCODE -ne 0) { Write-Output "FEHLER ($name)"; exit 1 }
Add-Type -AssemblyName System.Drawing
$kb = 768; $kh = [int]($kb * $h / $b); $sp = 3; $z = [math]::Ceiling($Anzahl / $sp)
$bmp = New-Object System.Drawing.Bitmap ($sp * $kb), ($z * $kh)
$g = [System.Drawing.Graphics]::FromImage($bmp); $g.InterpolationMode = 'HighQualityBicubic'
$schrift = New-Object System.Drawing.Font 'Arial', 20
for ($k = 0; $k -lt $Anzahl; $k++) {
  $i = [System.Drawing.Image]::FromFile("$Ziel\$name-s$($Seed + $k).png")
  $x = ($k % $sp) * $kb; $y = [math]::Floor($k / $sp) * $kh
  $g.DrawImage($i, $x, $y, $kb, $kh); $g.DrawString("s$($Seed + $k)", $schrift, [System.Drawing.Brushes]::Red, $x + 5, $y + 5); $i.Dispose()
}
$bmp.Save("$Ziel\$name-uebersicht.png"); $g.Dispose(); $bmp.Dispose()
Write-Output "$name ($($b)x$h, Referenzen: $($refs.Count))"
