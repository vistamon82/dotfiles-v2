#! /bin/bash

LOCAL=$(ip a | grep inet | awk 'FNR == 3 {print}' | awk '{print $2}' | sed "s/[/].*//")
EXTERNAL=$(curl -s icanhazip.com)

printf "$LOCAL\n$EXTERNAL\n"
