#!/usr/bin/env bash

# Usage: ./bin/build.sh

set -e

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

docker run --rm -v "${SCRIPT_DIR}/../:/project" \
   --env-file "${SCRIPT_DIR}/../project-vars.sh" \
   -it onebytegone/arduino-blink make
