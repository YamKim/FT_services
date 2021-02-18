FROM alpine:3.11


RUN apk update && apk add nginx \
&& apk add --no-cache --upgrade bash \
&& apk add openssl && mkdir -p var/run/nginx \
&& apk add openssl openssh \
&& rm -rf /var/cache/apk/* \
&& apk --no-cache add openrc;


RUN adduser -D -g 'www' www \
&& mkdir /www && chown -R www:www /var/lib/nginx \
&& chown -R www:www /www

RUN mkdir /etc/nginx/ssl \
&& openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/nginx/ssl/www.pem -keyout /etc/nginx/ssl/www.key -subj "/name=B0N3@1337"


RUN rm /etc/nginx/nginx.conf

COPY ./srcs/nginx.conf /etc/nginx/nginx.conf

COPY ./srcs/setup.sh .

EXPOSE 443 80 4

ENTRYPOINT [ "/bin/bash", "/setup.sh" ]