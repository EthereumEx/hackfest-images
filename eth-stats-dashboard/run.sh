#!/bin/bash

cd /home/dashboard
pm2 start app.json
cd /var/lib/eth-netstats
npm start
