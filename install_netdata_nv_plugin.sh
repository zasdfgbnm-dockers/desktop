#!/bin/bash

pip install nvidia-ml-py

cd /usr/lib/netdata/python.d/
wget https://raw.githubusercontent.com/coraxx/netdata_nv_plugin/master/nv.chart.py

cd /etc/netdata/python.d/
wget https://raw.githubusercontent.com/coraxx/netdata_nv_plugin/master/nv.conf