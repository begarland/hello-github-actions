FROM debian:9.5-slim
FROM ruby:2.6.6

RUN apk update && apk upgrade \
    && echo @latest-stable http://nl.alpinelinux.org/alpine/latest-stable/community >> /etc/apk/repositories \
    && echo @latest-stable http://nl.alpinelinux.org/alpine/latest-stable/main >> /etc/apk/repositories \
    && echo @edge-testing http://dl-cdn.alpinelinux.org/alpine/edge/testing >> /etc/apk/repositories \
    && echo @edge-main http://dl-cdn.alpinelinux.org/alpine/edge/main >> /etc/apk/repositories

# install chromium
RUN apk add --no-cache chromium-chromedriver
RUN apk add --no-cache chromium@latest-stable
RUN apk add --no-cache harfbuzz@latest-stable
RUN apk add --no-cache nss@latest-stable


ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
