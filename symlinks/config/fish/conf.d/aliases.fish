# Shortcuts

abbr g "git"
abbr v "vim"
abbr rr "rm -rf"
abbr ncdu "ncdu --color dark"

if type -q $file
  hub; AND eval (hub alias -s) # alias git=hub
end


############################################
### cd
#

abbr h "cd $HOME"
abbr .. "cd .."
abbr cd. 'cd (readlink -f .)'


############################################
### tree
#
abbr tree "tree -A"
abbr treed "tree -d"
abbr tree1 "tree -d -L 1"
abbr tree2 "tree -d -L 2"

############################################
### rsync
#
abbr rsync "rsync -vh"

############################################
### npm
#
abbr npmi "npm install"
abbr npmu "npm uninstall"
abbr npms "npm start"
abbr npmr "npm run"

############################################
### GIT
#

set _git_log_medium_format '%C(bold)Commit:%Creset %Cgreen%H%Cred%d%n%C(bold)Author:%Creset %C(cyan)%an <%ae>%n%C(bold)Date:%Creset   %Cblue%ai %ar%Creset%n%+B'
set _git_log_oneline_format '%Cgreen%h%Creset %s%Cred%d%Creset%n'
set _git_log_brief_format '%Cgreen%h%Creset %s%n%Cblue%ar by %an%Cred%d%Creset%n'
set _git_status_ignore_submodules 'all'

function git-branch-current
    set -l branch (git branch 2> /dev/null | grep -e '\* ' | sed 's/^..\(.*\)/\1/')
    echo $branch
end


