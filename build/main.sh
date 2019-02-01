#!/bin/bash

/etc/init.d/mysql start
mysqladmin -u root password "root"

/etc/init.d/apache2 start

/usr/bin/tail -f /dev/null
