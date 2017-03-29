#!/bin/bash
set -x
set -m
/bin/bash /opt/main.sh &
sleep 10
echo 'copying file'
cd /opt/gethomsagent
echo 'done copy file'
cp execgeth-json.conf /etc/opt/microsoft/omsagent/conf/omsagent.d/.
ls -alt /etc/opt/microsoft/omsagent/conf/omsagent.d/
cd /opt
/opt/microsoft/omsagent/bin/service_control restart
jobs
fg %1
