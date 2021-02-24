from alpine:3.11

RUN apk		--no-cache update; \
apk		--no-cache add openrc; \
mkdir	/run/openrc; \
touch	/run/openrc/softlevel; \
apk		--no-cache add mariadb mariadb-common mariadb-client; 

RUN mysql_install_db --user=mysql --datadir=/var/lib/mysql; \
/etc/init.d/mariadb setup; \
rc-status; \
service mariadb start; 

COPY	./src/* /


RUN  sh /setup_mysql.sh
ENTRYPOINT ["/bin/sh", "/entry_point.sh" ]
