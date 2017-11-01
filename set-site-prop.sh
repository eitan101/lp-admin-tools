#!/bin/bash

while getopts ":t:v:p:jh" opt; do
  case $opt in
    t) TYPE=$OPTARG;;
    v) VALUE=$OPTARG;;
    p) PROPERTY_NAME=$OPTARG;;
    j) JSON=true;;      
    h) echo "Usage: $0 -t type -v value -p property-name [-j (for json values)]"; exit 2;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
    :)
      echo "Option -$OPTARG requires an argument." >&2
      exit 1
      ;;
  esac
done

LP_BEARER=`jq -r .bearer ~/.lp-login`

if ["$JSON" != "true"] then
  VALUE='"'$VALUE'"'
fi


curl -s -X PUT \
  -H "Authorization: Bearer $LP_BEARER" \
  -H "If-Match: -1" \
  -H "Content-Type: application/json" \
  -H "Accept: application/json" \
  -d '{"id": "'$PROPERTY_NAME'","type": '$TYPE',"propertyValue": {"value": '$VALUE'},"deleted": "false"}' \
  "https://$LP_ACCOUNTCONFIGREADWRITE/api/account/$LP_ACCOUNT/configuration/setting/properties/$LP_SITE_PROP?v=3.0" | jq -r . 
