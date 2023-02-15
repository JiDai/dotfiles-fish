function sfboot --description "[SF] Boot the stack"
	if ! docker info > /dev/null 2>&1
		echo "Docker is not running"
		return 1
	end

	up.sh
	reset-local-database.sh

	cd $SF_PATH/services/frontends/
	yarn lerna run start --parallel --stream
end
