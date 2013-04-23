# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

#random theme
ZSH_THEME="robbyrussell"

#dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

source $ZSH/oh-my-zsh.sh

# turn off zsh's autocorrect
unsetopt correct_all

export EDITOR=vim
export PATH=$HOME/bin
export PATH=$PATH:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin
export PATH=$PATH:/Library/Frameworks/Python.framework/Versions/2.7/bin
export PATH=$PATH:/System/Library/Frameworks/Ruby.framework/Versions/1.8/usr/bin
export PATH=$PATH:/usr/local/mysql/bin
export PATH=$PATH:$HOME/.rvm/bin
export PATH=$PATH:/usr/local/go/bin # go path

export CDPATH=$CDPATH:`echo $HOME`/Repos:`echo $HOME`

# go path
export GOPATH=$HOME/Repos/mygo
export PATH=$PATH:/$HOME/Repos/mygo/bin
export GOROOT=/usr/local/go

platform=`uname`

if [[ $platform == "Linux" ]] ; then
  export CDPATH=$CDPATH:/home/mina/Repos
else
  export CDPATH=$CDPATH:/Users/mina/Repos
fi

export FCEDITOR=`which vim`

export PROMPT="$PROMPT%! "

source ~/.aliases

# Plugins
plugins=(git brew osx rvm ruby gem rails3 rails)

# This loads RVM into a shell session.
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
