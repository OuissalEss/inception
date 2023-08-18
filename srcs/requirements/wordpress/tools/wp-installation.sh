#! /bin/bash

cd /var/www/html/wordpress

# wp-cli core config --dbname=${MYSQL_DATABASE} --dbuser=${MYSQL_USER} --dbpass=${MYSQL_PASSWORD} --dbhost=${MYSQL_HOST} --allow-root

wp-cli config create --dbname=${MYSQL_DATABASE} --dbuser=${MYSQL_USER} --dbpass=${MYSQL_PASSWORD} --dbhost=${MYSQL_HOST} --allow-root

wp-cli core install --url=${WORDPRESS_URL} --title=${WORDPRESS_TITLE} --admin_user=${WORDPRESS_USER} --admin_password=${WORDPRESS_PASS} --admin_email=${WORDPRESS_EMAIL} --allow-root

wp-cli user create ${WP_USER} ${UP_EMAIL} --role=${WP_ROLE} --user_pass=${WP_PASS} --allow-root

php-fpm7.3 -F
