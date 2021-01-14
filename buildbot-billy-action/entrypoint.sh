#!/bin/bash -l

apt-get update
apt-get install -y curl


AUTH=`Authorization: Bearer $INPUT_BEARER`

curl --location --request POST "https://slack.com/api/chat.postMessage" \
--header "Content-Type: application/json" \
--header $AUTH \
--data-raw '{
    "channel": "U0149HC3PFV",
    "text": "hello world"
}'