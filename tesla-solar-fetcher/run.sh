#!/usr/bin/env bashio

export EMAIL=$(bashio::config 'email')
export PASSWORD=$(bashio::config 'password')
INFLUXDB_URL=$(bashio::config 'influxdb_url')
INFLUXDB_DB=$(bashio::config 'influxdb_db')

# Keep it running if a specific run happens to fail
set +o errexit

bashio::log.info "Starting event listener..."
while read -r input; do
    bashio::log.info "Fetching"

    ./tesla-solar-fetcher >tmp-data
    curl -s -i -XPOST "${INFLUXDB_URL}/write?db=${INFLUXDB_DB}" --data-binary @tmp-data
    rm tmp-data

    bashio::log.info "Complete"
done
