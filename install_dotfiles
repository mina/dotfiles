#!/usr/bin/env python

if __name__ == "__main__":
  import sys
  import re
  import os

  files = [ "gitconfig", "vim", "vimrc", "zshrc", "myconfigs", "bash_profile" ]


  if (re.search(r"(linux|darwin)", sys.platform)):
    print "Running on on linux or Mac. including tmux.conf"
    files.append("tmux.conf")

  for file in files:
    fullpath = os.environ['HOME'] + "/." + file

    if os.path.exists(fullpath):
      print "Removing %s... " % fullpath
      os.remove(fullpath)
    else:
      print "File %s not found..." % fullpath

    source = (os.environ['HOME'] + "/." + file)
    dest = os.path.realpath(os.path.dirname(__file__)) + "/" + file
    print "linking " + source + " to " + dest

    os.symlink(dest, source)
