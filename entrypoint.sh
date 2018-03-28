#!/bin/bash -xe

MATTERMOST_URL=${MATTERMOST_URL:-http://mattermost.example.com:8086}
MATTERMOST_TOKEN=${MATTERMOST_TOKEN:-api_token}
MATTERMOST_USER=${MATTERMOST_USER:-user}
MATTERMOST_PASSWORD=${MATTERMOST_PASSWORD:-password}
PORT=${PORT:-8505}

CONFIG=config.json

jq ".listen = \"0.0.0.0:${PORT}\"" $CONFIG > $CONFIG.tmp && mv $CONFIG.tmp $CONFIG
jq ".host = \"${MATTERMOST_URL}\"" $CONFIG > $CONFIG.tmp && mv $CONFIG.tmp $CONFIG
jq ".token = \"${MATTERMOST_TOKEN}\"" $CONFIG > $CONFIG.tmp && mv $CONFIG.tmp $CONFIG
jq ".user.id = \"${MATTERMOST_USER}\"" $CONFIG > $CONFIG.tmp && mv $CONFIG.tmp $CONFIG
jq ".user.password = \"${MATTERMOST_PASSWORD}\"" $CONFIG > $CONFIG.tmp && mv $CONFIG.tmp $CONFIG

./matterpoll-emoji
