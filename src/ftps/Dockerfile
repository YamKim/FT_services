FROM alpine:3.12

RUN apk update && apk upgrade

RUN  apk add acf-openssl

RUN apk add vsftpd 
#generate cert 
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /ftps.pem -keyout /ftps.key -subj "/name=B0N3@1337"

COPY ./src/ftps.conf /etc/vsftpd/vsftpd.conf

COPY ./src/start.sh /

CMD ["sh", "start.sh"]