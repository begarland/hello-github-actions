#!/bin/bash

echo "env is $env"
echo "ENV is $ENV"
echo "INPUT_ENV is $INPUT_ENV"

bundle exec cucumber --retry 4 --publish 

