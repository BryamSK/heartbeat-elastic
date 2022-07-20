FROM ubuntu:20.04
RUN apt-get update -y && apt-get upgrade -y
RUN apt-get -yq --no-install-recommends install \
        curl \
        gnupg \
        wget \
        apt-utils \
        apt-transport-https \
        ca-certificates 
RUN wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | (OUT=$(apt-key add - 2>&1) || echo $OUT)
RUN curl -L -O https://artifacts.elastic.co/downloads/beats/heartbeat/heartbeat-7.14.2-amd64.deb
RUN dpkg -i heartbeat-7.14.2-amd64.deb

WORKDIR /etc/heartbeat/
COPY ./heartbeat.yml /etc/heartbeat/heartbeat.yml
RUN service heartbeat-elastic start
RUN heartbeat setup
ENTRYPOINT heartbeat setup && service heartbeat-elastic start && tail -f /var/log/heartbeat/heartbeat
