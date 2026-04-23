#!/bin/sh
# Shortname: credentials_dumping_collection
# Description: Attempts to dump credentials from /etc/passwd to /tmp/passwords.

echo -e "\e[92mExecuting Collection via Automated Collection script. Trying to dump information from etc/passwd"
sh -c "/bin/grep 'x:0:' /etc/passwd > /tmp/passwords"
