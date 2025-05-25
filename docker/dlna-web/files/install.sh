#!/bin/bash

echo "Install Python 3.8 w/ uv"
pipx install uv
~/.local/bin/uv python install 3.8
~/.local/bin/uv python pin 3.8

echo "Install dlna-web"
git clone https://github.com/jkerdreux-imt/dlna-web.git /opt/dlna-web
cd /opt/dlna-web/

~/.local/bin/uv venv --seed
source .venv/bin/activate

pip install -r /opt/dlna-web/requirements.txt


