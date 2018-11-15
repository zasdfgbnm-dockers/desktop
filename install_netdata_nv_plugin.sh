#!/bin/bash

cd /usr/lib/netdata/python.d/python_modules
wget https://raw.githubusercontent.com/coraxx/netdata_nv_plugin/master/python_modules/pynvml.py

cd /usr/lib/netdata/python.d/
wget https://raw.githubusercontent.com/coraxx/netdata_nv_plugin/master/nv.chart.py

cd /etc/netdata/python.d/
wget https://raw.githubusercontent.com/coraxx/netdata_nv_plugin/master/nv.conf
