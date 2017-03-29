FROM microsoft/oms:latest
ENV tmpdir /opt
COPY gethtest.json execgeth-json.conf copyAndStart.sh $tmpdir/gethomsagent/
WORKDIR ${tmpdir}/gethomsagent

RUN chmod 775 $tmpdir/gethomsagent/copyAndStart.sh
# COPY execgeth-json.conf /etc/opt/microsoft/omsagent/conf/omsagent.d
# COPY execgeth-json.conf /etc/opt/microsoft/omsagent/conf/omsagent.d

#WORKDIR /etc/opt/microsoft/omsagent/conf/omsagent.d
#ADD execgeth-json.conf .

#WORKDIR /opt 
# ENTRYPOINT ["/bin/bash"]

CMD [ "/opt/gethomsagent/copyAndStart.sh" ]