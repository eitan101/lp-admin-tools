#!/bin/bash
# Read Password
echo -n "username: " 
read username
echo -n "Password: "
read -s password
echo ""
echo "Logging in..."

rm ~/.lp-login
curl -s -c cookies -X POST \
  -H "Content-Type: application/json" \
  -H "Accept: application/json" \
  -H "Cache-Control: no-cache" \
  -d '{"username": "'$username'","password":"'$password'"}' \
  "https://$LP_AGENTVEP/api/account/$LP_ACCOUNT/login?v=1.2" > ~/.lp-login
chmod 600 ~/.lp-login

. login-status.sh

