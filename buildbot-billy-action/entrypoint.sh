#!/bin/bash -l

apt-get update
apt-get install -y curl jq

echo "sending slack ping..."
echo $INPUT_MESSAGE

CHANNEL='"channel": ''"'$INPUT_CHANNEL'",'
TEXT='"text": ''"'$INPUT_MESSAGE'"'

MESSAGES='"status":{"success":"has completed successfully. :mav-sunnys:","failure":"has failed. :party-try-not-to-cry:","cancelled":"has been cancelled. :suspicious:"}' | jq '.status'

echo $MESSAGES

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