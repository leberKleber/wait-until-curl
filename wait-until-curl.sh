#!/usr/bin/env sh

URL="${WUC_URL?Need to set WUC_URL}"
WRITE_OUT="${WUC_WRITE_OUT?Need to set WUC_WRITE_OUT}"
EXPECTED="${WUC_EXPECTED?Need to set WUC_EXPECTED}"

CURL="curl -s -o /dev/null -w $WRITE_OUT $URL"
CURL_RESPONSE=$($CURL)
while [ $CURL_RESPONSE != "$EXPECTED" ]
do
    echo "expected value not reached given: '$CURL_RESPONSE', expected: '$EXPECTED'"
    sleep 1
    CURL_RESPONSE=$($CURL)
done
