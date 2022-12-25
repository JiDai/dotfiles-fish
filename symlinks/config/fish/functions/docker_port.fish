function docker_port --description "Show the port exposed of a container"
	if test -n "$argv[1]"
		docker ps | grep $argv[1] | sed 's/.*0.0.0.0://g'|sed 's/->.*//g'
	else
		echo "Please specify a container name"
		return 1
	end
end
