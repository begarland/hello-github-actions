FROM ubuntu:trusty

RUN apt-get update && apt-get install -y \
curl


RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - 
RUN sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'

RUN sudo apt-get update 
RUN sudo apt-get install google-chrome-stable

# Install chromedriver for Selenium
RUN curl https://chromedriver.storage.googleapis.com/2.31/chromedriver_linux64.zip -o /usr/local/bin/chromedriver
RUN chmod +x /usr/local/bin/chromedriver


# FROM ruby:2.6.6

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
