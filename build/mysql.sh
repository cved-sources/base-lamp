#!/bin/bash

/etc/init.d/mysql start
chown -R mysql:mysql /var/lib/mysql /var/run/mysqld
mysqladmin -u root password "root"

