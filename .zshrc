# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/rafael.moral/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

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

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

# START: Load nvm version from nvmrc
autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc
# END: Load nvm version from nvmrc


do_travis_login() {
  travis login -I -t $TRAVIS_TOKEN -e https://travis.mpi-internal.com/api --github-token=$GITHUB_TOKEN && travis endpoint --set-default -e https://travis.mpi-internal.com/api
}
encrypt_travis_secure() {
  travis encrypt ${1}=${2} -r scmspain/${3}
}
alias travislogin=do_travis_login
alias travisencrypt=encrypt_travis_secure

alias nr="npm run"
alias ni='npm install --prefer-online'
alias nri='rm -rf ./node_modules && rm -f package-lock.json && npm install --prefer-online --no-audit'
alias nri7='rm -rf ./node_modules && rm -f package-lock.json && npm install --legacy-peer-deps --prefer-online --no-audit'
alias git_update='git checkout $(git rev-parse --abbrev-ref HEAD) && git pull && git fetch -p && git delete-merged-branches'
alias gc='git checkout'

alias no_cors='open -n -a /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --args --user-data-dir=/tmp/chrome_dev_test --disable-web-security'

# MA MONOLITO
export MA_ENV=dev 

# Adevinta Registry token
export NPM_TOKEN=792708d9-05c5-45ab-8987-b1785b31498e
# FOR MT WEB APP
export DOCKER_USER=rafael.moral@adevinta.com
export DOCKER_PASSWORD=AKCp8hzXjzc3ecpyJqVRTDuxXUc8sab3Tpa8jswFC75bjHKxnH4wR1SGQrWYL1Tgb7icRJsTQ
# FOR MA WEB APP
export ARTIFACTORY_USER=rafael.moral@adevinta.com
export ARTIFACTORY_NPM_SECRET=cmFmYWVsLm1vcmFsQGFkZXZpbnRhLmNvbTpBS0NwOGh6WGp6YzNlY3B5SnFWUlREdXhYVWM4c2FiM1RwYThqc3dGQzc1YmpIS3huSDR3UjFTR1FyV1lMMVRnYjdpY1JKc1RR
export ARTIFACTORY_PWD=AKCp8hzXjzc3ecpyJqVRTDuxXUc8sab3Tpa8jswFC75bjHKxnH4wR1SGQrWYL1Tgb7icRJsTQ

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

export PATH="/usr/local/bin:/usr/local/sbin:$PATH"

source /usr/local/opt/chruby/share/chruby/chruby.sh
source /usr/local/opt/chruby/share/chruby/auto.sh

export NOW_TOKEN=G7NBsvOpPwRz0CW3cHAaGImU

export NVM_DIR=~/.nvm
  source $(brew --prefix nvm)/nvm.sh

# Function connect videocall
vc() { open "https://meet.schibsted.com/webapp/conference/es.mr${1}@vc.schibsted.com?callType=video" }
# added by travis gem
[ ! -s /Users/rafael.moral/.travis/travis.sh ] || source /Users/rafael.moral/.travis/travis.sh
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
