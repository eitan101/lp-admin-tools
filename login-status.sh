#!/bin/bash

user=`jq -r .config.loginName ~/.lp-login`
if [ "$user" == "null" ]; then
    echo "Login failed"
    exit
fi
echo logged in as $user

