#!/bin/bash

echo "env is $env"
echo "ENV is $ENV"

bundle exec cucumber --retry 4 --publish 

