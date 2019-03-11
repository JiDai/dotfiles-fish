# dotfiles-skeleton

A `.dotfiles` repository

## Installation

```
git clone --depth 1 https://github.com/JiDai/dotfiles-fish.git
./dotfiles-fish/install.sh
```

## SSH

```bash
ssh-keygen -t ed25519 -a 100 -C "`whoami`@`hostname`" -f ~/.ssh/id_ed25519
```

## Bash

Then change default bash for root

```bash
sudo -s
echo $(brew --prefix)/bin/fish >> /etc/shells
chsh -s $(brew --prefix)/bin/fish
```

And also for current user

```bash
chsh -s $(brew --prefix)/bin/fish
```

## Next

[] Install passwords stores 
