# Install and configure NPM packages

function main
	echo "Install Node"
	mkdir $HOME/.n
	n latest

	echo "Install NPM global packages"
	npm install -g npm-check
	npm install -g yarn-check
	npm install -g vercel
	npm install -g lint-staged
	npm install -g prettier
	npm install -g eslint
	npm install -g fish-lsp
end

main
