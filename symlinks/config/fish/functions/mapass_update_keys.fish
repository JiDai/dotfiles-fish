function mapass_update_keys -d "[MA] Update GPG keys for pass"
    ls ~/.password-store/.public_keys/*.gpg | xargs gpg --import
    cat ~/.password-store/.public_keys/gpg.conf >> ~/.gnupg/gpg.conf
end