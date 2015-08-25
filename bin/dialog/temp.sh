#! /bin/bash
while true;
do
	TEMP=$(sensors | awk '/temp1/ {print $2}' | sed 's/+//')
	PID=$(ps aux | grep -i lemonbar | awk '/110x60+1790+50/ {print $2}')
	echo %{c}%{A:kill $PID:i} $TEMP%{A}
	#echo %{c}%{A:kill $PID:i} $PID %{A}

	sleep 1
done
