FROM ubuntu:latest
FROM ruby:2.6.6

RUN apt-get update && apt-get upgrade -y

RUN apt install chromium-browser
RUN dpkg -i google-chrome-stable_current_amd64.deb


ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
