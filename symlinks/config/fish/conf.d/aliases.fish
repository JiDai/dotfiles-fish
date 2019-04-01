# Shortcuts

alias _="sudo"
alias g="git"
alias v="vim"
alias rr="rm -rf"

if type -q $file
  hub; AND eval (hub alias -s) # alias git=hub
end


############################################
### MA
#

alias ma='cd $MA_FOLDER'
alias www='cd $MA_REPOSITORY/apps/www'
alias site='cd $MA_REPOSITORY/apps/www/www/frontend/site'
alias react='cd $MA_REPOSITORY/apps/www/www/frontend/react'
alias common='cd $MA_REPOSITORY/apps/www/www/frontend/common'
alias mypro='cd $MA_REPOSITORY/apps/MyPro'
alias portfolio='cd $MA_REPOSITORY/apps/Portfolio/portfolio/frontend'
alias jinjacommon='cd $MA_REPOSITORY/apps/JinjaCommon'
alias tools='cd $MA_REPOSITORY/apps/FollowUp/followup/frontend'
alias envdev='cd $MA_REPOSITORY/tools/env-dev'

alias selenium-chrome="open vnc://localhost:secret@localhost:5900"
alias jira="JIRA_USERNAME=jdosne@meilleursagents.com JIRA_PASSWORD=YyHLWkBoKSDwadegQOAs node /Users/jordid/GitHome/jira-burndown/index.js"


############################################
### cd
#

alias plop="cd $HOME"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias cd.='cd (readlink -f .)'


############################################
### tree
#
alias tree="tree -A"
alias treed="tree -d"
alias tree1="tree -d -L 1"
alias tree2="tree -d -L 2"

############################################
### rsync
#
alias rsync="rsync -vh"

############################################
### npm
#
alias npmi="npm install"
alias npmu="npm uninstall"
alias npms="npm start"
alias npmr="npm run"

############################################
### GIT
#

set _git_log_medium_format '%CboldCommit:%Creset %Cgreen%H%Cred%d%n%CboldAuthor:%Creset %Ccyan%an <%ae>%n%CboldDate:%Creset   %Cblue%ai %ar%Creset%n%+B'
set _git_log_oneline_format '%Cgreen%h%Creset %s%Cred%d%Creset%n'
set _git_log_brief_format '%Cgreen%h%Creset %s%n%Cblue%ar by %an%Cred%d%Creset%n'
set _git_status_ignore_submodules 'all'

function git-branch-current
    set -l branch (git branch 2> /dev/null | grep -e '\* ' | sed 's/^..\(.*\)/\1/')
    echo $branch
end


