#!/bin/sh

export LANG=C
PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin"

CONFIG_PATH=/data/options.json
MQTT_HOST="$(jq --raw-output '.mqtt_host' $CONFIG_PATH)"
MQTT_USER="$(jq --raw-output '.mqtt_user' $CONFIG_PATH)"
MQTT_PASS="$(jq --raw-output '.mqtt_password' $CONFIG_PATH)"
MQTT_TOPIC="$(jq --raw-output '.mqtt_topic' $CONFIG_PATH)"
PROTOCOL="$(jq --raw-output '.protocol' $CONFIG_PATH)"

# Start the listener and enter an endless loop
echo "Starting honeywell with parameters:"
echo "MQTT Host =" $MQTT_HOST
echo "MQTT User =" $MQTT_USER
echo "MQTT Password =" $MQTT_PASS
echo "MQTT Topic =" $MQTT_TOPIC

#set -x  ## uncomment for MQTT logging...

/usr/local/bin/honeywell | while read line
do
  # Create file with touch /tmp/honeywell.log if logging is needed
  [ -w /tmp/honeywell.log ] && echo $line >> honeywell.log
  echo $line | /usr/bin/mosquitto_pub -h $MQTT_HOST -u $MQTT_USER -P $MQTT_PASS -i honeywell-sensors -r -l -t $MQTT_TOPIC
done
