#!/bin/bash

echo "Starting DLNA-web Server \"$SERVER_PATH\" "

cd /opt/dlna-web/
echo "SERVER_PATH = \"$SERVER_PATH\"" > src/config.py

source .venv/bin/activate
python src/app.py

