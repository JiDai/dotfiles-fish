#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail
readonly SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "$SCRIPT_DIR/../helpers.sh"

export NVM_DIR="$HOME/.nvm"

if [[ "${NVM_DIR}" != "" ]] && [[ -d ${NVM_DIR} ]]; then
    echo "Update nvm..."
    (
        cd "$NVM_DIR"
        git fetch --tags origin
        git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" $(git rev-list --tags --max-count=1)`
    ) && source "$NVM_DIR/nvm.sh"
else
    export NVM_DIR="$HOME/.nvm" && (
        git clone https://github.com/creationix/nvm.git "$NVM_DIR"
        cd "$NVM_DIR"
        git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" $(git rev-list --tags --max-count=1)`
    ) && source "$NVM_DIR/nvm.sh"
fi

nvm install 10
nvm use 10
nvm alias default 10
