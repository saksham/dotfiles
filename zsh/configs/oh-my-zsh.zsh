# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

## Powerlevel9 Settings: iTerm + Hack Regular Nerd Font 13 + Solarized theme
POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_PROMPT_ON_NEWLINE='true'
POWERLEVEL9K_RPROMPT_ON_NEWLINE='true'
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="%F{blue}\u256D\u2500%F{white}"
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%F{blue}\u2570\uf460%F{white} "
POWERLEVEL9K_VIRTUALENV_FOREGROUND='black'
POWERLEVEL9K_VIRTUALENV_BACKGROUND='white'
POWERLEVEL9K_VIRTUALENV_VISUAL_IDENTIFIER_COLOR='none'
POWERLEVEL9K_PYTHON_ICON=''
POWERLEVEL9K_SHORTEN_DIR_LENGTH=4
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_beginning"
POWERLEVEL9K_SHORTEN_DELIMITER="\u2026"
POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND='blue'
POWERLEVEL9K_STATUS_OK_IN_NON_VERBOSE=true
POWERLEVEL9K_STATUS_VERBOSE=false
POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=0
POWERLEVEL9K_COMMAND_EXECUTION_TIME_BACKGROUND='none'
POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND='blue'
POWERLEVEL9K_VCS_GIT_ICON=$'\uf1d2 '
POWERLEVEL9K_VCS_GIT_GITHUB_ICON=$'\uf113 '
POWERLEVEL9K_VCS_BRANCH_ICON=$''
POWERLEVEL9K_VCS_STAGED_ICON=$'\uf055'
POWERLEVEL9K_VCS_UNSTAGED_ICON=$'\uf421'
POWERLEVEL9K_VCS_UNTRACKED_ICON=$'\uf00d'
POWERLEVEL9K_VCS_INCOMING_CHANGES_ICON=$'\uf0ab '
POWERLEVEL9K_VCS_OUTGOING_CHANGES_ICON=$'\uf0aa '
POWERLEVEL9K_VCS_SHORTEN_LENGTH=25
POWERLEVEL9K_VCS_SHORTEN_MIN_LENGTH=25
POWERLEVEL9K_VCS_SHORTEN_STRATEGY="truncate_from_right"
POWERLEVEL9K_VCS_SHORTEN_DELIMITER="\u2026"

# Powerlevel9K prompt segment for AWS
function prompt_aws_profile() {
  local color="none"
  case $AWS_PROFILE in
    *ops*) color="blue" ;;
    *dev*) color="green" ;;
    *stg*) color="yellow" ;;
    *prod*) color="red" ;;
  esac
  p10k segment -f "white" -b ${color} -t "$AWS_PROFILE" -c "$AWS_PROFILE"
}

# Powerlevel9K prompt segment for Openshift
function prompt_oc_context(){
  project=$(oc config view --minify --output 'jsonpath={..current-context}' 2>/dev/null)
  if [ $? -ne 0 ]; then
    return
  fi
  local color="none"
  case $project in
    dev*) color="green" ;;
    sandbox*) color="#808000" ;;
    uat*) color="yellow" ;;
    pre-prod*) color="#FFA500" ;;
    prod*) color="red" ;;
  esac

  p10k segment -f "white" -b "${color}" -t "$project" -c "$project"
}

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(
  os_icon
  rbenv
  nvm
  virtualenv
  ssh
  root_indicator
  dir
  vcs
)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(
  oc_context
  aws_profile
  status
  background_jobs
  command_execution_time
)

# Set name of the theme to load.
ZSH_THEME='powerlevel10k/powerlevel10k'

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=14

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Disable permissions and ownership warnings for auto completion
ZSH_DISABLE_COMPFIX="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  oc
  git
  nvm
  wd
  ssh-agent
  tmux
  tmuxinator
  docker
  git-flow
  fzf
  colored-man-pages
  zsh-nvm
  direnv
  rbenv
)

source $ZSH/oh-my-zsh.sh
