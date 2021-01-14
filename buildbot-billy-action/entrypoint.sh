#!/bin/bash -l

apt-get update
apt-get install -y wget


AUTH=`Authorization: Bearer $INPUT_BEARER`

wget --no-check-certificate --quiet \
  --method POST \
  --timeout=0 \
  --header 'Content-Type: application/json' \
  --header $AUTH \
  --body-data '{
    "channel": "U0149HC3PFV",
    "text": "hello world"
}' \
   'https://slack.com/api/chat.postMessage?'