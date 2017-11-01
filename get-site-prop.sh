#!/bin/bash

LP_BEARER=`jq -r .bearer ~/.lp-login`

curl -s -H "Authorization: Bearer $LP_BEARER" \
  "https://$LP_ACCOUNTCONFIGREADWRITE/api/account/$LP_ACCOUNT/configuration/setting/properties/$1?v=3.0" | jq -r . 
