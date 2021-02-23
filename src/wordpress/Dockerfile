FROM alpine:3.11

# get cluster ip
ARG IP

# We install packages
RUN apk update && apk add wget && mkdir /www \
&& apk add php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session
#RUN apk add telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache

# We get the last version of Wordpress and uncompress it
RUN wget https://wordpress.org/latest.tar.gz \
&& tar -xvf latest.tar.gz \
&& mv wordpress/* /www \
&& rm -rf /var/cache/apk/*

# We copy wordpress database config file
#COPY ./src/wp-config.php /www/wp-config.php

#save  cluster IP
RUN echo $IP > clusterip.txt
RUN cat clusterip.txt


# RUN mkdir -p /etc/telegraf
# COPY ./telegraf.conf /etc/telegraf/telegraf.conf


COPY ./src/start.sh .
RUN chmod +x start.sh
EXPOSE 5050
ENTRYPOINT [ "/bin/sh", "/start.sh" ] 
