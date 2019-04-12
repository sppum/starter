#!/usr/bin/env bash

###############################################################################
# Dotfiles
###############################################################################

SRC=${HOME}/git/dotfiles/home

# Install Dotfiles
if [[ -d ${HOME}/git/dotfiles ]]; then
    cd ${HOME}/git/dotfiles && git pull
else
    git clone ssh://git@bitbucket.org/sppum/dotfiles.git ${HOME}/git/dotfiles
fi

# install tmux-plugin manager
if [[ -d ${HOME}/.tmux/plugins/tpm ]]; then
    cd ${HOME}/.tmux/plugins/tpm && git pull
else
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

# install tmux VPN plugin
if [[ -d ${HOME}/.tmux/plugins/tmux-vpn ]]; then
    cd ${HOME}/.tmux/plugins/tmux-vpn && git pull
else
    git clone https://github.com/jamesoff/tmux-vpn ~/.tmux/plugins/tmux-vpn
fi

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
