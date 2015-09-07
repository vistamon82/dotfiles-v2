#/bin/bash

#A simple popup showing system information

FONT="tamsyn:size=9"
ICONFONT="Siji:size=9"

#color_se='#4A90D8'
#color_sf='#f9f9f9'
color_fg='#eeeeee'
color_bg='#2b2b2b'

(
cal
) | dzen2 -p -x "500" -y "30" -w "220" -l "7" -sa 'l' -ta 'c'\
   -title-name 'popup_sysinfo' -e 'onstart=uncollapse;button1=exit;button3=exit'

# "onstart=uncollapse" ensures that slave window is visible from start.