alias g='git'
# Branch (b)
alias gb='git branch'
alias gba='git branch --all --verbose'
alias gbc='git checkout -b'
alias gbd='git branch --delete'
alias gbD='git branch --delete --force'
alias gbl='git branch --verbose'
alias gbL='git branch --all --verbose'
alias gbm='git branch --move'
alias gbM='git branch --move --force'
alias gbr='git branch --move'
alias gbR='git branch --move --force'
alias gbs='git show-branch'
alias gbS='git show-branch --all'
alias gbv='git branch --verbose'
alias gbV='git branch --verbose --verbose'
alias gbx='git branch --delete'
alias gbX='git branch --delete --force'
# Commit (c)
alias gc='git commit --verbose'
alias gca='git commit --verbose --all'
alias gcm='git commit --message'
alias gcS='git commit -S --verbose'
alias gcSa='git commit -S --verbose --all'
alias gcSm='git commit -S --message'
alias gcam='git commit --all --message'
alias gco='git checkout'
alias gcO='git checkout --patch'
alias gcf='git commit --amend --reuse-message HEAD'
alias gcSf='git commit -S --amend --reuse-message HEAD'
alias gcF='git commit --verbose --amend'
alias gcSF='git commit -S --verbose --amend'
alias gcp='git cherry-pick --ff'
alias gcP='git cherry-pick --no-commit'
alias gcr='git revert'
alias gcR='git reset "HEAD^"'
alias gcs='git show'
alias gcl='git-commit-lost'
# Conflict (C)
alias gCl='git --no-pager diff --name-only --diff-filter=U'
alias gCa='git add (gCl)'
alias gCe='git mergetool (gCl)'
alias gCo='git checkout --ours --'
alias gCO='gCo (gCl)'
alias gCt='git checkout --theirs --'
alias gCT='gCt (gCl)'
# Data (d)
alias gd='git ls-files'
alias gdc='git ls-files --cached'
alias gdx='git ls-files --deleted'
alias gdm='git ls-files --modified'
alias gdu='git ls-files --other --exclude-standard'
alias gdk='git ls-files --killed'
alias gdi='git status --porcelain --short --ignored | sed -n "s/^!! //p"'
# Fetch (f)
alias gf='git fetch'
alias gfa='git fetch --all'
alias gfc='git clone'
alias gfcr='git clone --recurse-submodules'
alias gfm='git pull'
alias gfr='git pull --rebase'
# Index (i)
alias gia='git add'
alias giA='git add --patch'
alias giu='git add --update'
alias gid='git diff --no-ext-diff --cached'
alias giD='git diff --no-ext-diff --cached --word-diff'
alias gii='git update-index --assume-unchanged'
alias giI='git update-index --no-assume-unchanged'
alias gir='git reset'
alias giR='git reset --patch'
alias gix='git rm -r --cached'
alias giX='git rm -rf --cached'
# Log (l)
alias gl='git log --topo-order --pretty=format:"$_git_log_medium_format"'
alias glm='git log --topo-order --stat --pretty=format:"$_git_log_medium_format"'
alias gld='git log --topo-order --stat --patch --full-diff --pretty=format:"$_git_log_medium_format"'
alias glo='git log --topo-order --pretty=format:"$_git_log_oneline_format"'
alias glg='git log --topo-order --all --graph --pretty=format:"$_git_log_oneline_format"'
alias glb='git log --topo-order --pretty=format:"$_git_log_brief_format"'
alias glc='git shortlog --summary --numbered'
alias glh='git log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%Creset" --abbrev-commit --date=relative master..HEAD'
# Merge (m)
alias gm='git merge'
alias gmC='git merge --no-commit'
alias gmF='git merge --no-ff'
alias gma='git merge --abort'
alias gmt='git mergetool'
# Push (p)
alias gp='git push'
alias gpf='git push --force-with-lease'
alias gpF='git push --force'
alias gpa='git push --all'
alias gpA='git push --all; AND git push --tags'
alias gpt='git push --tags'
alias gpc='git push --set-upstream origin "(git-branch-current 2> /dev/null)"'
alias gpp='git pull origin "(git-branch-current 2> /dev/null)"; AND git push origin "(git-branch-current 2> /dev/null)"'
# Rebase (r)
alias gr='git rebase'
alias gra='git rebase --abort'
alias grc='git rebase --continue'
alias gri='git rebase --interactive'
alias grs='git rebase --skip'
# Remote (R)
alias gR='git remote'
alias gRl='git remote --verbose'
alias gRa='git remote add'
alias gRx='git remote rm'
alias gRm='git remote rename'
alias gRu='git remote update'
alias gRp='git remote prune'
alias gRs='git remote show'
alias gRb='git-hub-browse'
# Stash (s)
alias gs='git stash'
alias gsa='git stash apply'
alias gsx='git stash drop'
alias gsX='git-stash-clear-interactive'
alias gsl='git stash list'
alias gsL='git-stash-dropped'
alias gsd='git stash show --patch --stat'
alias gsp='git stash pop'
alias gsr='git-stash-recover'
alias gss='git stash save --include-untracked'
alias gsS='git stash save --patch --no-keep-index'
alias gsw='git stash save --include-untracked --keep-index'
# Submodule (S)
alias gS='git submodule'
alias gSa='git submodule add'
alias gSf='git submodule foreach'
alias gSi='git submodule init'
alias gSI='git submodule update --init --recursive'
alias gSl='git submodule status'
alias gSm='git-submodule-move'
alias gSs='git submodule sync'
alias gSu='git submodule foreach git pull origin master'
alias gSx='git-submodule-remove'
# Tag (t)
alias gt='git tag'
alias gtl='git tag -l'
# Working Copy (w)
alias gws='git status --ignore-submodules=$_git_status_ignore_submodules --short'
alias gwS='git status --ignore-submodules=$_git_status_ignore_submodules'
alias gwd='git diff --no-ext-diff'
alias gwD='git diff --no-ext-diff --word-diff'
alias gwr='git reset --soft'
alias gwR='git reset --hard'
alias gwc='git clean -n'
alias gwC='git clean -f'
alias gwx='git rm -r'
alias gwX='git rm -rf'
