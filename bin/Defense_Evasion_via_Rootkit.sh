#!/bin/sh

echo -e "\e[92mExecuting Defense Evasion via Rootkit.This script will change the group owner to '0' of /etc/ld.so.preload indicative for a Jynx Rootkit"
touch /etc/ld.so.preload
chgrp 0 /etc/ld.so.preload
