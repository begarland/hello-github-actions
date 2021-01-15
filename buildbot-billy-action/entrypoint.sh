#!/bin/bash -l

apt-get update
apt-get install -y curl jq

echo "sending slack ping..."

CHANNELS_FILE='/channels.json'
CHANNELS=$(cat "$CHANNELS_FILE")

MESSAGES_FILE="/messages.json"
MESSAGES=$(cat "$MESSAGES_FILE")

USERS_FILE="/users.json"
USERS=$(cat "$USERS_FILE")

CHANNEL_ID=`echo $USERS | jq -r ".$INPUT_DEVELOPER.slack_id"`
STATUS_MESSAGE=`echo $MESSAGES | jq -r ".job.status.$INPUT_STATUS"`


[[ ! -z "$INPUT_CHANNEL" ]] && CHANNEL_ID=`echo $CHANNELS | jq ".$INPUT_CHANNEL"` || CHANNEL_ID=`echo $USERS | jq ".$INPUT_DEVELOPER.slack_id"`

FULL_MESSAGE="${STATUS_MESSAGE}\n${INPUT_MESSAGE}"
JSON_MESSAGE=$(echo $FULL_MESSAGE)

echo $JSON_MESSAGE

CHANNEL="'"'channel'"': $CHANNEL_ID," 
TEXT="'"'text'"': $JSON_MESSAGE" 

 
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