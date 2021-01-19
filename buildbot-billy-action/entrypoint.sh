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


[[ ! -z "$INPUT_JOB_NAME" ]] && JOB="$INPUT_JOB_NAME" || JOB=" "

[[ ! -z "$INPUT_STATUS" ]] && STATUS_MESSAGE=`echo $MESSAGES | jq -r ".job.status.$INPUT_STATUS"` || STATUS_MESSAGE=" "

[[ ! -z "$INPUT_CHANNEL" ]] && CHANNEL_ID=`echo $CHANNELS | jq ".$INPUT_CHANNEL"` || CHANNEL_ID=`echo $USERS | jq ".$INPUT_DEVELOPER.slack_id"`

[[ ! -z "$INPUT_MESSAGE" ]] && MSG="\n$INPUT_MESSAGE" || MSG="$INPUT_MESSAGE" 

[[ ! -z "$INPUT_HIDE_PR_DETAILS" ]] && PR=" " || PR="\nView your pull request here: $INPUT_PR_LINK"



FULL_MESSAGE="
$JOB $STATUS_MESSAGE
$MSG
$PR
"

CHANNEL="'"'channel'"': $CHANNEL_ID," 
TEXT="'"'text'"': '"$FULL_MESSAGE"'"


curl --location --request POST "https://slack.com/api/chat.postMessage" \
--header "Content-Type: application/json" \
--header "Authorization: Bearer $INPUT_BEARER" \
--data-raw "{
    $CHANNEL
    $TEXT
}"

echo "ping sent..."