abbr g 'git'
# Branch (b)
abbr gb 'git branch'
abbr gba 'git branch --all --verbose'
abbr gbc 'git checkout -b'
abbr gbd 'git branch --delete'
abbr gbD 'git branch --delete --force'
abbr gbl 'git branch --verbose'
abbr gbL 'git branch --all --verbose'
abbr gbm 'git branch --move'
abbr gbM 'git branch --move --force'
abbr gbr 'git branch --move'
abbr gbR 'git branch --move --force'
abbr gbs 'git show-branch'
abbr gbS 'git show-branch --all'
abbr gbv 'git branch --verbose'
abbr gbV 'git branch --verbose --verbose'
abbr gbx 'git branch --delete'
abbr gbX 'git branch --delete --force'
# Commit (c)
abbr gc 'git commit --verbose'
abbr gca 'git commit --verbose --all'
abbr gcm 'git commit --message'
abbr gcS 'git commit -S --verbose'
abbr gcSa 'git commit -S --verbose --all'
abbr gcSm 'git commit -S --message'
abbr gcam 'git commit --all --message'
abbr gco 'git checkout'
abbr gcO 'git checkout --patch'
abbr gcf 'git commit --amend --reuse-message HEAD'
abbr gcSf 'git commit -S --amend --reuse-message HEAD'
abbr gcF 'git commit --verbose --amend'
abbr gcSF 'git commit -S --verbose --amend'
abbr gcp 'git cherry-pick --ff'
abbr gcP 'git cherry-pick --no-commit'
abbr gcr 'git revert'
abbr gcR 'git reset "HEAD^"'
abbr gcs 'git show'
abbr gcl 'git-commit-lost'
# Conflict (C)
abbr gCl 'git --no-pager diff --name-only --diff-filter=U'
abbr gCa 'git add (gCl)'
abbr gCe 'git mergetool (gCl)'
abbr gCo 'git checkout --ours --'
abbr gCO 'gCo (gCl)'
abbr gCt 'git checkout --theirs --'
abbr gCT 'gCt (gCl)'
# Data (d)
abbr gd 'git ls-files'
abbr gdc 'git ls-files --cached'
abbr gdx 'git ls-files --deleted'
abbr gdm 'git ls-files --modified'
abbr gdu 'git ls-files --other --exclude-standard'
abbr gdk 'git ls-files --killed'
abbr gdi 'git status --porcelain --short --ignored | sed -n "s/^!! //p"'
# Fetch (f)
abbr gf 'git fetch'
abbr gfa 'git fetch --all'
abbr gfc 'git clone'
abbr gfcr 'git clone --recurse-submodules'
abbr gfm 'git pull'
abbr gfr 'git pull --rebase'
# Index (i)
abbr gia 'git add'
abbr giA 'git add --patch'
abbr giu 'git add --update'
abbr gid 'git diff --no-ext-diff --cached'
abbr giD 'git diff --no-ext-diff --cached --word-diff'
abbr gii 'git update-index --assume-unchanged'
abbr giI 'git update-index --no-assume-unchanged'
abbr gir 'git reset'
abbr giR 'git reset --patch'
abbr gix 'git rm -r --cached'
abbr giX 'git rm -rf --cached'
# Log (l)
abbr gl 'git log --topo-order --pretty=format:"$_git_log_medium_format"'
abbr glm 'git log --topo-order --stat --pretty=format:"$_git_log_medium_format"'
abbr gld 'git log --topo-order --stat --patch --full-diff --pretty=format:"$_git_log_medium_format"'
abbr glo 'git log --topo-order --pretty=format:"$_git_log_oneline_format"'
abbr glg 'git log --topo-order --all --graph --pretty=format:"$_git_log_oneline_format"'
abbr glb 'git log --topo-order --pretty=format:"$_git_log_brief_format"'
abbr glc 'git shortlog --summary --numbered'
abbr glh 'git log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%Creset" --abbrev-commit --date=relative master..HEAD'
# Merge (m)
abbr gm 'git merge'
abbr gmC 'git merge --no-commit'
abbr gmF 'git merge --no-ff'
abbr gma 'git merge --abort'
abbr gmt 'git mergetool'
# Push (p)
abbr gp 'git push'
abbr gpf 'git push --force-with-lease'
abbr gpF 'git push --force'
abbr gpa 'git push --all'
abbr gpA 'git push --all; AND git push --tags'
abbr gpt 'git push --tags'
abbr gpc "git push --set-upstream origin (git-branch-current 2> /dev/null)"
abbr gpp 'git pull origin "(git-branch-current 2> /dev/null)"; AND git push origin "(git-branch-current 2> /dev/null)"'
# Rebase (r)
abbr gr 'git rebase'
abbr gra 'git rebase --abort'
abbr grc 'git rebase --continue'
abbr gri 'git rebase --interactive'
abbr grs 'git rebase --skip'
# Remote (R)
abbr gR 'git remote'
abbr gRl 'git remote --verbose'
abbr gRa 'git remote add'
abbr gRx 'git remote rm'
abbr gRm 'git remote rename'
abbr gRu 'git remote update'
abbr gRp 'git remote prune'
abbr gRs 'git remote show'
abbr gRb 'git-hub-browse'
# Stash (s)
abbr gs 'git stash'
abbr gsa 'git stash apply'
abbr gsx 'git stash drop'
abbr gsX 'git-stash-clear-interactive'
abbr gsl 'git stash list'
abbr gsL 'git-stash-dropped'
abbr gsd 'git stash show --patch --stat'
abbr gsp 'git stash pop'
abbr gsr 'git-stash-recover'
abbr gss 'git stash save --include-untracked'
abbr gsS 'git stash save --patch --no-keep-index'
abbr gsw 'git stash save --include-untracked --keep-index'
# Submodule (S)
abbr gS 'git submodule'
abbr gSa 'git submodule add'
abbr gSf 'git submodule foreach'
abbr gSi 'git submodule init'
abbr gSI 'git submodule update --init --recursive'
abbr gSl 'git submodule status'
abbr gSm 'git-submodule-move'
abbr gSs 'git submodule sync'
abbr gSu 'git submodule foreach git pull origin master'
abbr gSx 'git-submodule-remove'
# Tag (t)
abbr gt 'git tag'
abbr gtl 'git tag -l'
# Working Copy (w)
abbr gws 'git status --ignore-submodules=$_git_status_ignore_submodules --short'
abbr gwS 'git status --ignore-submodules=$_git_status_ignore_submodules'
abbr gwd 'git diff --no-ext-diff'
abbr gwD 'git diff --no-ext-diff --word-diff'
abbr gwr 'git reset --soft'
abbr gwR 'git reset --hard'
abbr gwc 'git clean -n'
abbr gwC 'git clean -f'
abbr gwx 'git rm -r'
abbr gwX 'git rm -rf'
