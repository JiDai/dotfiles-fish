#!/usr/bin/env fish
# Switch the .env to production DB config (or restore the original).
# Run from the root of any project that has a .env and .env.production.example.
#
# Usage:
#   db-switch.fish activate    — backup .env, switch to prod DB
#   db-switch.fish deactivate  — restore original .env

set ROOT (pwd)
set ENV_FILE "$ROOT/.env"
set ENV_BACKUP "$ROOT/.env.backup"
set ENV_PROD "$ROOT/.env.production.example"

function sfdbswitch --description "[SF] Change .env to production DB config or restore the original"
	 if test "$argv[1]" = "activate"
		 if not test -f $ENV_PROD
			  echo "ERROR: $ENV_PROD not found. Are you in the right directory?" >&2
			  return 1
		 end

		 if not set -q AWS_PROD_DB_PASSWORD; or test -z "$AWS_PROD_DB_PASSWORD"
			  echo "ERROR: \$AWS_PROD_DB_PASSWORD is not set." >&2
			  return 1
		 end

		 if test -f $ENV_BACKUP
			  echo "ERROR: backup already exists ($ENV_BACKUP). Already on prod? Run 'db-switch.fish deactivate' first." >&2
			  return 1
		 end

		 cp $ENV_FILE $ENV_BACKUP
		 echo "Backup saved → .env.backup"

		 cp $ENV_PROD $ENV_FILE

		 sed -i '' "s|^DATABASE_PASSWORD=.*|DATABASE_PASSWORD=$AWS_PROD_DB_PASSWORD|" $ENV_FILE
		 sed -i '' "s|^DATABASE_USER=.*|DATABASE_USER=jordi|" $ENV_FILE

		 echo "Switched to production DB (user: jordi)."
		 echo "Run 'db-switch.fish deactivate' to restore."
		 touch "$ROOT/src/main.ts"
	 else if test "$argv[1]" = "deactivate"
		 if not test -f $ENV_BACKUP
			  echo "ERROR: no backup found ($ENV_BACKUP). Nothing to restore." >&2
			  return 1
		 end

		 mv $ENV_BACKUP $ENV_FILE
		 echo "Restored original .env."
		 touch "$ROOT/src/main.ts"
	 else
		  echo "Usage: sfdbswitch.fish activate|deactivate" >&2
		  return 1
	 end
end
