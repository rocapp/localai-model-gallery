#!/usr/bin/env bash

set -e

export LOCALAI=http://localhost:8080

ENDPOINT=${ENDPOINT:-images/generations}
PROMPT="${1}"
if [ -z "$PROMPT" ]; then
    echo 'you need to enter a prompt!' && exit 1
fi
SIZE=${SIZE:-1024x1024}

curl -v $LOCALAI/v1/${ENDPOINT} \
     -H 'Content-Type: application/json' \
     -d "{\"prompt\": \"${PROMPT}\", \"size\": \"${SIZE}\"}"
