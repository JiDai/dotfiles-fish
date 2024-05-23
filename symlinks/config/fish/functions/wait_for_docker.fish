function wait_for_docker --description "Wait for docker launched"
	set exit_code 1
	set docker_is_launched (docker ps > /dev/null 2>&1; echo $status)

	if test $docker_is_launched -ne 0
		open -a Docker > /dev/null

		while test $exit_code -ne 0
			echo "Wait for docker running"
			docker ps > /dev/null 2>&1
			set exit_code $status
			sleep 3
		end
	end
end
