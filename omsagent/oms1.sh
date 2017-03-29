WSID=9f9ab097-1442-4e3e-b1eb-79c268dcaa66
KEY=KmOMpRxMzrq/WqPwOOdVKrzs/M+ST16Hd6LkIR6ItVHTWLtCzel1PjcqRaZVY3Xsndc4DXaewuWesLMoRDzNeA==

docker run --privileged -d -e WSID=$WSID -e KEY=$KEY -p 127.0.0.1:25225:25225 --name="omsagent" -h=`hostname` --restart=always microsoft/oms

# docker run --privileged -d -v /var/run/docker.sock:/var/run/docker.sock -e WSID=$WSID -e KEY=$KEY -p 127.0.0.1:25225:25225 --name="omsagent" -h=`hostname` --restart=always microsoft/oms



docker build -t gethomsagent:latest .


docker run -it --rm --name gethomsagent_1 -e WSID=9f9ab097-1442-4e3e-b1eb-79c268dcaa66 -e KEY=KmOMpRxMzrq/WqPwOOdVKrzs/M+ST16Hd6LkIR6ItVHTWLtCzel1PjcqRaZVY3Xsndc4DXaewuWesLMoRDzNeA== gethomsagent