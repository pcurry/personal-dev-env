# dev branch functions

function gcpd() {
    git checkout $(check_python_dev)
}

function gcsd() {
    git checkout $(check_salt_dev)
}

function grmcsd() {
    git checkout master
    git rebase master $(check_salt_dev)
}

# git aliases
alias gcm='git checkout master'
alias gd='git diff'
alias gfo='git fetch origin'
alias glog='git graphlog'
alias gpom='git pull origin master'
alias gstat='git status'
alias gupmaster='git checkout master; git fetch origin; git pull origin master'

# git autocomplete
source ~/shell-extensions/git-completion.bash

# descriptive git prompt - commented out because it breaks virtualenv prompt
# source ~/shell-extensions/git-prompt.sh
# PROMPT_COMMAND='__git_ps1 "\u@\h:\w" "\\\$ "'
# export PROMPT_COMMAND
# PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '
# export PS1
