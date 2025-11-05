#!/usr/bin/env bash

PWD=$(pwd)
ROOT_MARKER=".git"

function open_origin() {
  printf "found git root at $PWD \nSearching for git remote now:\n\n"
  ORIGINS="$(git remote)"

  OPEN_LIST=()
  for origin in $ORIGINS; do
    URL=$(git remote get-url "$origin")
    OPEN_LIST+=("$origin;$URL");
  done

  if [ ${#OPEN_LIST[@]} -gt 1 ]; then 
    selection=$(printf "%s\n" "${OPEN_LIST[@]}" | fzf --prompt="Select remote: ")
    remote_url="${selection#*;}"
    if [ -z "$remote_url" ];then
      clear
      exit 0
    fi

    xdg-open $remote_url &
    if [ $? -gt 0];then
      clear
      echo "Failed to pen $remote_url"
    else
      clear
      echo "Git remote opened: $remote_url"
    fi
  else
    remote_url="${OPEN_LIST[0]#*;}"
    echo "remote=$remote_url"

    if [ -z "$remote_url" ];then
      echo "rmurl $OPEN_LIST $remote_url"
      exit 0
    fi

    xdg-open $remote_url &

    if [ $? -gt 0];then
      clear
      echo "Failed to pen $remote_url"
    else
      clear
      echo "Git remote opened: $remote_url"
    fi
  fi
}

function main() {
  while [ "$(dirname $PWD)" != "/" ]; do
    if [ -e "$PWD/$ROOT_MARKER" ]; then
      open_origin
      exit 0
    fi
    PWD=$(dirname $PWD)
  done
}

function check_requirement() {
  printf "checking reqirements \n"
  if ! command -v "fzf" >/dev/null 2>&1; then
    echo "fzf is required for this script to run."
  fi
}

check_requirement
main
exit 1
