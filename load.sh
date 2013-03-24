#!/bin/bash

DBMS=${1:-nuodb}
WAREHOUSES=${WAREHOUSES:-1}

PARAMS="-N -w ${WAREHOUSES} -g -v"

case $DBMS in
	nuodb)
		targets/nuodb/bin/dbt2-nuodb-load-db ${PARAMS}
		;;

	mysql)
		targets/mysql/bin/dbt2-mysql-build-db ${PARAMS} -d oleg -f /tmp/dbt2 -h localhost -u olevin -P merlin -l
		targets/mysql/bin/dbt2-mysql-load-stored-procs -d oleg -f $(dirname $0)/storedproc/mysql -u olevin -x merlin
		;;	
esac
