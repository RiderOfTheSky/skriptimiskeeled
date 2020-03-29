#!/bin/bash

rrdtool graph powerfails_1y.png \
	--start now-1y --end now \
	--font TITLE:13:Times \
        --font AXIS:7:Times \
	--font WATERMARK:13:Times \
	--height=768 \
	--width=1024 \
	-a PNG -t "Powerfails 1 year" \
	-o -l 2 \
        -W "Skriptimiskeeled 2020 - Vjatseslav Davidjuk" \
        --vertical-label "failure (s)" \
	--x-grid DAY:1:DAY:1:WEEK:1:86400:"%U" \
	DEF:a=powerfails.rrd:powerfail:MAX \
	LINE1:a#0000FF:"powerfails 1 year" \
	COMMENT:"\\n" \
	COMMENT:"X-asis shows the week number"
#2592000
