function getProjectByEnv --description "Return a project name from given env"
    set -l gcp_env "$argv[1]"

    switch $gcp_env
        case "prod"
            echo 'ma-prod'
        case "test"
            echo 'ma-staging-162909'
        case "staging"
            echo 'ma-staging-162909'
        case "dev"
            echo 'ma-dev2'
        case "preprod"
            echo 'ma-dev2'
        case "backbone"
            echo 'ma-backbone'
        case '*'
            echo "ma-dev2"
    end
end