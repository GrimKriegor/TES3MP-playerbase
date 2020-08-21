#!/bin/sh

set -e

export DBCONNSTRING="postgresql://${POSTGRES_USER:-postgres}:${POSTGRES_PASSWORD:-supersecret}@${POSTGRES_HOST:-db}:${POSTGRES_PORT:-5432}/${POSTGRES_DB:-tes3mp-playerbase}"

if [ -z "$@" ]; then
  cron -f
else
  npm run "$@"
fi

