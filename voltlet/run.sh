#!/bin/sh

export LANG=C
PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin"

CONFIG_PATH=/data/options.json
MQTT_BROKER="$(jq --raw-output '.mqtt_broker' $CONFIG_PATH)"
MQTT_USER="$(jq --raw-output '.mqtt_user' $CONFIG_PATH)"
MQTT_PASSWORD="$(jq --raw-output '.mqtt_password' $CONFIG_PATH)"

# Start the listener and enter an endless loop
echo "Starting voltlet with parameters:"
echo "MQTT Broker =" $MQTT_BROKER
echo "MQTT User =" $MQTT_USER
echo "MQTT Password =" $MQTT_PASSWORD

#set -x  ## uncomment for MQTT logging...

./voltlet -mqtt-broker $MQTT_BROKER -mqtt-user $MQTT_USER -mqtt-password $MQTT_PASSWORD
