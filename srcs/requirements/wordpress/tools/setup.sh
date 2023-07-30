#!bin/bash

if [ ! -e "/var/www/wordpress/wp-config.php" ]
then
	echo "Starting WP download..."

	wp config create --path=/var/www/wordpress --dbname=wordpress --dbuser=$SQL_USER --dbpass=$SQL_PASSWORD --dbhost=mariadb --allow-root

	wp core install --path=/var/www/wordpress --url="diroyer.42.fr" --title="Mon Site" \
		--admin_user=$SQL_USER --admin_password=$SQL_PASSWORD \
		--admin_email=diroyer@student.42.fr --allow-root

	wp user create --path=/var/www/wordpress Eliot eliot@ecorp.com --user_pass=pass --role=editor --allow-root

else
	echo "wp-config.php found, exiting WP setup script..."
fi

##/usr/sbin/php-fpm7.3 -F
exec php-fpm7.3 -F -R 
