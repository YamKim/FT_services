rc-status
rc-update add nginx;

mkdir -p /www/tmp

chmod 777 /www/tmp

chown -R nginx:nginx www
mkdir -p	/run/nginx/;
php-fpm7;
nginx -g "daemon off;" 
