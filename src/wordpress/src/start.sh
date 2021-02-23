#IP=`cat clusterip.txt`
#sed -i -e "s/TOCHANGE_IP/$IP/g"  /www/wp-config.php
cat /www/wp-config.php
php -S 0.0.0.0:5050 -t /www/