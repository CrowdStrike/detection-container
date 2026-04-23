#!/bin/sh
# Shortname: suspicious_commands
# Description: Emulate malicious activity related to suspicious CLI commands. Runs the command sh -c whoami '[S];pwd;echo [E]'.

echo -e "\e[92mExecuting Execution via Command-Line Interface. This script is causing malicious activity related suspicious CLI commands."
sh -c whoami '[S];pwd;echo [E]'
