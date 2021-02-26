#!/bin/sh
if [ ! "$(ls -A /var/lib/mysql )" ]
then
mysql_install_db --user=mysql --datadir=/var/lib/mysql; 
/etc/init.d/mariadb setup; 
rc-status; 
service mariadb start;
mysql -u root -e "source /wordpressdb.sql"; 
mysql -u root -e " source /phpmyadmin.sql" ; 
mysql -u root -e "CREATE USER 'b0n3'@'% ' IDENTIFIED BY 'admin';" 
mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO 'b0n3'@'% ';"; 
mysql -u root -e "FLUSH PRIVILEGES;";
else
service mariadb start;
fi
tail -f    /var/lib/mysql/ib_logfile0