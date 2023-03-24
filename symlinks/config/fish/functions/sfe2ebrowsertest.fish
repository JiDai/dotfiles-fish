function sfe2ebrowsertest --description "[SF] Run a e2e test in chromium without closing"
	set -l tests "$argv[1]"
	if test -z "$tests"
		echo "Please specify a test"
		return 1
	end

	FRONTENDS_E2E_DISABLE_CLOSE_BROWSER=1 yarn run test:e2e-disable-headless $argv
end
