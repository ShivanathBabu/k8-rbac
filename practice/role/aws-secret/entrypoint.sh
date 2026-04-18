#!/bin/bash
if [ -f /tmp/mysql_root_password.txt ]; then

password=$( cat /tmp/mysql_root_password.txt )
 echo "Accessed Root Password"
else
    echo "failed to access root password"
exit 1
fi 

export mysql_root_password=$password
rm -rf /tmp/mysql_root_password.txt
exec /entrypoint.sh mysqld