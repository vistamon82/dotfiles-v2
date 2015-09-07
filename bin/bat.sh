#! /bin/bash
#BAT_STATE=$(battery | awk '{print $1}')
#echo $BAT_STATE
#
# To do:
# Implement function for BAT_PERCENT to createa a dynamic icon

while true;
do
	
	BAT_STATE=$(acpi | awk '{print $3}' | sed 's/,//')
	BAT_PERCENT=$(acpi | awk '{print $4}' | sed 's/%,//' |  sed 's/%//')	

	if [ $BAT_STATE == 'Discharging' ]
		then
		BAT_ICON=""
	elif [ $BAT_STATE == 'Full' ]
		then
		BAT_ICON=""
	elif [ $BAT_STATE == 'Charging' ]
		then
		BAT_ICON=""
	fi
	
	echo b$BAT_ICON $BAT_PERCENT\%
	
	sleep 1

done
