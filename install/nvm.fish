# Install and configure NVM

function main 
	curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash

    echo "Install fish-nvm"
	omf install https://github.com/FabioAntunes/fish-nvm
	
	echo "Install and use Node 10"
	nvm install 10
	nvm use 10
	nvm alias default 10
end

main