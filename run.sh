#!/bin/bash

DBMS=$1

WAREHOUSES=${WAREHOUSES:-1}
TARGET=${TARGET:-1}
CONNECTIONS=${CONNECTIONS:-20}
DURATION=${DURATION:-60}
RESULTS=/tmp/dbt2/results

rm -fr $RESULTS

PARAMS="-c ${CONNECTIONS} -d ${DURATION} -w ${WAREHOUSES} -a ${TARGET} -b ${TARGET} \
-o ${RESULTS} -D oleg -n"

case $DBMS in
	nuodb)
		shift 1
		LD_LIBRARY_PATH=/home/olevin/nimbusdb/Remote \
			targets/nuodb/bin/dbt2-run-location -u cloud -p user ${PARAMS}
		;;

	mysql)
		shift 1
		targets/nuodb/bin/dbt2-run-location -u olevin -p merlin ${PARAMS}
		;;
esac
