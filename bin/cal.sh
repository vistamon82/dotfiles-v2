#!/bin/sh

if [ $(pgrep -cx cal.sh) -gt 1 ] ; then
	printf "%s\n" "The panel is already running." >&2
	PID=$(pgrep cal.sh)
	kill $PID
fi

. ~/bin/panel_colors

color_se=#729fcf
color_sf=#EEEEEC
color_fg=#EEEEEC
color_bg=#2E3436


#DATETIME() {
#	while :; do
#	echo "^bg($color_se)^fg($color_sf) ^i($icons/clock.xbm) " `date +'%H:%M'` " ^fg()^bg()";
#	echo `date +'%A %d/%m/%y %n'`
#	sleep 1
#	done
#}
#(
#
#        TODAY=$(expr `date +'%d'` + 0)
#        MONTH=`date +'%m'`
#        YEAR=`date +'%Y'`
#
#        color_se=#729fcf
#        color_sf=#EEEEEC
#        color_fg=#EEEEEC
#        color_bg=#2E3436
#
#DATETIME

TODAY=$(expr `date +'%d'` + 0)
MONTH=`date +'%m'`
YEAR=`date +'%Y'`

(

echo "^bg($color_se)^fg($color_sf) ^i($icons/clock.xbm) " `date +'%H:%M'` " ^fg()^bg()";
echo `date +'%A %d/%m/%y %n'`
cal | sed -re "s/^(.*[A-Za-z][A-Za-z]*.*)$/^fg($color_se)^bg($color_bg)\1/;s/(^|[ ])($TODAY)($|[ ])/\1^bg($color_se)^fg($color_sf)\2^fg($color_fg)^bg($color_bg)\3/"

) | dzen2 -fg "$color_fg" -bg "$color_bg" -p -x "1800" -y "$PANEL_HEIGHT" -w "120" -l "8" -sa 'l' -ta 'c'\
 -title-name 'popup_sysinfo' -e 'onstart=uncollapse;button1=exit;button3=exit'
