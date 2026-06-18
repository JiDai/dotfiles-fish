function sfclaude --description "[SF] Start to work in worktree"
	set issue $argv[1]
	if test -n "$issue"
		wt-issue "$issue"
		wt-start
		echo "Worktree $issue started, Go to https://$issue.localhost"
	else
		echo "Please specify a issue"
		return 1
	end
end
