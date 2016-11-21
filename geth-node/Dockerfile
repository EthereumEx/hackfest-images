FROM ethereumex/geth-stats

RUN npm install -g pm2

RUN useradd -ms /bin/bash geth

USER geth
WORKDIR /home/geth
ADD app.json /home/geth/app.json
ADD runGeth.sh /home/geth/runGeth.sh

ENTRYPOINT ["pm2", "start", "--no-daemon", "app.json"]


