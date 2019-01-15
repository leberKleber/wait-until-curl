#!/usr/bin/env sh

URL="${WUC_URL?Need to set WUC_URL}"
WRITE_OUT="${WUC_WRITE_OUT?Need to set WUC_WRITE_OUT}"
EXPECTED="${WUC_EXPECTED?Need to set WUC_EXPECTED}"
SLEEP_TIME=${WUC_SLEEP_TIME:=1}
MAX_ITERATIONS=${WUC_MAX_ITERATIONS:=-1}

CURL="curl -s -o /dev/null -w $WRITE_OUT $URL"
CURL_RESPONSE=$(${CURL})

counter=1

while [[ $CURL_RESPONSE != "$EXPECTED" ]]
do
    echo "expected value not reached given: '$CURL_RESPONSE', expected: '$EXPECTED'"

    if [[ "$MAX_ITERATIONS" != "-1" ]] && [[ "$counter" -ge "$MAX_ITERATIONS" ]]; then
        exit 1
    fi

    counter=$((counter+1))

    sleep ${SLEEP_TIME}

    CURL_RESPONSE=$(${CURL})
done
