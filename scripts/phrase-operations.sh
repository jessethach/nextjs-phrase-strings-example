#!/bin/bash

# Exit if any command fails
set -e

# Ensure required environment variables are set
if [ -z "$PHRASE_ACCESS_TOKEN" ] || [ -z "$PHRASE_PROJECT_ID" ]; then
  echo "Required environment variables are missing."
  exit 1
fi

# Example of using Phrase CLI for push and pull operations directly with environment variables

# Push translations - adjust your paths and options as needed
echo "Pushing translations..."
phrase push --access-token="$PHRASE_ACCESS_TOKEN" --project-id="$PHRASE_PROJECT_ID" --recursive

# Pull translations - adjust your paths and options as needed
echo "Pulling translations..."
phrase pull --access-token="$PHRASE_ACCESS_TOKEN" --project-id="$PHRASE_PROJECT_ID" --target="./locales/<locale_name>/*.json"

echo "Phrase operations completed."
