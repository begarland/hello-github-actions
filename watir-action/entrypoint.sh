#!/bin/sh -l

echo "starting"

pwd

cd $GITHUB_WORKSPACE/testDir/anotherDir

bundle exec install --deployement

pwd

chmod +x $GITHUB_WORKSPACE/testDir/anotherDir/test.sh	
sh -c $GITHUB_WORKSPACE/testDir/anotherDir/test.sh	


echo "done!"