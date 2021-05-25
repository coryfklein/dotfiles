pwd() {
  RES=$(command pwd)
  echo $RES | tr -d '\n' | pbcopy
  echo $RES
}

# "git file" - copies to the clipboard a url that will take you to the file in GitHub
gf() {
  RES=$(git ls-files | grep $1 | ~/bin/git-find-url/git-find-url $1)
  echo $RES
  echo -n $RES | pbcopy
}

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
  IFS='' read -r -d '' TEMPLATE <<"EOF"
Worked On Yesterday:

Worked On Today:

Planned For Today:

Next Up:

Notes:
EOF

  LOGBOOK=$HOME/logbook
  if [ ! -d $LOGBOOK ]; then
    mkdir $LOGBOOK
  fi

  # From https://stackoverflow.com/questions/5383927/bash-shell-script-for-yesterdays-date-last-working-day
  DAY_OR_WEEK=`date +%w`
  if [ $DAY_OR_WEEK == 1 ] ; then
    LOOK_BACK=3
  else
    LOOK_BACK=1
  fi

  YESTERDAY=$LOGBOOK/$(gdate -d "$LOOK_BACK day ago" '+%Y-%m-%d').md
  TODAY=$LOGBOOK/$(date '+%Y-%m-%d').md

  if [ ! -f $TODAY ]; then
    echo $TEMPLATE > $TODAY
  fi
  if [ ! -f $YESTERDAY ]; then
    echo $TEMPLATE > $YESTERDAY
  fi

  vim -O "+let g:auto_save=1" $TODAY $YESTERDAY
}

f() {
  FILE=$(find . -name $1)
  if [ -n "$FILE" ]; then
    ABSOLUTE=$(greadlink -f $FILE)
  fi
  echo -n $ABSOLUTE | pbcopy
  echo $FILE
}

vf() {
  FILE=$(find . -name $1 | head -n1)
  vim $FILE
}

readlink() {
  greadlink --help &>/dev/null
  FILE=$(greadlink -fn $1)
  echo $FILE | tr -d "\r\n" | pbcopy
  echo $FILE
}
