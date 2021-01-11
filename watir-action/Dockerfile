FROM ubuntu:latest
FROM ruby:2.6.6

ENV APP_BUNDLE_BIN /workarea/docker/bin

RUN apt-get update \
 && apt-get install -yqq curl gnupg \
 && curl -sS -o - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
 && echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list \
 && curl -sL https://deb.nodesource.com/setup_13.x | bash - \
 && apt-get update \
 && apt-get install -yqq --no-install-recommends \
    google-chrome-stable \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*



ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
