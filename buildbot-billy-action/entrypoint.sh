#!/bin/bash -l

apt-get update
apt-get install -y curl

echo 'HELLO WORLD'

echo 'Authorization: Bearer ${$INPUT_BEARER}'


echo $INPUT_BEARER

curl --location --request POST "https://slack.com/api/chat.postMessage" \
--header "Content-Type: application/json" \
--header 'Authorization: Bearer ${$INPUT_BEARER}' \
--data-raw '{
    "channel": "U0149HC3PFV",
    "text": "hello world"
}'