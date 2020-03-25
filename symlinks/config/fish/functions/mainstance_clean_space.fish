function mainstance_clean_space --description "[MA] Clean and get space on instance"
    echo '# Docker system prune...'
    docker system prune -f
    echo ''
    echo '# Remove docker images...'
    docker rmi -f (docker images -q)
    docker rmi -f (docker images --format '{{ .Repository }}:{{ .Tag}}')
    docker volume rm (docker volume ls -f dangling=true -q)
    echo ''
    echo '# Remove docker networks...'
    docker network rm (docker network ls -q)
    echo ''
    echo '# Apt cache clean'
    sudo apt clean
end