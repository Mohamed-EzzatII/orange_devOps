
#######################################################
# nginx proxy server create 
#######################################################
FROM nginx:alpine AS nginx_stage
RUN apk add --no-cache openssl bash

COPY ./nginx/generate-ssl.sh /

RUN chmod +x generate-ssl.sh
COPY ./nginx/nginx.conf /etc/nginx/nginx.conf

CMD ["/bin/bash", "-c", "./generate-ssl.sh && nginx -g 'daemon off;'"]

EXPOSE 443

#######################################################
# backend server create 
#######################################################
FROM golang:1.19 AS backend_stage

WORKDIR /app

COPY ./backend .
RUN go mod download

RUN CGO_ENABLED=0 GOOS=linux go build -o /backend