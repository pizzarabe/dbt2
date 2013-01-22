#!/bin/sh

export PATH=$PATH:/home/build/dbt2/bin:/home/build/dbt2/bin/mysql:/etc/my.cnf
export DBT2DATADIR=/var/lib/mysql

echo "dbt2-datagen -w 20 -d /home/build/dbt2-test/data --mysql"
echo "dbt2-mysql-build-db -d test -f /home/build/dbt2-test/data -v -w 20 -p /etc/my.sql -s /var/lib/mysql/mysql.sock -h localhost -u root -P nuotest -v"
echo "dbt2-mysql-load-stored-procs -d test -f /home/build/dbt2/storedproc/mysql/ -s /var/lib/mysql/mysql.sock -h localhost -u root -x nuotest -v"

echo Run the following as root:
echo "dbt2-run-workload -a mysql -c 20 -d 300 -w 3 -H localhost -o /home/build/dbt2-test/log/results.out -S /var/lib/mysql/mysql.sock -p /etc/my.cnf -H localhost -D test -u root -x nuotest -n yes -v"

