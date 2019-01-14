FROM alpine:latest
ADD ./wait-until-curl.sh .
RUN apk add curl

CMD ["./wait-until-curl.sh"]
