function show_port --description "Show a program listening to a given port"
    if test -n "$argv[1]"
        lsof -i TCP:$argv[1] | grep LISTEN
    else
        echo "Please specify a port"
        return 1
    end
end
