kn() {
    kubectl config set-context $(kubectl config current-context) --namespace=$1
}

cf() {
    cd $(find . -name package_all.sh | xargs dirname | head -1)
}
