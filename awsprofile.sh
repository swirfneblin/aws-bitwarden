#!/bin/bash

function set_vars {
  export AWS_ACCESS_KEY_ID=$1
  export AWS_SECRET_ACCESS_KEY=$2
  export AWS_DEFAULT_REGION=$3
}

function resolve {
  echo $1
  set_vars $2 $3 $4
  bw lock
}

PROFILE=$1
[ -z "$1" ] && resolve "Profile is null." && return

BW_SESSION=$(bw unlock --raw)
[ $? -ne 0 ] && return

VALUES=$(bw list items --session $BW_SESSION --search $PROFILE | jq -r .[0])
[ "$VALUES" == null ] && resolve "Invalid profile." && return

resolve "Success! Connected on profile: $PROFILE" \
  $(echo $VALUES | jq -r .login.username) \
  $(echo $VALUES | jq -r .login.password) \
  $(echo $VALUES | jq -r .fields[0].value)