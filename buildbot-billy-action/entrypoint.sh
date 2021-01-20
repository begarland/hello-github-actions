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

[[ ! -z "$INPUT_STATUS" ]] && STATUSES=( $INPUT_STATUS ) || STATUSES=false


HAS_SUCCEEDED=true
OVERALL_STATUS=" "

for STATUS in $STATUSES
do 
    if [ "$STATUS" != "success" ]; then 
        HAS_SUCCEEDED= false

        if [ "$STATUS" =~ "failure" ]; then
            OVERALL_STATUS="failure"
        fi
        
        if [ "$STATUS" =~ "cancelled" ]; then
            OVERALL_STATUS="cancelled"
        fi
    fi
done

STATUS_MESSAGE=" "

if [ $HAS_SUCCEEDED && [[ ! -z "$INPUT_STATUS" ]] ]; then 
    OVERALL_STATUS="success"
    STATUS_MESSAGE=`echo $MESSAGES | jq -r ".job.status.$OVERALL_STATUS"`
fi

# if we are provided a status string, assume it succeeded
# [[ ! -z "$INPUT_STATUS" ]] &&  || STATUS_MESSAGE=" "

# # if there are any failures, we set the status message to failed
# if [[ $INPUT_STATUS =~ "failure" ]]; then
#    STATUS_MESSAGE=`echo $MESSAGES | jq -r ".job.status.failure"`
# fi

# # if there are any cancelled, we set the status message to cancelled
# if [[ $INPUT_STATUS =~ "cancelled" ]]; then
#    STATUS_MESSAGE=`echo $MESSAGES | jq -r ".job.status.cancelled"`
# fi

[[ ! -z "$INPUT_CHANNEL" ]] && CHANNEL_ID=`echo $CHANNELS | jq ".$INPUT_CHANNEL"` || CHANNEL_ID=`echo $USERS | jq ".$INPUT_DEVELOPER.slack_id"`

[[ ! -z "$INPUT_MESSAGE" ]] && MSG="\n$INPUT_MESSAGE" || MSG="$INPUT_MESSAGE" 

[[ ! -z "$INPUT_HIDE_PR_DETAILS" ]] && PR=" " || PR="\nView your pull request here: $INPUT_PR_LINK"

[[ ! -z "$INPUT_CHANNEL" ]] && SEND_PING=true || SEND_PING=`echo $USERS | jq ".$INPUT_DEVELOPER.send_dm"`

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



