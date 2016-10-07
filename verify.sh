#!/usr/bin/env bash

set +x
echo running \`. ${JENKINS_HOME}/.nvm/nvm.sh --no-use\` > /dev/stderr
. ${JENKINS_HOME}/.nvm/nvm.sh --no-use

echo running \`nvm install\` > /dev/stderr
nvm install
set -x

npm install
npm test
