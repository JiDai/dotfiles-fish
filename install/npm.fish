# Install and configure NVM

function main
    echo "Install NPM global packages"
    npm i -g npm-check
    npm i -g yarn-check
    npm i -g vercel
    npm i -g lint-staged
    npm i -g prettier
    npm i -g eslint
end

main
