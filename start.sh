#!/bin/sh
set -e

host="$1"

until psql -h "$host" -U "postgres" -c '\q'; do
  >&2 echo "Postgres is unavailable - sleeping"
  sleep 1
done

>&2 echo "Postgres is up - running migrations"

#yarn db:setup


>&2 echo "running pizzly"

yarn dev:serve