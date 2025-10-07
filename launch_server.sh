#!/usr/bin/env bash

# Usage: ./start-server.sh [path_to_java]
# If path_to_java is not provided, the script will use the default java command.

export _JAVA_OPTIONS=
SCRIPT_DIR=$(cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P)
FIRST_RUN=1

JAVA_CMD=${1:-java}

lsof -i:43595 > /dev/null
if [ $? -eq 0 ]; then
  echo "Something is already listening on port 43595. Cannot start the server."
  exit 1
fi

if [ -f "$SCRIPT_DIR/game/data/eco/grandexchange.db" ]; then
  FIRST_RUN=0
else
  echo "Server is starting, please wait..."
  sleep 3
fi

cd "$SCRIPT_DIR/game"
echo "Launching server..."
$JAVA_CMD -Xmx2G -Xms2G -jar server.jar