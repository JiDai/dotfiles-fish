#!/usr/bin/env bash

export IS_MACOS=false
export IS_LINUX=false
case $(uname -s) in
  "Darwin")
    export IS_MACOS=true
    ;;
  "Linux")
    export IS_LINUX=true
    ;;
esac

print_title () {
  local line='--------------------------------------------------------------------------------'
  local light_blue='\033[1;34m'
  local reset='\033[0m' # No Color
  printf "\n${light_blue}${line}\n# $1${reset}\n"
}

print_subtitle () {
  local light_green='\033[1;32m'
  local reset='\033[0m' # No Color
  printf "\n${light_green}## $1${reset}\n"
}


print_error () {
  local red='\033[0;31m'
  local reset='\033[0m' # No Color
  printf "\n${red}Error: $1${reset}\n"
}

realpath() {
    [[ $1 = /* ]] && echo "$1" || echo "$PWD/${1#./}"
}

