 #/bin/sh


service mariadb stop;

rm /etc/my.cnf.d/*
cp mariadb-server.conf /etc/my.cnf
chown -R mysql: /etc/my.cnf
