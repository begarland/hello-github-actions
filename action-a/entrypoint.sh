#!/bin/sh -l

sh -c "echo Hello world my name is $INPUT_ENV, $INPUT_RAILS_ENV, $INPUT_CI"

cd $GITHUB_WORKSPACE

chmod +x test.sh	
sh -c test.sh	


sh -c "echo Im done!"