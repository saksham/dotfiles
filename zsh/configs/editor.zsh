# TODO: use nvim - I could not get the vim settings to be picked up by neovim yet
# # Use Neovim instead of classic vim (if available)
# if has nvim; then
#   alias vim="nvim"
#   alias vi="nvim"
# fi

export VISUAL=vim
export EDITOR=$VISUAL

# Decrease delay in entering normal mode in shell.
# https://www.johnhawthorn.com/2012/09/vi-escape-delays/
KEYTIMEOUT=1