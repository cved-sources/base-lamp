#!/bin/bash

if [[ $1 == "default" ]]; then
    /etc/init.d/mysql start
    mysqladmin -u root password "root"
    chown -R mysql:mysql /var/lib/mysql /var/run/mysqld
    mkdir -p /var/lock/apache2 /var/run/apache2 
    /etc/init.d/apache2 start
else
    /etc/init.d/mysql restart
    /etc/init.d/apache2 restart
fi

/usr/bin/tail -f /dev/null
