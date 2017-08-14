# VI mode code configuration from modified @dougblackio who provided original at http://dougblack.io/words/zsh-vi-mode.html
bindkey -v
bindkey '^B' up-history
bindkey '^F' down-history
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward

bindkey    "^[[3~"          delete-char
bindkey    "^[3;5~"         delete-char
