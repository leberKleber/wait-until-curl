# wait-until-curl
Dockerfile which wait until curl response become to expected value

## Example
```bash
 docker run --rm -e "WUC_EXPECTED=200" -e "WUC_WRITE_OUT=%{http_code}" -e "WUC_URL=http://myservice:8080/internal/health" --network "myservice_default" leberkleber/wait_until_curl
```