function sfrestoredbdate --description "[SF] Restore the DB at a date"
	if ! docker info > /dev/null 2>&1
		echo "Docker is not running"
		return 1
	end

	set -l date_string "$1"
	if test -z "$date_string" ]
		set -l date_string "(date +%Y%m%d)"
	else
		set -l date_string "$1"
	end

	echo "Restoring db for $date_string..."
	import-postgres-backup-snapshot.sh
	replace-all-password-locally.sh
	dump-local-db.sh "$date_string"
	import-db-locally.sh "$date_string"
end
