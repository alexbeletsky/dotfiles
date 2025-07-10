alias reload!='. ~/.zshrc'
alias rake='noglob rake'

alias npmw='npm run-script watch'
alias npmt='npm test'
alias npmtw='npm run-script test-watch'
alias npms='npm start'
alias npmrbl='npm run d:build && npm run d:login'

alias y='yarn'
alias yb='yarn && yarn build'
alias ys='yarn && yarn start'
alias yt='yarn test'
alias yst='yarn storybook'

alias mongodfts='mongod --setParameter textSearchEnabled=true'
alias mongodd='mongod --config /usr/local/etc/mongod.conf'

alias docker-kill-all='docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)'
alias docker-kill-all-images='docker rmi --force $(docker images -a -q)'

# ls, the common ones I use a lot shortened for rapid fire usage
alias l='ls -lFh'     #size,show type,human readable
alias la='ls -lAFh'   #long list,show almost all,show type,human readable
alias lr='ls -tRFh'   #sorted by date,recursive,show type,human readable
alias lt='ls -ltFh'   #long list,sorted by date,show type,human readable
alias ll='ls -l'      #long list
alias lss='ls -lX'  # sorted by type, then name
alias ldot='ls -ld .*'
alias lS='ls -1FSsh'
alias lart='ls -1Fcart'
alias lrt='ls -1Fcrt'
# Enhanced terminal development tools aliases
# Better file operations with eza
alias ls='eza --color=always --group-directories-first'
alias ll='eza -la --color=always --group-directories-first'
alias lt='eza -aT --color=always --group-directories-first'

# Better cat using bat
alias cat='bat'
alias less='bat --paging=always'

# Git shortcuts
alias gs='git status'
alias gd='git diff'
alias gl='git log --oneline --graph --decorate'
alias gco='git checkout'
alias gb='git branch'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gpl='git pull'

# File operations
alias ff='find . -name'
alias rg='rg --color=always'
alias fd='fd --color=always'

