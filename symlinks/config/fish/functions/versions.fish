function versions --description "Show Python and Node/NPM versions number"
	if command -v python > /dev/null 2>&1
		python --version 2>&1
	end

	if command -v node > /dev/null 2>&1
		echo "Node "(node --version | sed 's/v//g')
		echo "NPM "(npm --version)
	end
end
