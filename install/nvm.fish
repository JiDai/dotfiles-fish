# Install and configure NVM

function main
    set -e NVM_DIR # Avoid NVM install error if NVM_DIR is set
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash

    echo "Install fish-nvm"
    omf install https://github.com/FabioAntunes/fish-nvm

    export NVM_SYMLINK_CURRENT=true

    echo "Install and use Node 12"
    nvm install lts/erbium
    nvm alias default lts/erbium
    nvm use --delete-prefix lts/erbium

    echo "Install NPM global packages"
    npm i -g npm-check
    npm i -g yarn-check
    npm i -g watchman-processor
    npm i -g browser-sync
end

main
