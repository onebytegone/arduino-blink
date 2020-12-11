#!/usr/bin/env bash

# Usage: ./bin/flash.sh ${PORT}

set -e

TARGET_PORT=$1
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

if [ -z "${TARGET_PORT}" ]; then
   echo "ERROR: A port must be provided e.g. ./bin/flash.sh /dev/tty.usbmodem123"
   echo
   echo "Known ports:"
   ls -1 /dev/tty.*
   exit 1
fi

source "${SCRIPT_DIR}/../project-vars.sh"

HEX_FILE="src/${PROJECT_NAME}.hex"

echo "Flashing ${HEX_FILE} to ${TARGET_PORT}..."

avrdude -F -V -c arduino -p atmega328p -P "${TARGET_PORT}" -b 115200 -U "flash:w:${HEX_FILE}"
