#!/bin/sh
set -e

# Fix permissions on the drawings directory
# This is necessary because the bind mount might be owned by root or another user on the host
if [ -d "/app/drawings" ]; then
    echo "Fixing permissions for /app/drawings..."
    chown -R node:node /app/drawings
fi

# Switch to 'node' user and run the command
exec su-exec node "$@"
