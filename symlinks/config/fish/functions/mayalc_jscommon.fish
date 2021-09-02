function mayalc_jscommon --description "[MA] Yalc add/publish a package"
    if ! test -n "$argv[1]"
        echo "Please specify a container name"
        return 1
    end


    if ! command -v yalc >/dev/null 2>&1
        echo "Please install yalc with npm"
        return 1
    end

    set -l package "$argv[1]"

    if ! test (grep "@ma-js-common/$package" package.json)
        echo "You seems to not be in a project that requires JS-Common '$package' package"
        return 1
    end

    yalc add "@ma-js-common/$package"

    pushd "$HOME/JS-Common/packages/$package"
    yalc publish

    popd
end