#set git_bash
source ~/.bash_git
#git include path
export PATH="/usr/local/bin:$PATH"
#sublime text alias
alias subl = 'open -a Sublime\ Text\ 2'

# Set CLICOLOR if you want Ansi Colors in iTerm2 
  export CLICOLOR=1

# Set colors to match iTerm2 Terminal Colors
 export TERM=xterm-256color

export PS1='`if [ $? = 0 ]; then echo "\[\033[01;32m\]✔"; else echo "\[\033[01;31m\]✘"; fi` \w\[\033[35m\]$(__git_ps1 " %s") \[\033[01;30m\]>\[\033[00m\] '
#rvm
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
#Nvm
[ -s $HOME/.nvm/nvm.sh ] && . $HOME/.nvm/nvm.sh # This loads NVM
