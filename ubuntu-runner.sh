#!/bin/bash

#https://www.linuxtechi.com/how-to-install-gitlab-runner-on-ubuntu/
# provisioned EC2 Instance 
sudo apt update
curl -L "https://packages.gitlab.com/install/repositories/runner/gitlab-runner/script.deb.sh" | sudo bash
sudo apt install -y gitlab-runner podman
# >add podman runner config to the /etc/gitlab-runner/config.toml
sudo systemctl restart gitlab-runner
sudo gitlab-runner status