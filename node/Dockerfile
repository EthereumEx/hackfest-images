FROM ubuntu

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y npm nodejs-legacy

RUN npm install -g  grunt
RUN npm install -g pm2
RUN apt-get install -y git

ENTRYPOINT ["/bin/bash"]
