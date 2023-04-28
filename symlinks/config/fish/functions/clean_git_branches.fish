function clean_git_branches --description "Delete all branches that are not on remote"
	git branch -vv  | grep -v "master" | grep -v "develop" | grep 'origin/.*: gone]' | awk '{print $1}' | xargs git branch -D
end
