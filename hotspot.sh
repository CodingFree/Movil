#!/bin/bash
OPTIONS="SET START STOP"
select opt in $OPTIONS; do
if [ "$opt" = "SET" ]; then
	netsh wlan set hostednetwork mode=allow ssid="MOVISTAR_4BB1L'AMETLLA DE MAR
L'AMETLLA DEL VALLÈS
L'AMPOLLA
L'ARBOÇ
L'ARMENTERA
" key=isdefe.123 keyusage=persistent
	elif [ "$opt" = "START" ]; then
	netsh wlan start hostednetwork
	else
	netsh wlan stop hostednetwork
fi
done