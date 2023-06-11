#!/bin/bash

# For install wordpress
mkdir -p /var/www/html
cd /var/www/html
rm -rf *
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar 
chmod +x wp-cli.phar 
mv wp-cli.phar /usr/local/bin/wp
wp core download  --path="/var/www/html" --allow-root

# update the wordpress config file(wp-config.php)
mv /var/www/html/wp-config-sample.php /var/www/html/wp-config.php
sed -i -r "s/database_name_here/$DB_NAME/1"  wp-config.php
sed -i -r "s/username_here/$DB_USER/1"  wp-config.php
sed -i -r "s/password_here/$DB_PASS/1"  wp-config.php
sed -i -r "s/localhost/mariadb/1"  wp-config.php

# For setup wordpress
wp core install --url=$DOMAIN_NAME/ --title=$WP_TITLE --admin_user=$WP_ADMIN_USR --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --skip-email --path="/var/www/html" --allow-root
wp user create $WP_USR $WP_EMAIL --role=author --user_pass=$WP_PWD --path="/var/www/html" --allow-root

# For configure and run PHP-FPM
mkdir /run/php
sed -i 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/g' /etc/php/7.3/fpm/pool.d/www.conf
/usr/sbin/php-fpm7.3 -F
