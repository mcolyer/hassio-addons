#!/usr/bin/env bashio


export INFLUXDB_URL="$(bashio::config 'influxdb_url')"
export INFLUXDB_DB="$(bashio::config 'influxdb_db')"
export PGE_BULK_ID="$(bashio::config 'pge_bulk_id')"
export PGE_CLIENT_ID="$(bashio::config 'pge_client_id')"
export PGE_CLIENT_SECRET="$(bashio::config 'pge_client_secret')"
export SSL_CERT="$(bashio::config 'ssl_cert')"
export SSL_KEY="$(bashio::config 'ssl_key')"

bashio::log.info "Starting server"

./pge-sharemydata
