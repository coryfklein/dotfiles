# grc overides for ls
#   Made possible through contributions from generous benefactors like
#   `brew install coreutils`
alias reload!='. ~/.zshrc'
alias gw="./gradlew"
alias f='find . -name'
alias k='kubectl'
alias ctug="/Users/coryklein/domo/tug/nodew /Users/coryklein/domo/tug/built/app/index.js"
alias gtug="/Users/coryklein/domo/tug/tug gui"
alias ..="cd ../.."
alias ...="cd ../../.."
alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ls -a'
alias cat='vimcat'

if $(gls &>/dev/null)
then
  alias ls="gls --color"
  alias l="gls -lAh --color"
  alias ll="gls -lh --color"
  alias la='gls -Ah --color'
fi

greadlink --help &>/dev/null && alias readlink="greadlink -fn"

alias rm="rm -f"
