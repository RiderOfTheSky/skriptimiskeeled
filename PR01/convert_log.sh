#!/bin/bash

#
# Otsime kõiki ridu kus sisaldub "Power"
# sed: asendame "Power is back" kuni rea lõpuni ühe "B" tähega
# 	asendame ülejäänud "Power" kuni rea lõpuni "F" tähega

grep Power apcupsd.events |\
       	sed 's/Power is back.*/B/g;s/Power.*/F/g' |\
(
    while read line
    do
#
# Välja kommenteeritud osa on ca 10x aeglasem!
#	stamp=`echo $line|\
#		cut -d " " -f 1,2,3 |\
#	       	date +"%s" -f -`
#	status =`echo $line |\
#		cut -d " " -f 4`

	stamp=`date -d "${line:0:26}" +"%s"`
	status=${line:30}
	echo $status" "$stamp
done
)

