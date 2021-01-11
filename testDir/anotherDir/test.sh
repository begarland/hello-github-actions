#!/bin/bash

pwd

sh -c "echo Hello world, Im in another dir!" 

cd $GITHUB_WORKSPACE/testDir/anotherDir

bundle exec cucumber --publish

pwd

