#!/bin/sh -l

echo "starting"

pwd

cd $GITHUB_WORKSPACE/testDir/anotherDir

pwd

echo bundle config https://gems.weblinc.com
echo bundle install --deployment

chmod +x $GITHUB_WORKSPACE/testDir/anotherDir/test.sh	
sh -c $GITHUB_WORKSPACE/testDir/anotherDir/test.sh	

echo "done!"