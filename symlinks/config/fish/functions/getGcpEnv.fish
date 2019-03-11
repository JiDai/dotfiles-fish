function getGcpEnv --description "Guess env from hostname"
    set -l host "$argv[1]"
    set -l suffix (echo $host | rev | cut -d- -f2 | rev)

    if contains $suffix "prod" "staging" "dev" "test" "backbone"
        echo $suffix
    else
        echo $host | rev | cut -d- -f3 | rev
    end
end