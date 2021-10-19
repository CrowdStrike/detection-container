#!/bin/sh

echo -e "\e[92mExecuting Defense Evasion via Masquerading. This script excutes a renamed copy of /usr/bin/whoami causing a contradicting file extension"
cp /usr/bin/whoami ./whoami.rtf
./whoami.rtf
