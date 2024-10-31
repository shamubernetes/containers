#!/usr/bin/env bash

#shellcheck disable=SC2155
export PLEX_MEDIA_SERVER_INFO_MODEL=$(uname -m)
#shellcheck disable=SC2155
export PLEX_MEDIA_SERVER_INFO_PLATFORM_VERSION=$(uname -r)

# Set default values for some environment variables
PLEX_DOWNLOAD_ABSOLUTE_SCANNER=${PLEX_DOWNLOAD_ABSOLUTE_SCANNER:-"true"}
PLEX_DOWNLOAD_HAMA_BUNDLE=${PLEX_DOWNLOAD_HAMA_BUNDLE:-"true"}
PLEX_REMOVE_HAMA_CACHE=${PLEX_REMOVE_HAMA_CACHE:-"false"}

PLEX_MEDIA_SERVER_PLUGIN_DIR="${PLEX_MEDIA_SERVER_PLUGIN_DIR:-"${PLEX_MEDIA_SERVER_APPLICATION_SUPPORT_DIR}/Plex Media Server/Plug-ins"}"

PLEX_HAMA_BUNDLE_URL="https://github.com/ZeroQI/Hama.bundle/archive/master.zip"
HAMA_BUNDLE_FOLDER="${HAMA_BUNDLE_FILE:-"Hama.bundle"}"
HAMA_BUNDLE_FOLDER_PATH="${PLEX_MEDIA_SERVER_PLUGIN_DIR}/${HAMA_BUNDLE_FOLDER}"
HAMA_UNZIP_FOLDER="${HAMA_UNZIP_FOLDER:-"${HAMA_BUNDLE_FOLDER}-master"}"
HAMA_UNZIP_FOLDER_PATH="${PLEX_MEDIA_SERVER_PLUGIN_DIR}/${HAMA_UNZIP_FOLDER}"

PLEX_ABSOLUTE_SCANNER_URL="${PLEX_ABSOLUTE_SCANNER_URL:-"https://raw.githubusercontent.com/ZeroQI/Absolute-Series-Scanner/master/Scanners/Series/Absolute%20Series%20Scanner.py"}"

ABSO_SERIES_SCAN_FILE=${ABSO_SERIES_SCAN_FILE:-"Absolute Series Scanner.py"}
SERIES_SCANNER_FOLDER="${PLEX_MEDIA_SERVER_APPLICATION_SUPPORT_DIR}/Plex Media Server/Scanners/Series"
ABSO_SERIES_SCAN_FILE_PATH="${SERIES_SCANNER_FOLDER}/${ABSO_SERIES_SCAN_FILE}"

function getPref {
  local key="$1"
  xmlstarlet sel -T -t -m "/Preferences" -v "@${key}" -n "${prefFile}"
}

function setPref {
  local key="$1"
  local value="$2"
  count="$(xmlstarlet sel -t -v "count(/Preferences/@${key})" "${prefFile}")"
  count=$((count + 0))
  if [[ $count -gt 0 ]]; then
    xmlstarlet ed --inplace --update "/Preferences/@${key}" -v "${value}" "${prefFile}"
  else
    xmlstarlet ed --inplace --insert "/Preferences" --type attr -n "${key}" -v "${value}" "${prefFile}"
  fi
}

prefFile="${PLEX_MEDIA_SERVER_APPLICATION_SUPPORT_DIR}/Plex Media Server/Preferences.xml"

# Create empty Preferences.xml file if it doesn't exist already
if [ ! -e "${prefFile}" ]; then
  echo "Creating pref shell"
  mkdir -p "$(dirname "${prefFile}")"
  cat >"${prefFile}" <<-EOF
<?xml version="1.0" encoding="utf-8"?>
<Preferences/>
EOF
fi

# Setup Server's client identifier
serial="$(getPref "MachineIdentifier")"
if [[ -z ${serial} ]]; then
  serial="$(cat /proc/sys/kernel/random/uuid)"
  setPref "MachineIdentifier" "${serial}"
fi
clientId="$(getPref "ProcessedMachineIdentifier")"
if [[ -z ${clientId} ]]; then
  clientId="$(echo -n "${serial}- Plex Media Server" | sha1sum | cut -b 1-40)"
  setPref "ProcessedMachineIdentifier" "${clientId}"
fi

# Get server token and only turn claim token into server token if we have former but not latter.
token="$(getPref "PlexOnlineToken")"
if [[ -n ${PLEX_CLAIM_TOKEN} ]] && [[ -z ${token} ]]; then
  echo "Attempting to obtain server token from claim token..."
  loginInfo="$(curl -fsSL -X POST \
    -H 'X-Plex-Client-Identifier: '"${clientId}" \
    -H 'X-Plex-Product: Plex Media Server' \
    -H 'X-Plex-Version: 1.1' \
    -H 'X-Plex-Provides: server' \
    -H 'X-Plex-Platform: Linux' \
    -H 'X-Plex-Platform-Version: 1.0' \
    -H 'X-Plex-Device-Name: PlexMediaServer' \
    -H 'X-Plex-Device: Linux' \
    "https://plex.tv/api/claim/exchange?token=${PLEX_CLAIM_TOKEN}")"
  token="$(echo "$loginInfo" | sed -n 's/.*<authentication-token>\(.*\)<\/authentication-token>.*/\1/p')"

  if [[ "$token" ]]; then
    echo "Token obtained successfully!"
    setPref "PlexOnlineToken" "${token}"
  fi
fi

