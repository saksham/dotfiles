# (brew install pyenv pyenv-virtualenv)
eval "$(pyenv init --path)";
eval "$(pyenv virtualenv-init -)";

# Due to https://github.com/pyenv/pyenv/issues/106
alias brew='env PATH=${PATH//$(pyenv root)\/shims:/} brew'

# Remove all .python-version files
alias rm-all-pyenv-dotfiles='find . -name .python-version | xargs -I {} rm -vf {}'
