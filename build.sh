#!/bin/bash

DBMS=${1:-nuodb}

export NUODB_INCLUDE_DIR=/home/olevin/nimbusdb/Remote
export NUODB_LIB_DIR=/home/olevin/nimbusdb/Remote
cmake -G "Unix Makefiles" -DDBMS=${DBMS} -DCMAKE_INSTALL_PREFIX:PATH=$(dirname $0)/targets/${DBMS} -DCMAKE_BUILD_TYPE=Debug -DNONSP=0

make
make install
