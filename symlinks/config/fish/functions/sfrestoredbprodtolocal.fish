function sfrestoredbprodtolocal --description "[SF] Restore the DB prod in localhost"
	if ! docker info > /dev/null 2>&1
		echo "Docker is not running"
		return 1
	end

	download-prod-db.sh; \
		and import-db-locally.sh prod; \
		and execute-migrations.sh; \
		and replace-all-password-locally.sh;
end
