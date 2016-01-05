# Use `hub` as our git wrapper:
#   http://defunkt.github.com/hub/
hub_path=$(which hub)
if (( $+commands[hub] ))
then
  alias git=$hub_path
fi

# The rest of my fun git aliases
alias gl='git pull --prune'
alias gpr='git pull --rebase'
alias grh='git reset --hard HEAD'
alias gaa="git add -A"
alias glog="git log --all --graph --pretty=format:'%C(bold blue)<%an>%Creset %Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%ci)%Creset' --abbrev-commit"
alias gp='git push origin HEAD'
alias gpt='git push origin --tags'
alias gd='git diff --color'
alias gdsubl='git diff | subl'
alias gc='git commit'
alias gca='git commit -a'
alias gcam='git commit -am'
alias gco='git checkout'
alias gpp='git push production master'
alias gps='git push staging development:master'
alias gb='git branch'
alias gfc='git diff --name-only | uniq | xargs subl'
alias gs='git status -sb' # upgrade your git if -sb breaks for you. it's fun.
alias grm="git status | grep deleted | awk '{\$1=\$2=\"\"; print \$0}' | \
           sed 's/^[ \t]*//' | sed 's/ /\\\\ /g' | xargs git rm"
