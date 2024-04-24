function sfdbschemaupdate --description "[SF] Download and update the graphql schema"
	npm --prefix $SF_PATH/services/frontends/packages/shared run download-graphql-schema
end
