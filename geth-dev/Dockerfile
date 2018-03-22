FROM ethereum/client-go

# alpine sdk - curl, gcc, make, g++, git
RUN apk add --update \
  alpine-sdk \
  bash \
  vim \
  python \
  net-tools \
  nodejs \
  nodejs-npm \
  lsof

RUN ln -s /geth /usr/bin/geth
RUN npm install -g pm2

ENTRYPOINT ["/bin/bash"]
