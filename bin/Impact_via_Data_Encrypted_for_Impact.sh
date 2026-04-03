#!/bin/sh
#
# Impact via Data Encrypted for Impact
# LockBit-style ransomware simulation
#
# Simulates LockBit file encryption by renaming files with the
# .lockbit extension. Completely harmless.
#

echo -e "\e[92mExecuting Impact via Data Encrypted for Impact"

# Create target directory and fake files
mkdir -p /home/user/something
echo "This is a fake file for detection simulation." > /home/user/something/fakedata.txt

# Simulate LockBit encryption by renaming with .lockbit extension
echo -e "\e[93m[*] Encrypting files with .lockbit extension...\e[0m"
mv /home/user/something/fakedata.txt /home/user/something/fakedata.txt.lockbit

echo -e "\e[92mSimulation complete. Cleaning up...\e[0m"
sleep 2

# Cleanup
rm -rf /home/user/
echo -e "\e[92mCleanup complete. All temporary files removed.\e[0m"
