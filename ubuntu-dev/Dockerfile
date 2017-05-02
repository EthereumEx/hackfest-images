FROM ubuntu

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get upgrade -y
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y \ 
	apt-utils \
	vim \
	net-tools \
	git \ 
	curl \ 
	lsof \
	python-software-properties

ENTRYPOINT ["/bin/bash"]

