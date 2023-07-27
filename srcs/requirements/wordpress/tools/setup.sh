#!bin/bash

if [ ! -e "/var/www/wordpress/wp-config.php" ]; then
	sleep 10

	wp core download --path=/var/www/wordpress --allow-root

	wp config create --path=/var/www/wordpress --dbname=wordpress --dbuser=$SQL_USER --dbpass=$SQL_USER_PASSWORD --dbhost=mariadb --allow-root


	wp core install --path=/var/www/wordpress --url="diroyer.42.fr" --title="elephant de grabouilli" --admin_user=$SQL_USER --admin_password=$SQL_USER_PASSWORD --admin_email=elon.musk@yahoo.fr --allow-root

	wp user create --path=/var/www/wordpress thomas thomas@exemple.com --user_pass=pass --role=editor --allow-root

else
	sleep 3
	echo Wordpress already installed, installation step skipped
fi

exec php-fpm7.3 -F -R --nodaemonize
##
##if [ ! -f /var/www/wordpress/wp-config.php ]
##then
##	wp core download --path=$WP_PATH --allow-root
##	wp config create --dbname=$SQL_DATABASE --dbuser=$SQL_USER --dbpass=$SQL_PASSWORD --dbhost=mariadb --path=$WP_PATH --skip-check --allow-root
##	wp core install --path=$WP_PATH --url=$DOMAIN_NAME --title=$WP_TITLE --admin_user=$WP_USER --admin_password=$WP_PASSWORD --admin_email=$WP_EMAIL --skip-email --allow-root
##	wp user create terry terry@davis --role=author --path=$WP_PATH --user_pass=123 --allow-root
##fi
##
##/usr/sbin/php-fpm7.3 -F
