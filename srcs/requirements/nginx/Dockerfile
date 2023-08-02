FROM	debian:buster

RUN	apt update -y && apt upgrade -y

RUN	apt install nginx -y && apt install openssl -y

RUN	mkdir /etc/nginx/ssl

RUN	openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=diroyer.42.fr/UID=diroyer"

RUN	rm -f /etc/nginx/sites-enabled/default

COPY	conf/nginx.conf /etc/nginx/conf.d/

CMD	["nginx", "-g", "daemon off;"]
