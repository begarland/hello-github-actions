#!/bin/bash


sh -c "echo Hello world, Im in another dir!" 

cd ~/testDir/anotherDir

bundle exec cucumber --publish

pwd

