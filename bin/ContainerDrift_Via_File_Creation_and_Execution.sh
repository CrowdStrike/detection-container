#!/bin/sh

echo -e "\e[92mExecuting Container Drift via file creation script. Creating a file and then executing it."
sh -c "rm -f /bin/id2 ; cp /bin/id /bin/id2; /bin/id2 > /dev/null"