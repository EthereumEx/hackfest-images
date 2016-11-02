FROM geth-stats

RUN npm install -g pm2

RUN useradd -ms /bin/bash geth

USER geth
WORKDIR /home/geth

ENTRYPOINT ["pm2", "start", "--no-daemon", "app.json"]


