#!/bin/bash
set -e

echo "Det här skriptet kommer försöka fylla i precis samma tider varje dag under fyra veckors tid i FLEX HRM."
echo "Det räknar med att du kör Firefox med tillägget Vim Vixen."
echo "Det räknar också med att du inte visar bokmärkesmenyn."
echo

echo "Markera Firefox-fönstret med FLEX öppnat och navigerat till dagsvyn för den första dagen i månaden."
firefox=$(xdotool selectwindow)
echo "Det valda fönstret har titel " $(xdotool getwindowname $firefox)
echo
echo "Fyller i tiderna för en dag."
xdotool key       --window $firefox --delay 75 f a j
xdotool windowfocus $firefox
xdotool type      --window $firefox 'ARB'
xdotool key       --window $firefox Tab 8 Tab 1 2
echo "Sparar sida"
sleep 0.5
xdotool key       --window $firefox --delay 100 F6 Tab Tab Tab Tab f j
echo "Väntar på att skiten ska ladda om innan vi får gå till nästa dag"
sleep 3.5
echo "Går till nästa dag"
xdotool key       --window $firefox --delay 75 f a i
