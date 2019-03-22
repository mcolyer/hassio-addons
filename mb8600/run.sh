#!/bin/sh

export LANG=C
PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin"

CONFIG_PATH=/data/options.json

#set -x  ## uncomment for MQTT logging...

cd modem-statistics/models/mb8600/
cp $CONFIG_PATH config.json
node server.js
