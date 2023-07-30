FROM	debian:buster

RUN	apt-get update -y && apt-get upgrade -y && apt install mariadb-server -y && \
        mkdir -p /var/run/mysqld && \
        chown -R mysql:mysql /var/run/mysqld && \
        chown -R mysql:mysql /etc/mysql/

##COPY	conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY	conf/my.cnf /etc/mysql/

COPY	tools/setup.sh /tmp/setup.sh

COPY	tools/init.sql /tmp/init.sql

RUN     chown -R mysql:mysql /tmp/

RUN	mkdir -p /run/mysqld
RUN	chown -R mysql:mysql /run/mysqld

##RUN	chown -R root:root /var/www/wordpress

USER	mysql

ENTRYPOINT	["sh", "/tmp/setup.sh"]

