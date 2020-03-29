#!/bin/bash

rrdtool create powerfails.rrd \
          --start 1520953960 \
	  --step 300s \
          DS:powerfail:GAUGE:5m:0:U \
          RRA:MAX:0.5:5m:30d \
          RRA:MAX:0.5:10m:90d \
          RRA:MAX:0.5:1h:18M \
          RRA:MAX:0.5:1d:10y
