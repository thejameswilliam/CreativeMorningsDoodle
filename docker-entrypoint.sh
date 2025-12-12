#!/bin/sh
set -e

# Fix permissions on the drawings directory
if [ -d "/app/drawings" ]; then
    echo "Fixing permissions for /app/drawings..."
    chown -R node:node /app/drawings
    chmod -R 777 /app/drawings
fi

# Switch to 'node' user and run the command
exec su-exec node "$@"
