function maupdate_pass --description "[MA] Update Unix Pass with changed gpg keys and passwords"
    pass git pull
    ls ~/.password-store/.public_keys/*.gpg | xargs gpg --import
    cat ~/.password-store/.public_keys/gpg.conf >> ~/.gnupg/gpg.conf
end