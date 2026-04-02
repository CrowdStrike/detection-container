#!/bin/sh

echo -e "\e[92mExecuting an inert trojan that will attempt to connect to 192.168.0.1 on TCP port 444. This will be detected and killed by CrowdStrike's on-sensor machine learning with the aggressive policy settings enabled."

# Detect architecture and use appropriate binary
ARCH=$(uname -m)
case "$ARCH" in
    x86_64|amd64)
        # Use original x86 sample binary
        ./bin/evil/sample
        ;;
    aarch64|arm64)
        # Use arm64 binary if available
        if [ -f "./bin/evil/sample-arm64" ]; then
            ./bin/evil/sample-arm64
        else
            echo -e "\e[93mWarning: No arm64-compatible trojan binary available."
            echo -e "This detection requires an architecture-specific binary that is not currently included."
            echo -e "The detection container will skip this test on arm64 systems.\e[0m"
            exit 0
        fi
        ;;
    *)
        echo -e "\e[91mError: Unsupported architecture: $ARCH"
        echo -e "Supported architectures: x86_64, arm64\e[0m"
        exit 1
        ;;
esac