# Set other preferences
[[ -n ${ADVERTISE_IP} ]] && PLEX_ADVERTISE_URL=${ADVERTISE_IP}
if [[ -n ${PLEX_ADVERTISE_URL} ]]; then
  echo "Setting customConnections to: ${PLEX_ADVERTISE_URL}"
  setPref "customConnections" "${PLEX_ADVERTISE_URL}"
fi

[[ -n ${ALLOWED_NETWORKS} ]] && PLEX_NO_AUTH_NETWORKS=${ALLOWED_NETWORKS}
if [[ -n ${PLEX_NO_AUTH_NETWORKS} ]]; then
  echo "Setting allowedNetworks to: ${PLEX_NO_AUTH_NETWORKS}"
  setPref "allowedNetworks" "${PLEX_NO_AUTH_NETWORKS}"
fi

# Set transcoder directory if not yet set
if [[ -z "$(getPref "TranscoderTempDirectory")" ]]; then
  echo "Setting TranscoderTempDirectory to: /transcode"
  setPref "TranscoderTempDirectory" "/transcode"
fi

# Parse list of all exported variables that start with PLEX_PREFERENCE_
# The format of which is PLEX_PREFERENCE_<SOMETHING>="Key=Value"
# Where Key is the EXACT key to use in the Plex Preference file
# And Value is the EXACT value to use in the Plex Preference file for that key.
# Please note it looks like many of the key's are camelCase in some fashion.
# Additionally there are likely some preferences where environment variable injection
# doesn't really work for.
for var in "${!PLEX_PREFERENCE_@}"; do
  value="${!var}"
  PreferenceValue="${value#*=}"
  PreferenceKey="${value%=*}"
  setPref "${PreferenceKey}" "${PreferenceValue}"
done

# Remove pid file
rm -f "${PLEX_MEDIA_SERVER_APPLICATION_SUPPORT_DIR}/Plex Media Server/plexmediaserver.pid"

# Purge Codecs folder
if [[ ${PLEX_PURGE_CODECS} == "true" ]]; then
  echo "Purging Codecs folder..."
  find "${PLEX_MEDIA_SERVER_APPLICATION_SUPPORT_DIR}/Plex Media Server/Codecs" -mindepth 1 -not -name '.device-id' -print -delete
fi

if [[ ${PLEX_DOWNLOAD_HAMA_BUNDLE} == "true" ]]; then

  if [[ ! -d ${PLEX_MEDIA_SERVER_PLUGIN_DIR} ]]; then
    echo "Creating Plex Media Server Plug-ins folder..."
    mkdir -p "${PLEX_MEDIA_SERVER_PLUGIN_DIR}"
  fi

  if [[ -d ${HAMA_BUNDLE_FOLDER_PATH} ]]; then
    echo "Removing existing Hama.bundle..."
    rm -rf "${HAMA_BUNDLE_FOLDER_PATH}"
  fi
  echo "Downloading Hama.bundle..."
  curl -fsSL -o "${HAMA_BUNDLE_FOLDER_PATH}.zip" \
    "${PLEX_HAMA_BUNDLE_URL}"
  if [[ ! -f ${HAMA_BUNDLE_FOLDER_PATH}.zip ]]; then
    echo "Failed to download Hama.bundle!"
    exit 1
  fi
  unzip -o "${HAMA_BUNDLE_FOLDER_PATH}.zip" \
    -d "${PLEX_MEDIA_SERVER_PLUGIN_DIR}"
  if [[ ! -d ${HAMA_UNZIP_FOLDER_PATH} ]]; then
    echo "Failed to unzip Hama.bundle!"
    exit 1
  fi
  mv "${HAMA_UNZIP_FOLDER_PATH}" \
    "${HAMA_BUNDLE_FOLDER_PATH}"
  if [[ ! -d ${HAMA_BUNDLE_FOLDER_PATH} ]]; then
    echo "Failed to move Hama.bundle!"
    exit 1
  fi
  rm -f "${HAMA_BUNDLE_FOLDER_PATH}.zip"
  if [[ -d ${HAMA_BUNDLE_FOLDER_PATH} ]]; then
    chmod -R 755 "${HAMA_BUNDLE_FOLDER_PATH}"
    echo "Hama.bundle downloaded successfully!"
  else
    echo "Failed to download Hama.bundle!"
    exit 1
  fi
fi

if [[ ${PLEX_DOWNLOAD_ABSOLUTE_SCANNER} == "true" ]]; then
  if [[ -f ${ABSO_SERIES_SCAN_FILE_PATH} ]]; then
    echo "Removing existing ${ABSO_SERIES_SCAN_FILE}..."
    rm -f "${ABSO_SERIES_SCAN_FILE_PATH}"
  fi
  echo "Downloading Absolute Series Scanner..."
  mkdir -p "${SERIES_SCANNER_FOLDER}"
  curl -fsSL -o "${ABSO_SERIES_SCAN_FILE_PATH}" \
    "${PLEX_ABSOLUTE_SCANNER_URL}"
  chmod 755 "${ABSO_SERIES_SCAN_FILE_PATH}"
  if [[ -f ${ABSO_SERIES_SCAN_FILE_PATH} ]]; then
    echo "Absolute Series Scanner downloaded successfully!"
  else
    echo "Failed to download Absolute Series Scanner!"
    exit 1
  fi
fi

if [[ ${PLEX_REMOVE_HAMA_CACHE} == "true" ]]; then
  echo "Removing Hama cache..."
  rm -rf "${PLEX_MEDIA_SERVER_APPLICATION_SUPPORT_DIR}/Plex Media Server/Plug-in Support/Data/com.plexapp.agents.hama"
fi

#shellcheck disable=SC2086
exec \
  /usr/lib/plexmediaserver/Plex\ Media\ Server \
  "$@"
