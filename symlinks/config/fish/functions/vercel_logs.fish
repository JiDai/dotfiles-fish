function now_logs --description "Show runtime logs of latest deployment"
	if ! type -q vercel
		echo "Vercel CLI is not defined"
		return 1
	end

	if ! test -n "$argv[1]"
		echo "Please provide an app name"
		return 1
	end

	vercel logs -f -a (now ls | grep "$argv[1]" | awk '{print $2}')
end
