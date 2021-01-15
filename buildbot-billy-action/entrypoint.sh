#!/bin/bash -l

apt-get update
apt-get install -y curl jq

echo "sending slack ping..."
echo $INPUT_MESSAGE

CHANNEL='"channel": ''"'$INPUT_CHANNEL'",'
TEXT='"text": ''"'$INPUT_MESSAGE'"'

STATUS_MESSAGE = ".job.status.$INPUT_STATUS"

file="/messages.json"

MESSAGES=$(cat "$file")
echo $MESSAGES

echo $MESSAGES | jq "$STATUS_MESSAGE"

echo '{"fruit":{"name":"apple","color":"green","price":1.20}}' | jq '.fruit'

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