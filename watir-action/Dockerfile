FROM debian:latest

RUN sudo apt-get update
RUN sudo apt-get install -y curl unzip xvfb libxi6 libgconf-2-4

RUN sudo curl -sS -o - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN sudo echo "deb [arch=amd64]  http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list
RUN sudo apt-get -y update
RUN sudo apt-get -y install google-chrome-stable

RUN wget https://chromedriver.storage.googleapis.com/2.41/chromedriver_linux64.zip
RUN unzip chromedriver_linux64.zip

RUN sudo mv chromedriver /usr/bin/chromedriver
RUN sudo chown root:root /usr/bin/chromedriver
RUN sudo chmod +x /usr/bin/chromedriver

FROM ruby:2.6.6



ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
