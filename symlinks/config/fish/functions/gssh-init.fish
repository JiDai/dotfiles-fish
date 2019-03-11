function gssh_init
  if ! type -f gcloud
     echo "gcloud command is not installed"
     exit 1
  end

  gcloud compute config-ssh --ssh-config-file=$HOME/.ssh/ma-dev.config --ssh-key-file=~/.ssh/id_rsa --project=ma-dev2
  gcloud compute config-ssh --ssh-config-file=$HOME/.ssh/ma-staging.config --ssh-key-file=~/.ssh/id_rsa --project=ma-staging-162909
  #gcloud compute config-ssh --dry-run --ssh-config-file=$HOME/.ssh/ma-prod.config --ssh-key-file=~/.ssh/id_rsa --project=ma-prod
  echo "Done!"
  echo
  echo "Add these two rows in your SSH config : "
  echo
  echo "Include ma-staging.config"
  echo "Include ma-dev.config"
end
