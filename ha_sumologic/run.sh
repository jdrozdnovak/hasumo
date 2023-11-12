#!/usr/bin/with-contenv bashio

# Fetch configuration options
ACCESS_ID=$(bashio::config 'access_id')
ACCESS_KEY=$(bashio::config 'access_key')
COLLECTOR_NAME=$(bashio::config 'collector_name')

# Set up environment variables for Sumo Logic
export SUMO_ACCESS_ID=$ACCESS_ID
export SUMO_ACCESS_KEY=$ACCESS_KEY
export SUMO_COLLECTOR_NAME=$COLLECTOR_NAME

# Mount Docker socket
DOCKER_SOCK="/var/run/docker.sock"
if [ -S "$DOCKER_SOCK" ]; then
    echo "Docker socket found"
else
    echo "Docker socket not found"
    exit 1
fi

# Start the Sumo Logic Collector
exec sumo-start -q
