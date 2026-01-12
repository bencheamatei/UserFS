#!/bin/bash

if [ ! -d "UserFS_Root" ]; then
	mkdir "UserFS_Root"
fi

echo  "Scriptul UserFS a pornit."

while true; do
	echo "Actualizare..."
	users=$(who | awk '{print $1}' | sort -u)

	for user in $users; do
	dir_user="UserFS_Root/$user"

	if [ ! -d "$dir_user" ]; then
		mkdir -p "$dir_user"
	fi

	ps -u "$user" > "$dir_user/procs"

	if [ -f "$dir_user/last_login" ]; then
		rm "$dir_user/last_login"
	fi
	done

	for dir in "UserFS_Root"/*; do
	[ -e "$dir" ] || continue

	basename_user=$(basename "$dir")

	if ! echo "$users" | grep -q "^$basename_user$"; then
		>"$dir/procs"
		date > "$dir/last_login"
	fi
	done

	sleep 30
done
