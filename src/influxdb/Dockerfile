FROM alpine:3.11

# We install packages
RUN apk update && apk add influxdb \
&& apk add --no-cache --upgrade bash

RUN mkdir -p /etc/telegraf

RUN wget  https://dl.influxdata.com/telegraf/releases/telegraf-1.6.3-static_linux_amd64.tar.gz
RUN tar -C . -xzf telegraf-1.6.3-static_linux_amd64.tar.gz ;         chmod +x telegraf/* ;        cp telegraf/telegraf /usr/bin/ ;         rm -rf *.tar.gz* telegraf

# Telegraf setup

COPY ./src/telegraf.conf /etc/telegraf/telegraf.conf
#COPY ./src/influxdb.conf /etc/influxdb.conf

# Here we go
COPY ./src/start.sh /start.sh
RUN chmod +x /start.sh
RUN adduser -D --home /opt/docker --shell /bin/ash docker  telegraf
EXPOSE 8086
CMD ./start.sh