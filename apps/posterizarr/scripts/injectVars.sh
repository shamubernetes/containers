#!/usr/bin/env bash

# This script is used to inject environment variables into the config json file

CONFIG_FILE_PATH=/app/config/config.json

get_jq_value() {
  local value="$1"
  # Lists are broken, I'm not going to fix them
  if [[ $value =~ ^\[.*\]$ ]]; then
    return 1
  fi
  # Handle non-array values (strings)
  if [[ $value =~ ^\".*\"$ ]]; then
    echo "$value"
  else
    echo "\"$value\""
  fi
}

# Loop over environment variables that start with POSTERIZARR__
for var in $(env | grep '^POSTERIZARR__'); do
  # Extract the key-value pair
  IFS='=' read -r key value <<<"$var"

  # Strip the POSTERIZARR__ prefix
  key="${key#POSTERIZARR__}"

  # Replace __ with . to get the correct path in jq
  # shellcheck disable=SC2001
  json_path=$(echo "$key" | sed 's/__/./g')

  # Check if the JSON path exists
  if jq --exit-status ".$json_path" "$CONFIG_FILE_PATH" >/dev/null 2>&1; then
    # Get the correct jq value format
    if jq_value=$(get_jq_value "$value"); then
      echo "Setting $json_path from ENV"
      # Use jq to update the JSON file
      jq ".$json_path = $jq_value" "$CONFIG_FILE_PATH" | sponge "$CONFIG_FILE_PATH"
    else
      echo "Skipping $json_path (unsupported type)"
      continue
    fi
  else
    echo "Skipping $json_path (path does not exist in JSON)"
    continue
  fi
done
