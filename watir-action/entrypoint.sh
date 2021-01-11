#!/bin/sh -l

echo "starting"

pwd

cd $GITHUB_WORKSPACE/testDir/anotherDir

pwd

gem install bundler

bundle config https://gems.weblinc.com
bundle install --deployment

chmod +x $GITHUB_WORKSPACE/testDir/anotherDir/test.sh	
sh -c $GITHUB_WORKSPACE/testDir/anotherDir/test.sh	

echo "done!"