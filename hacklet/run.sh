#!/bin/bash
set -e

CONFIG_PATH=/data/options.json

# possible options for processing
MQTT_SERVER=$(jq --raw-output '.server' $CONFIG_PATH)
MQTT_PORT=$(jq --raw-output '.port' $CONFIG_PATH)
TOPIC=$(jq --raw-output '.topic' $CONFIG_PATH)
USER=$(jq --raw-output '.user' $CONFIG_PATH)
PASSWORD=$(jq --raw-output '.password' $CONFIG_PATH)

# read data
while read -r message
do
  action=$(echo $message | jq --raw-output '.action')
  network_id=$(echo $message | jq --raw-output '.network_id')
  socket_id=$(echo $message | jq --raw-output '.socket_id')
  if [ "$action" == "on" ]; then
    echo "ON"
    hacklet on -n $network_id -s $socket_id
  else
    echo "OFF"
    hacklet off -n $network_id -s $socket_id
  fi

done < <(mosquitto_sub -h "$MQTT_SERVER" -p "$MQTT_PORT" -u "$USER" -P "$PASSWORD" -t "$TOPIC" -q 1)
