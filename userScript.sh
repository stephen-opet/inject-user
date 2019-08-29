#!/bin/bash

sed -i s/databasename/$(cat wp-config.php | grep DB_NAME | cut -d \' -f 4)/g sql.txt

sed -i s/wp_/$(cat wp-config.php | grep table_prefix | cut -d \' -f 2)/g sql.txt

sed -i s/mypass/$(tr -cd '[:alnum:]' < /dev/urandom | fold -w30 | head -n1)/g sql.txt

cat sql.txt | grep MD5 | cut -d \' -f 6

