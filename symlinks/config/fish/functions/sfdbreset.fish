function sfdbreset --description "[SF] Restore the DB prod in localhost"
	wait_for_docker

	pushd ~/Work/database
	./scripts/reset-local-database.sh
	popd
end
