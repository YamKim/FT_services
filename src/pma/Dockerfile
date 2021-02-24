FROM  alpine:3.11

RUN apk update && apk upgrade && apk add bash \
&& apk add php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session

# We download PHPMyAdmin
RUN wget https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-all-languages.tar.gz \
&& tar -xvf phpMyAdmin-4.9.0.1-all-languages.tar.gz \
&& mv phpMyAdmin-4.9.0.1-all-languages /www \
&& rm -rf /var/cache/apk/*

RUN apk		--no-cache update; \
apk		--no-cache add openrc; \
mkdir	/run/openrc;\
touch /run/openrc/softlevel

RUN apk --no-cache add nginx

RUN rm /etc/nginx/nginx.conf

COPY ./src/nginx.conf /etc/nginx/nginx.conf
COPY ./src/phpmyadmin.inc.php /www/config.inc.php
COPY ./src/entrypoint.sh .


ENTRYPOINT [ "/bin/sh" , "/entrypoint.sh"]