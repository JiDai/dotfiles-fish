function sfdbreset --description "[SF] Restore the DB prod in localhost"
	wait_for_docker

	sfd
	./scripts/dump-managed-db-new.sh postgres://$AWS_PROD_DB_USERNAME:$AWS_PROD_DB_PASSWORD@production-replica.cwlralkfkokc.eu-west-3.rds.amazonaws.com:5432/production
	./scripts/reset-local-database.sh
end
