#!/bin/bash

if [ ! -d "var/lib/mysql/$SQL_DATABASE" ]
then
	echo "Lauching mysql setup script"

	sql_template=$(cat /tmp/init.sql)

	tmpfile=$(mktemp)

	chown mysql:mysql "$tmpfile"

	chmod 600 "$tmpfile"

	echo "$sql_template" | sed -e "s/SQL_DATABASE/$SQL_DATABASE/g" \
		-e "s/SQL_USER/$SQL_USER/g" \
		-e "s/SQL_PASSWORD/$SQL_PASSWORD/g" \
		-e "s/SQL_ROOT_PASSWORD/$SQL_ROOT_PASSWORD/g" > "$tmpfile"

	mysqld_safe --init-file="$tmpfile"
	rm "$tmpfile"
else
	echo "SQL_DATABASE found, exiting mariadb setup script..."
fi

exec mysqld_safe
