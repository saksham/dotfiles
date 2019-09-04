# (brew install pyenv pyenv-virtualenv)
eval "$(pyenv init -)";
eval "$(pyenv virtualenv-init -)";

# Due to https://github.com/pyenv/pyenv/issues/106
alias brew='env PATH=${PATH//$(pyenv root)\/shims:/} brew'
