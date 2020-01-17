# Source fzf scripts via via local installation.
if [ -e ~/.fzf ]; then
  append_to_path ~/.fzf/bin
fi

# Source fzf key bindings and auto-completion.
if [ -e /usr/local/opt/fzf/shell/completion.zsh ]; then
  # Source fzf scripts via Homebrew.
  source /usr/local/opt/fzf/shell/key-bindings.zsh
  source /usr/local/opt/fzf/shell/completion.zsh
elif [ -e /usr/share/doc/fzf/examples/key-bindings.zsh ]; then
  source /usr/share/doc/fzf/examples/key-bindings.zsh
elif [ -e ~/.fzf ]; then
  source ~/.fzf/shell/key-bindings.zsh
  source ~/.fzf/shell/completion.zsh
elif [ -f ~/.fzf.zsh ]; then
  # Auto-generated completion script when installing from custom path.
  source ~/.fzf.zsh
fi

# Use ~~ as the trigger sequence instead of the default **
export FZF_COMPLETION_TRIGGER='~~'

# Options to fzf command
export FZF_COMPLETION_OPTS='+c -x'

if has fd; then
  # Use fd for fzf.
  export FZF_DEFAULT_COMMAND='fd --type f --follow --hidden'
  # Use fd for fzf directory search.
  export FZF_ALT_C_COMMAND='fd --type d --color never'
elif has rg; then
  # Use ripgrep for fzf.
  export FZF_DEFAULT_COMMAND='rg --files --hidden'
fi
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Source fzf-cd plugin.
if [[ -f ~/.zsh-interactive-cd.plugin.zsh ]]; then
  source ~/.zsh-interactive-cd.plugin.zsh
fi

# Display source tree and file preview for CTRL-T and ALT-C.
if has tree; then
  # Show subdir tree for directories.
  export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"
fi

# Bind alt-j/k/d/u to moving the preview window for fzf.
export FZF_DEFAULT_OPTS="--bind alt-k:preview-up,alt-j:preview-down,alt-u:preview-page-up,alt-d:preview-page-down"

# Show previews for files and directories.
# Having `bat` or `highlight` (or any of the other binaries below) installed
# enables syntax highlighting.
export FZF_CTRL_T_OPTS="--preview '(bat --style=numbers --color=always {} || highlight -O ansi -l {} || coderay {} || rougify {} || cat {}) 2> /dev/null | head -200'"

if has bat; then
  # Export theme for http://github.com/sharkdp/bat.
  export BAT_THEME="TwoDark"
fi
