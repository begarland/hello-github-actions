FROM debian:jessie

RUN sudo apt-get update -y

RUN sudo apt-get install -y chromium-chromedriver

FROM ruby:2.6.6

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
