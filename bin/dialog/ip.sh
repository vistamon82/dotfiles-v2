#! /bin/bash

LOCAL=$(ip a | grep inet | awk 'FNR == 3 {print}' | awk '{print $2}' | sed "s/[/].*//")
EXTERNAL=$(curl -s icanhazip.com)

if [[ $LOCAL == '' ]]; then
LOCAL="N/A"
fi

if [[ $EXTERNAL == '' ]]; then
EXTERNAL="N/A"
fi


printf "$LOCAL\n$EXTERNAL\n"
