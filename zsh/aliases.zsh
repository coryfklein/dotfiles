# grc overides for ls
#   Made possible through contributions from generous benefactors like
#   `brew install coreutils`
alias reload!='. ~/.zshrc'
alias gw="./gradlew"
alias g="./gradlew"
alias k='kubectl'
alias ctug="/Users/coryklein/domo/tug/nodew /Users/coryklein/domo/tug/built/app/index.js"
alias gtug="/Users/coryklein/domo/tug/tug gui"
alias ..="cd ../.."
alias ...="cd ../../.."
alias ....="cd ../../../.."
alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ls -a'
alias cat='vimcat'
alias history='history 0'
alias sauce='shovel'
# Moved to functions since this doesn't support SAVE_VALUE=$(pwd)
# alias pwd="pwd | tr -d '\n' | tee /dev/tty | pbcopy"

if $(gls &>/dev/null)
then
  alias ls="gls --color"
  alias l="gls -lAh --color"
  alias ll="gls -lh --color"
  alias la='gls -Ah --color'
fi

alias rm="rm -f"
