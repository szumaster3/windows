#!/usr/bin/env bash

# Usage: ./start-client.sh [path_to_java]
# If path_to_java is not provided, the script will use the default java command.

export _JAVA_OPTIONS=
SCRIPT_DIR=$(cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P)
JAVA_CMD=${1:-java}

lsof -i:43595 > /dev/null
if [ $? -ne 0 ]; then
  echo "No server detected on port 43595. The client may not connect."
  read -p "Do you still want to start the client? (y/n): " choice
  if [[ "$choice" != "y" ]]; then
    echo "Client startup canceled."
    exit 0
  fi
fi

cd "$SCRIPT_DIR/game"
echo "Launching client..."
$JAVA_CMD -Xmx1G -Xms1G -jar client.jar