@echo off
rem Holt den neuesten Stand aus GitHub. Einfach doppelklicken.
cd /d "%~dp0"
git pull --rebase --autostash
echo.
pause
