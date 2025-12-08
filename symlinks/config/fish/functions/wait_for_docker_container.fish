function wait_for_docker_container --description "Wait for docker container running"
	set is_running 0
	set container_name "$argv[1]"
	if test -z "$container_name"
		echo "Please provide a container name"
		return 1
	end

	set container_list ""
	while test "$container_list" != "$container_name"
		echo "Wait for container running : $container_name"
		set container_list (docker ps --filter "name=^$container_name\$" --filter "status=running" --format "{{.Names}}")
		sleep 3
	end
end
