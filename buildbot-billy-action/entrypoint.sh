#!/bin/bash -l

apt-get update
apt-get install -y curl


DATA="{
    'channel': '$INPUT_CHANNEL', 
    'text': 'hello world'
}"

curl --location --request POST "https://slack.com/api/chat.postMessage" \
--header "Content-Type: application/json" \
--header "Authorization: Bearer $INPUT_BEARER" \
--data-raw $DATA

echo "message"