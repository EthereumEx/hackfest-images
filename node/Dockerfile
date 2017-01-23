FROM ubuntu

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y npm nodejs-legacy
RUN apt-get install -y git
RUN apt-get install -y curl

RUN npm install -g grunt
RUN npm install -g pm2

ENTRYPOINT ["/bin/bash"]
