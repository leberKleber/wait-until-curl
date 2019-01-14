#!/usr/bin/env sh

URL="${WUC_URL?Need to set WUC_URL}"
WRITE_OUT="${WUC_WRITE_OUT?Need to set WUC_WRITE_OUT}"
EXPECTED="${WUC_EXPECTED?Need to set WUC_EXPECTED}"

CURL="curl -s -o /dev/null -w ''$WRITE_OUT'' $URL"
while [ "$($CURL)" != "$EXPECTED" ]
do
echo "expected value not reached"
sleep 1
done
