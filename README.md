# wait-until-curl
Dockerfile which wait until curl response become to expected value

## Environment Variables
`WUC_URL`

This is the url which would be called to check the truthiness of the expected valued. Can be prefixed with http or https.
e.g.:
- https://myService:8080/internal/health
- myService/health

`WUC_WRITE_OUT`

String which would be compared with the expected value (see: WUC_EXPECTED). Must be written in curl '--write-out' format. 
For more Information see https://manpages.debian.org/stretch/curl/curl.1.en.html#OPTIONS > --write-out.
e.g.:
- %{status_code}

`WUC_EXPECTED`

Value which expected as 'WUC_WRITE_OUT' result
e.g.:
- 200
- 201

`WUC_SLEEP_TIME`

Sleep time in seconds between requests. Default 1

`WUC_MAX_INTERATION`

Max retries to reach expected value


## Example
```bash
docker run --rm -e "WUC_EXPECTED=200" -e "WUC_WRITE_OUT=%{http_code}" -e "WUC_URL=http://myservice:8080/internal/health" --network "myservice_default" leberkleber/wait_until_curl
```