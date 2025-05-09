#!bin/bash

if [ ! -e "/var/www/wordpress/wp-config.php" ]
then
	echo "Starting WP download..."

	while [ ! nc -zv mariadb.srcs_inception 3306 2>&1 | grep -q 'open'] 
	do
		echo "Waiting for mariadb..."
		sleep 1
	done

	echo "Connexion to mariadb established..."

	wp core download --path=/var/www/wordpress 

	wp config create --path=/var/www/wordpress --dbname=wordpress --dbuser=$SQL_USER --dbpass=$SQL_PASSWORD --dbhost=mariadb 

	wp core install --path=/var/www/wordpress --url="diroyer.42.fr" --title="Inception" \
		--admin_user=$SQL_USER --admin_password=$SQL_PASSWORD \
		--admin_email=$ADMIN_MAIL 

	wp user create --path=/var/www/wordpress $WP_USER $WP_MAIL --user_pass=$WP_PASSWORD --role=subscriber 

else
	echo "wp-config.php found..."
fi

echo "Lauching PHP-FPM..."
exec "$@"
