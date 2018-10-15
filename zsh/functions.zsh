kpw() {
    kubectl get pods -w --show-all=false | xargs -L1 printf "%-60s %-5s %-20s %-8s %-5s\n"
}

kgp() {
  if [ -z $1 ]; then
    kubectl get pods --show-all=false
  else
    kubectl get pods --show-all=false | grep $1
  fi
}

kdp() {
    kubectl get pods | grep $1 | awk '{print $1}' | xargs kubectl delete pods
}

wkgp() {
    watch "kubectl get pods | grep $1"
}

kn() {
    kubectl config set-context $(kubectl config current-context) --namespace=$1
}

ke() {
    POD=$(kubectl get po -o go-template --template '{{range .items}}{{.metadata.name}}{{"\n"}}{{end}}' | grep $1 | head -1)
    kubectl exec -it $POD sh
}

kl() {
    POD=$(kubectl get po -o go-template --template '{{range .items}}{{.metadata.name}}{{"\n"}}{{end}}' | grep $1 | head -1)
    kubectl logs -f $POD
}

kc() {
    kubectl config use-context $1
}

cf() {
    DIR=($(find . -name $1 -type d))
    LINES=${#DIR[@]}
    if [ $LINES -lt 1 ]; then
      echo $1 not found
    elif [ $LINES -gt 1 ]; then
      IFS=$'\n'
      DIR=($DIR)
      for i in `seq 1 $LINES`; do
        echo "$i ${DIR[$i]}"
      done
      echo "Which dir (default 1):"
      read DIRNUM
      DIRNUM=${DIRNUM:-1}
      cd ${DIR[$DIRNUM]}
    else
      cd $DIR
    fi
}

jlint() {
    pbpaste | python -m json.tool | vim -c 'set syntax=json' -
}

lb() {
    vim ~/logbook/$(date '+%Y-%m-%d').md
}

f() {
  FILE=$(find . -name $1)
  if [ -n "$FILE" ]; then
    ABSOLUTE=$(readlink -f $FILE)
  fi
  echo -n $ABSOLUTE | pbcopy
  echo $FILE
}

readlink() {
  greadlink --help &>/dev/null
  FILE=$(greadlink -fn $1)
  echo $FILE | tr -d "\r\n" | pbcopy
  echo $FILE
}
