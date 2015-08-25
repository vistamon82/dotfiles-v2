#/bin/bash

#A simple popup showing system information

FONT="tamsyn:size=9"
ICONFONT="Siji:size=9"
HOST=$(uname -n)
KERNEL=$(uname -r)
UPTIME=$( uptime | sed 's/.* up //' | sed 's/[0-9]* us.*//' | sed 's/ day, /d /'\
         | sed 's/ days, /d /' | sed 's/:/h /' | sed 's/ min//'\
           |  sed 's/,/m/' | sed 's/  / /')
PACKAGES=$(pacman -Q | wc -l)
UPDATED=$(awk '/upgraded/ {line=$0;} END { $0=line; gsub(/[\[\]]/,"",$0); \
         printf "%s %s",$1,$2;}' /var/log/pacman.log)
LOCAL=$(ip a | grep inet | awk 'FNR == 3 {print}' | awk '{print $2}' | sed "s/[/].*//")
EXTERNAL=$(curl -s icanhazip.com)

(
echo "System Information" # Fist line goes to title
# The following lines go to slave window
echo "^fn($ICONFONT)^fn($FONT)Host: $HOST "
echo "Kernel: $KERNEL"
echo "Uptime: $UPTIME "
echo "Pacman: $PACKAGES packages"
echo "Last updated on: $UPDATED"
echo "^fn($ICONFONT)^fn($FONT)$LOCAL"
echo "^fn($ICONFONT)^fn($FONT)$EXTERNAL"
) | dzen2 -p -x "500" -y "30" -w "220" -l "7" -sa 'l' -ta 'c'\
   -title-name 'popup_sysinfo' -e 'onstart=uncollapse;button1=exit;button3=exit'

# "onstart=uncollapse" ensures that slave window is visible from start.
