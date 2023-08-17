FROM debian:buster

RUN apt -y update && apt install mariadb-server -y

COPY ./tools/scripte.sh /tmp/

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

RUN chmod +x /tmp/scripte.sh

RUN /tmp/scripte.sh

CMD ["mysqld"]