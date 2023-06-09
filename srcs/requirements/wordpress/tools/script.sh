#!/bin/bash

db_name="wordpress"
db_user="hboumahd"
db_pass="hix1234"

DOMAIN_NAME="klj.com"
WP_TITLE="hixwordpress"
WP_ADMIN_USR="hixroot"
WP_ADMIN_PWD="hix1234root"
WP_ADMIN_EMAIL="hix.root@gmail.com"
WP_USR="hix"
WP_EMAIL="hix.user@gmail.com"
WP_PWD="hix1234user"


# mkdir /var/www/

# For install wordpress
# mkdir /var/www/html
# cd /var/www/html
# pwd
# rm -rf *
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar 
chmod +x wp-cli.phar 
mv wp-cli.phar /usr/local/bin/wp
wp core download  --path="/var/www/html" --allow-root

# update the wordpress config file(wp-config.php)
# mv /var/www/html/wp-config-sample.php /var/www/html/wp-config.php
# mv /wp-config.php /var/www/html/wp-config.php
# sed -i -r "s/myDb/$db_name/1"  wp-config.php
# sed -i -r "s/user/$db_user/1"  wp-config.php
# sed -i -r "s/pass/$db_pass/1"  wp-config.php
wp config create --dbname=$db_name --dbuser=$db_user --dbpass=$db_pass --locale=mariadb --path="/var/www/html" --allow-root

# For setup wordpress
wp core install --url=$DOMAIN_NAME/ --title=$WP_TITLE --admin_user=$WP_ADMIN_USR --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --skip-email --path="/var/www/html" --allow-root
wp user create $WP_USR $WP_EMAIL --role=author --user_pass=$WP_PWD --path="/var/www/html" --allow-root

# For configure and run PHP-FPM
sed -i 's/listen = \/run\/php\/php7.4-fpm.sock/listen = 9000/g' /etc/php/7.4/fpm/pool.d/www.conf
mkdir /run/php
/usr/sbin/php-fpm7.4 -F
