#!/usr/bin/env bash
#
# Install any zsh-related files needed
echo 'Install zsh-related files'

kubectl completion zsh > zsh/kubernetes-completion.zsh
