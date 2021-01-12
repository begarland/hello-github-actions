#!/bin/sh -l

echo "starting"

pwd

cd $GITHUB_WORKSPACE/testDir/anotherDir

pwd

apt-get update
apt-get install -y unzip xvfb libxi6 libgconf-2-4 gnupg2

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