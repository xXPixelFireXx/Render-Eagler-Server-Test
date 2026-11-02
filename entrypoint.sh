#!/bin/bash

# Substitute environment PORT into EaglerXBungee / BungeeCord listener config if present
if [ -f "config.yml" ]; then
  sed -i "s/host: 0.0.0.0:[0-9]*/host: 0.0.0.0:${PORT:-8080}/g" config.yml
fi

# Run the server with memory allocation tuned for Render free tier (512MB RAM)
exec java -Xmx400M -Xms256M -jar server.jar nogui
