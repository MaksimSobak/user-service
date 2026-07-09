#!/bin/sh
set -e

DB_HOST=${DB_HOST:-db}
DB_PORT=${DB_PORT:-5432}

MAX_RETRIES=30
RETRY_COUNT=0

echo "Waiting for database at ${DB_HOST}:${DB_PORT}..."

while ! nc -z "$DB_HOST" "$DB_PORT"; do
  RETRY_COUNT=$((RETRY_COUNT + 1))

  if [ "$RETRY_COUNT" -ge "$MAX_RETRIES" ]; then
    echo "Database is unavailable after ${MAX_RETRIES} attempts"
    exit 1
  fi

  echo "Database is not ready yet. Retry ${RETRY_COUNT}/${MAX_RETRIES}"
  sleep 1
done

echo "Database is ready"

echo "Running migrations..."
alembic upgrade head

echo "Starting application..."

exec "$@"