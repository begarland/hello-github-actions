#!/bin/sh -l

echo "starting"

pwd

cd $GITHUB_WORKSPACE/testDir/anotherDir

pwd

gem install bundler

CHROME_VERSION="$(google-chrome --version | sed -r 's/[^0-9]+([0-9]+\.[0-9]+\.[0-9]+).*/\1/g')"
CHROMEDRIVER_VERSION_URL="https://chromedriver.storage.googleapis.com/LATEST_RELEASE_$CHROME_VERSION"
CHROMEDRIVER_VERSION=$(curl -s "$CHROMEDRIVER_VERSION_URL")

bin/bundle exec chromedriver-update "$CHROMEDRIVER_VERSION"

bundle config https://gems.weblinc.com
bundle install --deployment


chmod +x $GITHUB_WORKSPACE/testDir/anotherDir/test.sh	
sh -c $GITHUB_WORKSPACE/testDir/anotherDir/test.sh	

echo "done!"