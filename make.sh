#!/bin/sh
#installs dotfiles by creating symbolic link to them in the root directory
for file in *; do
	if test -s $file && [ $file != "ssh" ]
	then
		rm -rf ~/.${file}
	fi
	ln -s ~/dotfiles/${file} ~/.${file}
	done
#remove extra .make.sh file created
rm ~/.make.sh*
