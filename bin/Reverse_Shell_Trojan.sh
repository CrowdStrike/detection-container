#!/bin/sh

SCRIPT_DIR=$(cd "$(dirname "$0")" && pwd)

echo -e "\e[92mExecuting an inert trojan that will attempt to connect to 192.168.0.1 on TCP port 444. This will be detected and killed by CrowdStrike's on-sensor machine learning with the aggressive policy settings enabled."

# Detect architecture and use appropriate binary
ARCH=$(uname -m)
case "$ARCH" in
    x86_64|amd64)
        "$SCRIPT_DIR/evil/sample-x86"
        ;;
    aarch64|arm64)
        "$SCRIPT_DIR/evil/sample-aarch64"
        ;;
    *)
        echo -e "\e[91mError: Unsupported architecture: $ARCH"
        exit 1
        ;;
esac
