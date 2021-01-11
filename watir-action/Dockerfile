FROM debian:9.5-slim
FROM ruby:2.6.6

ADD apt-get install chromium-chromedriver

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
