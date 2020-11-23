function marestart_services --description "[MA] Restart all web services"
    set services 'nginx' 'redis-server' 'luigi'

    sudo systemctl daemon-reload # If sysctl configuration has changed

    for i in $services
        echo "Restarting $i..."
        sudo systemctl restart $i
    end
end