#!/bin/bash -l

apt-get update
apt-get install -y curl jq

echo "sending slack ping..."
echo $INPUT_MESSAGE

CHANNEL='"channel": ''"'$INPUT_CHANNEL'",'
TEXT='"text": ''"'$INPUT_MESSAGE'"'

pwd 


MESSAGES= $(echo cat './messages.json' | jq -r .)

echo $MESSAGES
echo '{"fruit":{"name":"apple","color":"green","price":1.20}}' | jq '.'

echo $CHANNEL
echo $TEXT

curl --location --request POST "https://slack.com/api/chat.postMessage" \
--header "Content-Type: application/json" \
--header "Authorization: Bearer $INPUT_BEARER" \
--data-raw "{
    $CHANNEL
    $TEXT
}"

echo "ping sent..."