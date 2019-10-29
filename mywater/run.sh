#!/usr/bin/env bashio

export USERNAME=$(bashio::config 'username')
export PASSWORD=$(bashio::config 'password')
INFLUXDB_URL=$(bashio::config 'influxdb_url')
INFLUXDB_DB=$(bashio::config 'influxdb_db')

bashio::log.info "Starting event listener..."
while read -r input; do
    bashio::log.info "Fetching"

    ./mywater 2>/dev/null > data
    curl -i -XPOST '${INFLUXDB_URL}/write?db=${INFLUXDB_DB}' --data-binary @data
    rm data

    bashio::log.info "Complete"
done
