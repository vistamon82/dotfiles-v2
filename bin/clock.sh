#! /bin/bash
#muh amazign clock script

. panel_colors

while true;
do
	TIME=$(date | awk '{print $4}')
	echo S $TIME
	sleep 1
done
