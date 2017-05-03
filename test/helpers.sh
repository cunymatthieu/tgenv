#!/usr/bin/env bash

check_version() {
  v="${1}"
  [ -n "$(terragrunt --version | grep "terragrunt version v${v}")" ]
}

cleanup() {
  rm -rf ./versions
  rm -rf ./.terragrunt-version
}
