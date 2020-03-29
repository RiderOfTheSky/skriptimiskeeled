#!/bin/bash

STEP=300
numofline=1

cat vahetulemused.txt | while read -r line;
do

   timestamp=$(echo "$line" | cut -c 1-10)
   pfvalue=$(echo "$line" | cut -c 12-)

      if  (( $timestamp == $(( $timestamp + $pfvalue )) ));then

	  nexttimestamp=$(sed "$((numofline + 1))q;d" vahetulemused.txt | cut -c 1-10)

          seq -f "%1.f:0" $(( $timestamp )) $STEP $(( $nexttimestamp - 1 ))

	  numofline=$((numofline+1))
      else

          seq -f "%1.f:$pfvalue" $timestamp $STEP $(( $timestamp + $pfvalue ))

	  nexttimestamp=$(sed "$((numofline + 1))q;d" vahetulemused.txt | cut -c 1-10)

          seq -f "%1.f:0" $(( $timestamp + $pfvalue )) $STEP $(( $nexttimestamp - 1 ))

	  numofline=$((numofline+1))
      fi
done
