#!/bin/sh

export NUODB_ROOT=/home/build/dbt2-test/nuodb
export NUODB_INCLUDE_DIR=${NUODB_ROOT}/include
export NUODB_LIB_DIR=${NUODB_ROOT}/lib64
export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:${NUODB_LIB_DIR}

echo "dbt2-nuodb-start-db -f"
echo "dbt2-nuodb-load-db -w 20 -g"
echo "dbt2-nuodb-stop-db"

echo "dbt2-run-workload -a nuodb -c 20 -d 300 -w 3 -o /home/build/dbt2-test/log/nuodb.out -n yes"

