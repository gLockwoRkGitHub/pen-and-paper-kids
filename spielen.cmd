@echo off
rem Startet das Spiel im Heim-WLAN. Einfach doppelklicken, Fenster offen lassen.
rem Auf dem Tablet die angezeigte Adresse "Auf dem Tablet" im Browser oeffnen.
cd /d "%~dp0"
git pull --rebase --autostash
call npm install
call npm run spielen
pause
