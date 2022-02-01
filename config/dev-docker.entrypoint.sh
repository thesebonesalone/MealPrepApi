#!/bin/sh

set -e

echo "ENVIRONMENT: $RAILS_ENV"

# check bundle
bundle check || bundle install

#remove pid from previous session

rm -f $APP_PATH/tmp/pids/server.pid

#run anything by prepending 

bundle exec ${@}