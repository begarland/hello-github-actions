FROM debian:jessie
FROM ruby:2.6.6

RUN gem install selenium-webdriver 
RUN gem install watir-webdriver 

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
