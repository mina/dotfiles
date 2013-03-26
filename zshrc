# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

#random theme
ZSH_THEME="robbyrussell"

#dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

if [ -f $ZSH/oh-my-zsh.sh ] ; then
  . $ZSH/oh-my-zsh
fi

# turn off zsh's autocorrect
unsetopt correct_all


# Plugins
plugins=(git brew osx rvm ruby gem rails3 rails)

# This loads RVM into a shell session.
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"


source ~/.aliases
source ~/.myconfigs
