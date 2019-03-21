#!/usr/bin/env fish

# FZF
omf install https://github.com/jethrokuan/fzf

# Bass makes it easy to use utilities written for Bash in fish shell.
omf install bass

# Prompt theme
omf install clearance

# Install and configure NVM
omf install https://github.com/FabioAntunes/fish-nvm
nvm install 10
nvm use 10
nvm alias default 10
