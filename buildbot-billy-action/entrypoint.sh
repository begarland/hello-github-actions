#!/bin/sh -l

apt-get update
apt-get install -y curl

curl --location --request POST 'https://slack.com/api/chat.postMessage' \
--header 'Content-Type: application/json' \
--header 'Authorization: Bearer $INPUT_BEARER' \
--data-raw '{
    "channel": "U0149HC3PFV",
    "text": $INPUT_MESSAGE
}'