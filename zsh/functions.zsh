kn() {
    kubectl config set-context $(kubectl config current-context) --namespace=$1
}

kc() {
    kubectl config use-context $1
}

cf() {
    DIR=$(find . -name $1 | xargs dirname | head -1)
    if [[ -n $DIR ]]; then
        cd $DIR
    else
        echo $1 not found
    fi
}
