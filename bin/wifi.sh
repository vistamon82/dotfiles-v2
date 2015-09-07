#! /bin/bash
#muh amazign weefee script
#
# DISABLE WIFI DRIVER: ip link set wlan0 down
# ENABLE WIFI DRIVER: ip link set wlan0 up
# DISCONNECT FROM WIFI: netctl-auto disable-all
# RECONNECT TO WIFI: netctl-auto enable-all
#ICON=""

while true;

do
	STATUS=$(wpa_cli status | grep wpa_state | sed 's/wpa_state=//')
	ENCTYPE=$(wpa_cli status | grep key_mgmt | sed 's/key_mgmt=//')
	NETWORK=$(essid)
	SIGQUAL=$(iw wlp1s0 link | grep signal | sed 's/\tsignal: //')
#	SIGQUALNUM=$(iw wlp1s0 link | grep signal | sed 's/\tsignal: //' | sed 's/\ dBm//')
#	echo $STATUS	# for DEBUG
#	echo $ENCTYPE	# for DEBUG
#	echo $NETWORK	# for DEBUG
#	echo $SIGQUAL	# for DEBUG
	if [ $STATUS == 'COMPLETED' ];
		then
		ICON=''
	elif [ $STATUS == 'INACTIVE' ];
		then
		NETWORK='Disconnected'
		ICON=''
	elif [ $STATUS == 'INTERFACE_DISABLED' ];
		then
		NETWORK='Disabled'
		ICON=''
        elif [ $STATUS == 'SCANNING' ];
                then
                NETWORK='Scanning...'
                ICON=''
        elif [ $STATUS == 'AUTHENTICATING' ];
                then
                NETWORK='Authenticating...'
                ICON=''

	fi
	echo w$ICON $NETWORK $SIGQUAL
	sleep 1
done
