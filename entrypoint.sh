#!/bin/bash

set -e

# This nastiest hack you have ever seen!!
if [ ! -f /environment ]; then
  printenv > /environment
fi
set -a
. /environment
set +a

export DBCONNSTRING="postgresql://${POSTGRES_USER:-postgres}:${POSTGRES_PASSWORD:-supersecret}@${POSTGRES_HOST:-db}:${POSTGRES_PORT:-5432}/${POSTGRES_DB:-tes3mp-playerbase}"

if [ -z "$@" ]; then
  cron -f
else
  cd /app
  npm run "$@"
fi
