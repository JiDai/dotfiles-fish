function sfbootapi --description "[SF] Boot the apis"
	if ! docker info > /dev/null 2>&1
		echo "Docker is not running"
		return 1
	end

	up.sh
	reset-local-database.sh
end
