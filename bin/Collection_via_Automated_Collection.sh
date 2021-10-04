#!/bin/sh

echo -e "\e[92mExecuting Collection via Automated Collection script. Trying to dump information from etc/passwd"
sh -c "/bin/grep 'x:0:' /etc/passwd > /tmp/passwords"