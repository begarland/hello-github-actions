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

[[ ! -z "$INPUT_STATUS" ]] && STATUSES=( $INPUT_STATUS ) || STATUSES=" "


HAS_SUCCEEDED=true
OVERALL_STATUS=" "

echo $STATUSES
echo $INPUT_STATUS

for STATUS in "${STATUSES[@]}"
do 
    echo "in the do loop" $STATUS

    if [[ "$STATUS" != "success" ]]; then 
        HAS_SUCCEEDED=false
        echo "status is not success $STATUS"

        if [[ "$STATUS" =~ "failure" ]]; then
            OVERALL_STATUS="failure"
            echo "we have a failure"
        fi
        
        if [[ "$STATUS" =~ "cancelled" ]]; then
            OVERALL_STATUS="cancelled"
        fi
    fi
done

STATUS_MESSAGE=" "

[[ ! -z "$INPUT_STATUS" ]] && SHOW_STATUS=true || SHOW_STATUS=false

if $HAS_SUCCEEDED; then 
    OVERALL_STATUS="success"
fi

if $SHOW_STATUS; then 
    STATUS_MESSAGE=`echo $MESSAGES | jq -r ".job.status.$OVERALL_STATUS"`
fi

[[ ! -z "$INPUT_CHANNEL" ]] && CHANNEL_ID=`echo $CHANNELS | jq ".$INPUT_CHANNEL"` || CHANNEL_ID=`echo $USERS | jq ".$INPUT_DEVELOPER.slackId"`

[[ ! -z "$INPUT_MESSAGE" ]] && MSG="\n$INPUT_MESSAGE" || MSG="$INPUT_MESSAGE" 

[[ ! -z "$INPUT_HIDE_PR_DETAILS" ]] && PR=" " || PR="\nView your pull request here: $INPUT_PR_LINK"

[[ ! -z "$INPUT_CHANNEL" ]] && SEND_PING=true || SEND_PING=`echo $USERS | jq ".$INPUT_DEVELOPER.sendDm"`

FULL_MESSAGE="
$JOB $STATUS_MESSAGE
$MSG
$PR
"

CHANNEL="'"'channel'"': $CHANNEL_ID," 
TEXT="'"'text'"': '"$FULL_MESSAGE"'"

if $SEND_PING; then
curl --location --request POST "https://slack.com/api/chat.postMessage" \
--header "Content-Type: application/json" \
--header "Authorization: Bearer $INPUT_BEARER" \
--data-raw "{
    $CHANNEL
    $TEXT
}"
echo "ping sent..."

fi



