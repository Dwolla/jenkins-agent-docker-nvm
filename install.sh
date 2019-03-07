#!/usr/bin/env bash

set +x
echo running \`. ${NVM_DIR}/nvm.sh --no-use\` > /dev/stderr
. ${NVM_DIR}/nvm.sh --no-use

if [[ -f ".nvmrc" ]]; then
  echo running \`nvm install\` > /dev/stderr
  nvm install
else
  echo running \`nvm install --lts\` > /dev/stderr
  nvm install --lts
fi
set -x

npm install
