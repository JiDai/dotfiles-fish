function sfdbprodtolocal --description "[SF] Restore the DB prod in localhost"
	if ! docker info > /dev/null 2>&1
		echo "Docker is not running"
		return 1
	end

	import-postgres-backup-snapshot.sh
end
