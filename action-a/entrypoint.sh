#!/bin/sh -l

sh -c "echo Hello world my name is $INPUT_ENV, $INPUT_RAILS_ENV, $INPUT_CI"

sh -c "echo wkspce is $GITHUB_WORKSPACE"


chmod +x $GITHUB_WORKSPACE/test.sh	
sh -c $GITHUB_WORKSPACE/test.sh	


sh -c "echo Im done!"