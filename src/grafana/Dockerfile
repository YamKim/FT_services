FROM alpine:3.11

RUN apk --no-cache update;
RUN apk --no-cache add libc6-compat;
RUN apk --no-cache add unzip;
RUN apk --no-cache add wget;
RUN wget https://dl.grafana.com/oss/release/grafana-7.4.3.linux-amd64.tar.gz
RUN tar -zxvf grafana-7.4.3.linux-amd64.tar.gz
RUN  mv grafana-7.4.3 /usr/share/grafana
RUN  mkdir -p /var/lib/grafana/dashboards
#COPY ./src/grafana.db /usr/share/grafana/data/
COPY ./src/start.sh .
#ENV GF_SECURITY_ADMIN_PASSWORD=secret

ENTRYPOINT  [ "/bin/sh","start.sh" ]