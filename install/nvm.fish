# Install and configure NVM

function main
    set -e NVM_DIR # Avoid NVM install error if NVM_DIR is set
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash

    echo "Install fish-nvm"
    omf install https://github.com/FabioAntunes/fish-nvm

    export NVM_SYMLINK_CURRENT=true

    echo "Install and use Node 14"
    nvm install 14
    nvm alias default 14
    nvm use --delete-prefix 14

    echo "Install NPM global packages"
    npm i -g npm-check
    npm i -g yarn-check
    npm i -g watchman-processor
    npm i -g browser-sync
end

main
