FROM debian:buster

RUN apt update && apt install -y nginx openssl

RUN mkdir /etc/nginx/ssl

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/nginx.key -out /etc/nginx/ssl/nginx.crt -subj "/C=MA/ST=BG/L=BG/O=MA/OU=IT/CN=oessamdi.42.fr"

RUN mv /var/www/html/index.nginx-debian.html /var/www/html/index.html

COPY ./conf/default /etc/nginx/sites-enabled/default

CMD ["nginx", "-g", "daemon off;"]