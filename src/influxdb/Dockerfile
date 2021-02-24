FROM alpine:3.11

# We install packages
RUN apk update && apk add influxdb \
&& apk add --no-cache --upgrade bash

RUN mkdir -p /etc/telegraf

RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.17.3_linux_amd64.tar.gz 
RUN tar xf telegraf-1.17.3_linux_amd64.tar.gz 
RUN cp -r  ./telegraf-1.17.3/etc/* /etc/; 
RUN  cp -r  ./telegraf-1.17.3/usr/* /usr/; 
RUN cp -r   ./telegraf-1.17.3/var/* /var/; 
RUN rm -rf telegraf-1.17.3* 

# Telegraf setup

COPY ./src/telegraf.conf /etc/telegraf/telegraf.conf

# Here we go
COPY ./src/start.sh /start.sh
RUN chmod +x /start.sh
RUN adduser -D --home /opt/docker --shell /bin/ash docker  telegraf
EXPOSE 8086
CMD ./start.sh