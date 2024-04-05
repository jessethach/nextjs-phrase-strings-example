#!/bin/bash

# Exit on error
set -e

# Ensure that the required environment variables are set
if [ -z "$PHRASE_ACCESS_TOKEN" ] || [ -z "$PHRASE_PROJECT_ID" ]; then
    echo "Required environment variables are missing."
    exit 1
fi

# Configuring the Phrase CLI
phrase config:set access_token "$PHRASE_ACCESS_TOKEN"
phrase config:set project_id "$PHRASE_PROJECT_ID"

# Push configurations
# Replace paths with your specific file paths if they are different

# Push en-US locale
echo "Pushing en-US translations..."
phrase push --recursive --wait --access_token="$PHRASE_ACCESS_TOKEN" --project_id="$PHRASE_PROJECT_ID" --branch=main \
    --file="./public/static/locales/en-US/*.json" \
    --locale_id="en-US" \
    --format="i18next" \
    --update_translations=false

# Push es-US locale
echo "Pulling es-US translations..."
phrase push --recursive --wait --access_token="$PHRASE_ACCESS_TOKEN" --project_id="$PHRASE_PROJECT_ID" --branch=main \
    --file="./public/static/locales/es-US/*.json" \
    --locale_id="es-US" \
    --format="i18next" \
    --update_translations=false

# Pull configurations
# Assuming you want to pull translations for 'home.json' and 'auth.json' for both locales.
# Adjust the file and target paths as needed.

echo "Pulling translations for en-US..."
phrase pull --access_token="$PHRASE_ACCESS_TOKEN" --project_id="$PHRASE_PROJECT_ID" \
    --locale_id="en-US" --format="i18next" \
    --target="./public/static/locales/en-US/{file}"

echo "Pulling translations for es-US..."
phrase pull --access_token="$PHRASE_ACCESS_TOKEN" --project_id="$PHRASE_PROJECT_ID" \
    --locale_id="es-US" --format="i18next" \
    --target="./public/static/locales/es-US/{file}"

echo "Phrase operations completed."
