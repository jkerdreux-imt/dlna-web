#!/bin/bash

echo "Starting DLNA-web Server"

cd /opt/dlna-web/
source .venv/bin/activate
python src/app.py

