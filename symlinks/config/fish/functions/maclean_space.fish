function maclean_space --description "[MA] Clean and get space on instance"
    set -l RED '\033[0;31m'
    set -l GREEN '\033[0;32m'
    set -l BLUE '\033[0;34m'
    set -l YELLOW '\033[33m'
    set -l RESET '\033[0m'

    set -l AVAILABLE_BEFORE (df -B1 /dev/sda1 | tail -1 | awk '{print $4}')

    printf "%bDocker system prune...%b\n" $YELLOW $RESET
    docker system prune -f
    printf "%bRemove docker images...%b\n" $YELLOW $RESET
    docker rmi -f (docker images -q)
    docker rmi -f (docker images --format '{{ .Repository }}:{{ .Tag}}')
    docker volume rm (docker volume ls -f dangling=true -q)
    printf "%bRemove docker networks...%b\n" $YELLOW $RESET
    docker network rm (docker network ls -q)
    printf "%bApt cache clean%b\n" $YELLOW $RESET
    sudo apt clean
    printf "%bRemove apps logs%b\n" $YELLOW $RESET
    sudo rm -rf '/var/log/ma/*.log'
    printf "%bRemove pipenv cache%b\n" $YELLOW $RESET
    rm -rf "$HOME/.cache/pipenv"

    set -l AVAILABLE_AFTER (df -B1 /dev/sda1 | tail -1 | awk '{print $4}')
    set -l RECLAIMED (math $AVAILABLE_AFTER-$AVAILABLE_BEFORE)

    printf "%b%s reclaimed%b\n" "$BLUE" (numfmt --to=iec $RECLAIMED) $RESET
end