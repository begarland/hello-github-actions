#!/bin/bash -l

apt-get update
apt-get install -y curl jq

echo "sending slack ping..."

MESSAGES_FILE="/messages.json"
MESSAGES=$(cat "$MESSAGES_FILE")

USERS_FILE="/users.json"
USERS=$(cat "$USERS_FILE")

CHANNEL_ID=`echo $USERS | jq ".$INPUT_DEVELOPER.slack_id"`

echo CHANNEL_ID

STATUS_MESSAGE=`echo $MESSAGES | jq ".job.status.$INPUT_STATUS"`

CHANNEL='"channel": ''"'$CHANNEL_ID'",'
TEXT="'"'text'"': $STATUS_MESSAGE" 

curl --location --request POST "https://slack.com/api/chat.postMessage" \
--header "Content-Type: application/json" \
--header "Authorization: Bearer $INPUT_BEARER" \
--data-raw "{
    $CHANNEL
    $TEXT
}"

echo "ping sent..."