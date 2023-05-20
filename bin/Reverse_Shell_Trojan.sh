#!/bin/sh

echo -e "\e[92mExecuting an inert trojan that will attempt to connect to 192.168.0.1 on TCP port 444. This will be detected and killed by CrowdStrike's on-sensor machine learning with the aggressive policy settings enabled."

./bin/evil/sample
