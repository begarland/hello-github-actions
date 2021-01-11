FROM ubuntu:trusty

RUN apt-get update; apt-get install curl


# Install Chrome for Selenium
RUN curl https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -o /chrome.deb
RUN dpkg -i /chrome.deb || apt-get install -yf
RUN rm /chrome.deb

# Install chromedriver for Selenium
RUN curl https://chromedriver.storage.googleapis.com/2.31/chromedriver_linux64.zip -o /usr/local/bin/chromedriver
RUN chmod +x /usr/local/bin/chromedriver


FROM ruby:2.6.6

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
