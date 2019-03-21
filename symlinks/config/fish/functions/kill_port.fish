function kill_port --description "Kill a program listenning to a given port"
    if test -n "$argv[1]"
        lsof -i TCP:$argv[1] | grep LISTEN | awk '{print $2}' | xargs kill
    else
        echo "Please specify a port"
        return 1
    end
end
