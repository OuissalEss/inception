FROM debian:buster

ARG MYSQL_USER
ARG MYSQL_PASSWORD
ARG MYSQL_DATABASE
ARG MYQL_ROOT_PASSWORD

ENV MYSQL_DATABASE=${MYSQL_DATABASE}
ENV MYSQL_USER=${MYSQL_USER}
ENV MYSQL_PASSWORD=${MYSQL_PASSWORD}
ENV MYQL_ROOT_PASSWORD=${MYQL_ROOT_PASSWORD}
RUN apt -y update && apt install mariadb-server -y

COPY ./tools/script.sh script.sh

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

RUN chmod +x script.sh

RUN bash ./script.sh

CMD ["mysqld"]
