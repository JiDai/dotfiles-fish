function git_remove_all_tags -d "Remove all git tags local and origin"
   git tag -l | xargs -n 1 git push --delete origin
   git fetch
   git tag -l | xargs git tag -d
end
