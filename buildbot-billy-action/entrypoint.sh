#!/bin/bash -l

apt-get update
apt-get install -y curl 

CHANNEL='"channel": ''"'$INPUT_CHANNEL'",'
TEXT='"text": ''"'$INPUT_MESSAGE'"'

echo $CHANNEL
echo $TEXT

curl --location --request POST "https://slack.com/api/chat.postMessage" \
--header "Content-Type: application/json" \
--header "Authorization: Bearer $INPUT_BEARER" \
--data-raw "{
    $CHANNEL
    "text": "hello world"
}'

echo "message"