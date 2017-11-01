#!/bin/bash

LP_BEARER=`jq -r .bearer ~/.lp-login`

curl -s -H "Authorization: Bearer $LP_BEARER" \
  "https://$LP_ACCOUNTCONFIGREADONLY/api/account/$LP_ACCOUNT/configuration/le-users/skills?v=1.0&NC=true&select=\$all" | jq -r . 
