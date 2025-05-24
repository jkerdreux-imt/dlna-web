#!/bin/bash


git clone https://github.com/jkerdreux-imt/dlna-web.git /opt/dlna-web
cd /opt/dlna-web/

/root/.local/bin/uv venv --seed
source .venv/bin/activate

pip install -r /opt/dlna-web/requirements.txt


