FROM alpine:latest

RUN apk add --update --no-cache build-base libffi-dev ruby-dev ruby-rdoc zlib-dev chromium-chromedriver ruby-webrick

# Installs latest stable Chromium package.
RUN apk update && apk upgrade \
    && echo @latest-stable http://nl.alpinelinux.org/alpine/latest-stable/community >> /etc/apk/repositories \
    && echo @latest-stable http://nl.alpinelinux.org/alpine/latest-stable/main >> /etc/apk/repositories \
    && apk add --no-cache \
    chromium@latest-stable \
    nss@latest-stable \
    && rm -rf /var/lib/apt/lists/* \
    /var/cache/apk/* \
    /usr/share/man \
    /tmp/*

FROM ruby:2.6.6

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
