source ~/.aliases

platform=`uname | tr '[A-Z]' '[a-z]'`
if [[ $platform == *mingw* ]]
then
  echo windows
  # add git into path
  PATH=$PATH:$HOME/mozilla-build/git/bin
  export PATH=$PATH:$HOME/mozilla-build/Ruby200/bin
fi
