#!/bin/bash
# https://github.com/YusukeKokubo/trello2md

cd $(ghq list -p | grep trello2md)

if [ -z $1 ]; then
  echo 'parameter is required.'
  exit
fi

if [ -n $2 ]; then
  gradle run -PprojectId="${1}" -Plist="${2}" | pbcopy
else
  gradle run -PprojectId="${1}" | pbcopy
fi
