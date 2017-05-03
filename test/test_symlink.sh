#!/usr/bin/env bash

declare -a errors

function error_and_proceed() {
  errors+=("${1}")
  echo -e "tgenv: Test Failed: ${1}" >&2
}

function error_and_die() {
  echo -e "tgenv: ${1}" >&2
  exit 1
}

[ -n "${TGENV_DEBUG}" ] && set -x
source $(dirname $0)/helpers.sh \
  || error_and_die "Failed to load test helpers: $(dirname $0)/helpers.sh"

TGENV_BIN_DIR=/tmp/tgenv-test
rm -rf ${TGENV_BIN_DIR} && mkdir ${TGENV_BIN_DIR}
ln -s ${PWD}/bin/* ${TGENV_BIN_DIR}
export PATH="${TGENV_BIN_DIR}:${PATH}"

echo "### Test supporting symlink"
cleanup || error_and_die "Cleanup failed?!"
tgenv install 0.12.15 || error_and_proceed "Install failed"
tgenv use 0.12.15 || error_and_proceed "Use failed"
check_version 0.12.15 || error_and_proceed "Version check failed"

if [ ${#errors[@]} -gt 0 ]; then
  echo -e "\033[0;31m===== The following symlink tests failed =====\033[0;39m" >&2
  for error in "${errors[@]}"; do
    echo -e "\t${error}"
  done
  exit 1
else
  echo -e "\033[0;32mAll symlink tests passed.\033[0;39m"
fi;
exit 0
