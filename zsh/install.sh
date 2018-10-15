#!/usr/bin/env bash
#
# Install any zsh-related files needed
echo 'Install zsh-related files'

# Install Google Cloud
curl -o $HOME/bin/google-cloud.tar.gz https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-182.0.0-darwin-x86_64.tar.gz
pushd $HOME/bin
tar -xzf google-cloud.tar.gz
./google-cloud-sdk/install.sh
rm google-cloud.tar.gz
popd

kubectl completion zsh > zsh/kubernetes-completion.zsh
