alias reload!='. ~/.zshrc'
alias rake='noglob rake'

alias npmw='npm run-script watch'
alias npmt='npm test'
alias npmtw='npm run-script test-watch'
alias npms='npm start'

alias mongodfts='mongod --setParameter textSearchEnabled=true'
alias mongodd='mongod --config /usr/local/etc/mongod.conf'

alias docker-kill-all='docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)'

# ls, the common ones I use a lot shortened for rapid fire usage
alias l='ls -lFh'     #size,show type,human readable
alias la='ls -lAFh'   #long list,show almost all,show type,human readable
alias lr='ls -tRFh'   #sorted by date,recursive,show type,human readable
alias lt='ls -ltFh'   #long list,sorted by date,show type,human readable
alias ll='ls -l'      #long list
alias ldot='ls -ld .*'
alias lS='ls -1FSsh'
alias lart='ls -1Fcart'
alias lrt='ls -1Fcrt'