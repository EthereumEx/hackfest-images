#1/bin/bash

cd /home/dashboard
pm2 start app.json
cd eth-stats
npm start
