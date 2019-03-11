# Install Google Tools

function main
	curl https://dl.google.com/dl/cloudsdk/channels/rapid/install_google_cloud_sdk.bash > install_google_cloud_sdk.bash
	bash ./install_google_cloud_sdk.bash  --disable-prompts --install-dir=$HOME/opt
	rm -f install_google_cloud_sdk.bash
end

main
