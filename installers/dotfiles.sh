#!/usr/bin/env bash

###############################################################################
# Dotfiles
###############################################################################

SRC=${HOME}/git/dotfiles/home

# Install Dotfiles
git clone ssh://git@bitbucket.org/sppum/dotfiles.git ${HOME}/git/dotfiles

# Link the files if they don't already exist

cd ${HOME}/git/dotfiles/home
for i in $(find . -depth 1 | sed 's/.\///')
do
	if [[ -f "~/${i}" ]]; then
		echo "$i exists, skipping..."
	else
		echo "Linking ${SRC}/${i} to ~/$i"
		ln -sf "${SRC}/${i}" ~/"${i}"
	fi
done
