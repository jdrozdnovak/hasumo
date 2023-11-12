#!/usr/bin/with-contenv bashio

# Fetch configuration options
ACCESS_ID=$(bashio::config 'access_id')
ACCESS_KEY=$(bashio::config 'access_key')
COLLECTOR_NAME=$(bashio::config 'collector_name')

# Set up environment variables for Sumo Logic
export SUMO_ACCESS_ID=$ACCESS_ID
export SUMO_ACCESS_KEY=$ACCESS_KEY
export SUMO_COLLECTOR_NAME=$COLLECTOR_NAME

# Set the source JSON file path for Sumo Logic collector
COPY sumo-containers.json /etc/sumo-containers.json

export SUMO_SOURCES_JSON="/etc/sumo-containers.json"

# Start the Sumo Logic Collector
exec sumo-start -q
