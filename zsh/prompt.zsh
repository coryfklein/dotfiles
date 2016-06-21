autoload colors && colors
# cheers, @ehrenmurdick
# http://github.com/ehrenmurdick/config/blob/master/zsh/prompt.zsh

if (( $+commands[git] ))
then
    git="$commands[git]"
else
    git="/usr/bin/git"
fi

git_dirty() {
    if $(! $git status -s &> /dev/null)
    then
        echo ""
    else
        if [[ $($git status --porcelain) == "" ]]
        then
            echo "(%{$fg_bold[green]%}$(git_prompt_info)%{$reset_color%})"
        else
            echo "(%{$fg_bold[red]%}$(git_prompt_info)%{$reset_color%})"
        fi
    fi
}

git_prompt_info () {
    ref=$($git symbolic-ref HEAD 2>/dev/null) || return
    if [[ $(unpushed) == "" ]]
    then
        UNPUSHED=""
    else
        UNPUSHED="%{$fg_bold[magenta]%}↑%{$reset_color%}"
    fi
    echo "${ref#refs/heads/}${UNPUSHED}"
}

unpushed () {
    $git cherry -v @{upstream} 2>/dev/null
}

directory_name() {
    echo "%~"
}

export PROMPT=$'$(directory_name)$(git_dirty)$ '
set_prompt () {
    export RPROMPT="%{$fg_bold[cyan]%}%{$reset_color%}"
}

precmd() {
    title "zsh" "%m" "%55<...<%~"
    set_prompt
    RPROMPT=""
}

function zle-line-init zle-keymap-select {
   VIM_PROMPT="%{$fg_bold[yellow]%} [% NORMAL]%  %{$reset_color%}"
   RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/} $EPS1"
   zle reset-prompt
}

# VI mode code configuration from modified @dougblackio who provided original at http://dougblack.io/words/zsh-vi-mode.html
bindkey -v
bindkey '^B' up-history
bindkey '^F' down-history
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward

zle -N zle-line-init
zle -N zle-keymap-select

export KEYTIMEOUT=1
