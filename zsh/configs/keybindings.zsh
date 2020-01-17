# give us access to ^Q
stty -ixon

# vi mode
bindkey -v
bindkey "^F" vi-cmd-mode

# key bindings for history search
bindkey '\e[3~' delete-char
bindkey '^R' history-incremental-search-backward

if has fzf; then
    fzf-history-widget-accept() {
        fzf-history-widget
        zle accept-line
    }
    zle     -N   fzf-history-widget-accept
    bindkey "^R" fzf-history-widget-accept
fi

# handy keybindings
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line
bindkey "^K" kill-line
bindkey "^P" history-search-backward
bindkey "^Y" accept-and-hold
bindkey "^N" insert-last-word
bindkey "^Q" push-line-or-edit
bindkey -s "^T" "^[Isudo ^[A" # "t" for "toughguy"
