#!/usr/bin/env bashio

USERNAME=$(bashio::config 'username')
PASSWORD=$(bashio::config 'password')
INFLUXDB_URL=$(bashio::config 'influxdb_url')
INFLUXDB_DB=$(bashio::config 'influxdb_db')

bashio::log.info "Starting event listener..."
while read -r input; do
    bashio::log.info "Fetching for $(date -v "-1d" +"%m/%d/%Y")"

    DATE=$(date -v "-1d" +"%m/%d/%Y") ./mywater-fetch 2>/dev/null > data
    curl -i -XPOST '${INFLUXDB_URL}/write?db=${INFLUXDB_DB}' --data-binary @data
    rm data

    bashio::log.info "Complete"
done
