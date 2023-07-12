#!/bin/bash

if [ ! -d "var/lib/mysql/$SQL_DATABASE" ]
then
	service mysql start;

	sql_template=$(cat init.sql)

	tmpfile=$(mktemp)

	echo "$sql_template" | sed -e "s/SQL_DATABASE/$SQL_DATABASE/g" \
		-e "s/SQL_USER/$SQL_USER/g" \
		-e "s/SQL_PASSWORD/$SQL_PASSWORD/g" \
		-e "s/SQL_ROOT_PASSWORD/$SQL_ROOT_PASSWORD/g" > "$tmpfile"

	mysql < "$tmpfile"
	rm "$tmpfile"
fi
