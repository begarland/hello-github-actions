#!/bin/bash -l

apt-get update
apt-get install -y curl jq

echo "sending slack ping..."
echo $INPUT_MESSAGE




file="/messages.json"

MESSAGES=$(cat "$file")
STATUS_MESSAGE=$($MESSAGES | jq ".job.status.$INPUT_STATUS")

TEST = $(echo $STATUS_MESSAGE)


CHANNEL='"channel": ''"'$INPUT_CHANNEL'",'
TEXT='"text": ''" Your job '$STATUS_MESSAGE)'"'

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