#! /bin/bash

cd /var/www/html/wordpress

sudo wp-cli  core install --url=${WORDPRESS_URL} --title=${WORDPRESS_TITLE} --admin_user=${WORDPRESS_USER} --admin_password=${WORDPRESS_PASS} --admin_email=${WORDPRESS_EMAIL} --allow-root

sudo wp-cli user create ${WP_USER} ${UP_EMAIL} --role=${WP_ROLE} --user_pass=${WP_PASS} --allow-root

php-fpm7.3 -F
