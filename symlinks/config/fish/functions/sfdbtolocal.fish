function sfdbtolocal --description "[SF] Restore the DB staging|prod|sandbox in localhost"
	wait_for_docker

	pushd ~/Work/database

	if test "$argv[1]" != "prod" -a "$argv[1]" != "staging" -a "$argv[1]" != "sandbox"
		echo "You need to specify the environment (staging, sandbox or production)"
		return 1
	end

	if test "$argv[1]" = "prod"
		./scripts/dump-managed-db-new.sh postgres://$AWS_PROD_DB_USERNAME:$AWS_PROD_DB_PASSWORD@production-replica.cwlralkfkokc.eu-west-3.rds.amazonaws.com:5432/production
	else if test "$argv[1]" = "sandbox"
		./scripts/dump-managed-db-new.sh postgres://$AWS_SANDBOX_DB_USERNAME:$AWS_SANDBOX_DB_PASSWORD@rds-sandbox.cwlralkfkokc.eu-west-3.rds.amazonaws.com/sandbox
	else
		./scripts/dump-managed-db-new.sh postgres://$AWS_STAGING_DB_USERNAME:$AWS_STAGING_DB_PASSWORD@demo.cwlralkfkokc.eu-west-3.rds.amazonaws.com/staging
	end

	./scripts/import-db-locally.sh dump_db
	popd
end
