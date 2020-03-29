#!/bin/bash

grep -i power apcupsd.events |\
       	sed    's/ Power f.*/S/g;
		s/ P.*/E/g' |\
(   while read line
	do

	   D=$( date -d "${line:0:26}" +"%s" )

	   EV=${line:26}

	   echo $EV" "$D
 	done
) | awk -f deltacalc.awk |\
tee vahetulemused.log
