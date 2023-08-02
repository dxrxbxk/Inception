#!/bin/bash

if [ ! -d "var/lib/mysql/$SQL_DATABASE" ]
then
	echo "Lauching mysql setup script"

	sql_template=$(cat /tmp/init.sql)

	tmpfile=$(mktemp)

	chown mysql:mysql "$tmpfile"

	chmod 600 "$tmpfile"

	envsubst < /tmp/init.sql > "$tmpfile"
else
	echo "SQL_DATABASE found, exiting mariadb setup script..."
fi

exec mysqld_safe --init-file="$tmpfile"
