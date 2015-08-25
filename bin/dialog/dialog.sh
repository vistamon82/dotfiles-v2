#! /bin/bash
#-g 110x30+1790+50
PANEL_FONT_FAMILY1="tamsyn:size=9"
PANEL_FONT_FAMILY2="Siji:size=6"


. /home/anon/bin/panel_colors

fan=$(/home/anon/bin/dialog/fan.sh)

echo hi | lemonbar -g 110x60+1790+50 -f "$PANEL_FONT_FAMILY1" -f "$PANEL_FONT_FAMILY2" -F "$COLOR_FOREGROUND" -B "$COLOR_BACKGROUND"
