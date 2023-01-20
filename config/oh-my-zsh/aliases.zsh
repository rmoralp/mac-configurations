# Yarn stuff
alias yr='yarn run'
alias yi='yarn install'
alias ya='yarn add'
alias yri='rm -rf ./node_modules && rm -rf yarn.lock && yarn install'

# Npm stuff
alias rc='npx npmrc'
alias nr='npm run'
alias ni='npm install'
alias nis='npm install --save'
alias nid='npm install --save-dev'
alias nri='rm -rf ./node_modules && rm -f package-lock.json && npm install --prefer-online --no-audit'

# Git stuff
alias gc='git checkout'
alias gco='git commit -m'
alias gup='git checkout $(git rev-parse --abbrev-ref HEAD) && git pull && git fetch -p && git delete-merged-branches'

# Chrome
alias chrome='open -a "/Applications/Google Chrome.app" --args --force-renderer-accessibility'
alias chrome_sd='open -n -a /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --args --user-data-dir=/tmp/chrome_dev_test --disable-web-security'

# Directory navigation
alias p='cd ~/projects/'