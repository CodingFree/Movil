#!/bin/bash
OPTIONS="SET START STOP"
select opt in $OPTIONS; do
if [ "$opt" = "SET" ]; then
	netsh wlan set hostednetwork mode=allow ssid="MOVISTAR_4BB1L" key=isdefe.123 keyusage=persistent
	elif [ "$opt" = "START" ]; then
	netsh wlan start hostednetwork
	else
	netsh wlan stop hostednetwork
fi
done
