#!/bin/bash -l

apt-get update
apt-get install -y curl jq

echo "sending slack ping..."
echo $INPUT_MESSAGE

FILE="/messages.json"

MESSAGES=$(cat "$FILE")

STATUS_MESSAGE=`echo $MESSAGES | jq ".job.status.$INPUT_STATUS"`

CHANNEL='"channel": ''"'$INPUT_CHANNEL'",'
TEXT="'"'text'"': $STATUS_MESSAGE" 

curl --location --request POST "https://slack.com/api/chat.postMessage" \
--header "Content-Type: application/json" \
--header "Authorization: Bearer $INPUT_BEARER" \
--data-raw "{
    $CHANNEL
    $TEXT
}"

echo "ping sent..."