#!/bin/bash

pwd

sh -c "echo Hello world, Im in another dir!" 

cd ~

bundle exec cucumber --publish

pwd

