function sfrestoredbdatetolocal --description "[SF] Restore the DB"
	if ! docker info > /dev/null 2>&1
		echo "Docker is not running"
		return 1
	end

	set -l backup_name "$argv[1]"
	if test -z "$backup_name"
		set backup_name (date +%Y%m%d)
	end

	echo "Restoring db for $backup_name..."
	import-postgres-backup-snapshot.sh
	replace-all-password-locally.sh
	dump-local-db.sh "$backup_name"
	import-db-locally.sh "$backup_name"
end
