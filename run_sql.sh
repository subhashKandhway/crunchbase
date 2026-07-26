#!/usr/bin/env bash
# Runs a SnowSQL script with variables injected from .env, keeping secrets out of git
# Co-authored with CoCo

set -euo pipefail

if [ ! -f .env ]; then
    echo ".env file not found. Copy .env.example to .env and fill in real values." >&2
    exit 1
fi

set -a
source .env
set +a

snowsql -f "$1" \
    -D AWS_ROLE_ARN="$AWS_ROLE_ARN" \
    -D S3_BUCKET_URL="$S3_BUCKET_URL"
