FROM ruby:2.6.6

RUN apt-get add --update --no-cache build-base libffi-dev ruby-dev ruby-rdoc zlib-dev chromium-chromedriver ruby-webrick

# Installs latest stable Chromium package.
RUN apt-get update && apt-get upgrade \
    && echo @latest-stable http://nl.alpinelinux.org/alpine/latest-stable/community >> /etc/apk/repositories \
    && echo @latest-stable http://nl.alpinelinux.org/alpine/latest-stable/main >> /etc/apk/repositories \
    && apt-get add --no-cache \
    chromium@latest-stable \
    nss@latest-stable \
    && rm -rf /var/lib/apt/lists/* \
    /var/cache/apk/* \
    /usr/share/man \
    /tmp/*

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
