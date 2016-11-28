FROM ethereumex/bootnode-registrar

RUN useradd -ms /bin/bash dashboard
USER dashboard

WORKDIR /home/dashboard
ADD app.json /home/dashboard/app.json
ADD run.sh /home/dashboard/run.sh

ENTRYPOINT ["sh", "run.sh"]
