function mainject_key --description "[MA] Inject SSH key on developers instance"
    if ! test -n "$argv[1]"
        echo "Please specify a container name"
        return 1
    end

    set -l user "$argv[1]"
    ssh jordid@(PLATFORM=FR gls dev | grep "$user-developers" | awk '{print $5}') "echo '"(ssh-add -L)"' | sudo tee -a /home/$user/.ssh/authorized_keys > /dev/null"
    echo "Key injected!"

    echo  "\
Host $user
  User $user
  ForwardAgent yes
  HostName $user-developers-1c-0
  Port 22
  ProxyCommand ssh -W %h:%p dev
" >> ~/.ssh/ma.config
    echo "~/.ssh/ma.config edited"
end