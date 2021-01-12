#!/bin/sh -l

echo "starting"

pwd

cd $GITHUB_WORKSPACE/testDir/anotherDir

pwd

apt-get update
apt-get install -y curl unzip xvfb libxi6 libgconf-2-4 gnupg2

curl -sS -o - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
echo "deb [arch=amd64]  http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list
apt-get -y update
apt-get -y install google-chrome-stable

wget https://chromedriver.storage.googleapis.com/2.41/chromedriver_linux64.zip
unzip chromedriver_linux64.zip

mv chromedriver /usr/bin/chromedriver
chown root:root /usr/bin/chromedriver
chmod +x /usr/bin/chromedriver

gem install bundler

bundle config https://gems.weblinc.com
bundle install --deployment

chmod +x $GITHUB_WORKSPACE/testDir/anotherDir/test.sh	
sh -c $GITHUB_WORKSPACE/testDir/anotherDir/test.sh	

echo "done!"