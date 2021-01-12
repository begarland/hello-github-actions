FROM debian:9.5-slim

RUN apt-get update && apt-get upgrade -y

RUN apt install chromium
RUN dpkg -i google-chrome-stable_current_amd64.deb

FROM ruby:2.6.6

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
