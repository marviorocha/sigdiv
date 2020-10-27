#!/bin/sh

set -e

if [ -f tmp/pids/server.pid ]; then
  rake db:create db:migrate
  rails credentials:edit
  rm tmp/pids/server.pid
fi

bundle exec rails s -b 0.0.0.0