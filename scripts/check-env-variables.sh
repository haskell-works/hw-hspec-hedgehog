#!/bin/bash

declare -a vars=(\
"BINTRAY_USER your bintray user account" \
"BINTRAY_API_KEY your bintray api key" \
"BINTRAY_EMAIL required to login to the bintray docker repository" \
)

for var in "${vars[@]}"
do
  v=${var%% *}
  if [ "${!v-x}" = "x" -a "${!v-y}" = "y" ]; then
    printf 'NOT FOUND: $%s\n' "$var"
    _not_found=true
  else
    printf 'found: $%s\n' "$v"
  fi
done

[ -z "${_not_found}" ] && exit 0

echo "*****************************"
echo "MISSING ENVIRONMENT VARIABLES"
echo "*****************************"
exit 1
