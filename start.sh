#!/bin/sh

echo "Updating CouchPotato..."
git -C /couchpotato fetch -q
git -C /couchpotato reset -q --hard origin/master
echo "[DONE]"

echo "Starting CouchPotato..."
exec /couchpotato/CouchPotato.py --data_dir=/data --config_file=/data/config.ini --console_log
