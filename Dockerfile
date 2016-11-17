FROM prima/filebeat:5.0.0-rc1

WORKDIR /opt

RUN apt-get update && apt-get install -y wget supervisor

RUN wget https://github.com/jwilder/docker-gen/releases/download/0.7.3/docker-gen-linux-amd64-0.7.3.tar.gz
RUN tar xvzf docker-gen-linux-amd64-0.7.3.tar.gz

COPY filebeat.conf /etc/supervisor/conf.d/

COPY entrypoint.sh /



ENTRYPOINT ["/entrypoint.sh"]

#ENTRYPOINT ["/bin/bash"]
