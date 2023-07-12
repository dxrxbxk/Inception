FROM	debian:buster

RUN	apt-get update -y && apt-get upgrade -y && apt install mariadb-server -y

COPY	conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY	tools/setup.sh /tmp/setup.sh

COPY	tools/init.sql /tmp/init.sql

COPY	tools/.env /tmp/.env

#ENTRYPOINT ["sh", "/tmp/setup.sh"]

