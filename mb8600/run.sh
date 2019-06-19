#!/bin/sh

export LANG=C
PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin"

CONFIG_PATH=/data/options.json
INFLUXDB_ADDRESS=$(jq --raw-output '.influxdb_address' $CONFIG_PATH)
INFLUXDB_DATABASE=$(jq --raw-output '.influxdb_database' $CONFIG_PATH)

cd /
./mb8600 -influxdb-address $INFLUXDB_ADDRESS -influxdb-database $INFLUXDB_DATABASE

