FROM debian:buster

RUN apt update && apt install php wget php-fpm php-mysqli php-common curl unzip php-xml sudo -y

RUN wget https://wordpress.org/latest.tar.gz

RUN tar -xzvf latest.tar.gz

RUN chown -R www-data:www-data wordpress

RUN mkdir -p /var/www/html/

RUN mv ./wordpress /var/www/html/

# COPY ./conf/wp-config.php /var/www/html/wordpress

# RUN chmod 777 /var/www/html/wordpress/wp-config.php

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d

RUN mkdir -p /run/php

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar && mv wp-cli.phar /usr/bin/wp-cli

COPY ./tools/wp-installation.sh wp-installation.sh

RUN chmod +x wp-installation.sh

CMD ["./wp-installation.sh"]



