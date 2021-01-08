#!/bin/sh -l

echo "starting"

pwd

cd $GITHUB_WORKSPACE/testDir/anotherDir

pwd

chmod +x test.sh	
sh -c test.sh	


echo "done!"