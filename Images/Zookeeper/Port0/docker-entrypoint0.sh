#!/bin/bash

set -e

# Allow the container to be started with `--user`
if [ "$1" = 'zkServer.sh' -a "$(id -u)" = '0' ]; then
    chown -R "$ZOO_USER" "$ZOO_DIR_DATA" "$ZOO_DIR_LOG"
    exec su-exec "$ZOO_USER" "$0" "$@"
fi

# Generate the config only if it doesn't exist
if [ ! -f "$ZOO_DIR_CONF/zoo.cfg" ]; then
    CONFIG="$ZOO_DIR_CONF/zoo.cfg"

    echo "clientPort=$ZOO_PORT_CLIENT" >> "$CONFIG"
    echo "dataDir=$ZOO_DIR_DATA" >> "$CONFIG"
    echo "dataLogDir=$ZOO_DIR_LOG" >> "$CONFIG"

    echo "tickTime=$ZOO_TICK_TIME" >> "$CONFIG"
    echo "initLimit=$ZOO_INIT_LIMIT" >> "$CONFIG"
    echo "syncLimit=$ZOO_SYNC_LIMIT" >> "$CONFIG"

    for server in $ZOO_SERVERS; do
        echo "$server" >> "$CONFIG"
    done
fi

# Write myid only if it doesn't exist
if [ ! -f "$ZOO_DIR_DATA/myid" ]; then
    echo "${ZOO_MY_ID:-1}" > "$ZOO_DIR_DATA/myid"
fi

exec "$@"
