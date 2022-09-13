#!/bin/bash
# Installation script for neovim 0.7.2 and my IDE-setup
# tested on Ubunutu 20.04

# Download and install neovim package
rm nvim-linux64.deb
wget https://github.com/neovim/neovim/releases/download/v0.7.2/nvim-linux64.deb
sudo killall apt apt-get
sudo apt-get install ./nvim-linux64.deb
rm nvim-linux64.deb

# Install supporting packages

sudo apt-get update
sudo apt-get upgrade -y


## Copy/paste between nvim and Ubunutu
sudo apt-get install -y xsel # for X11
sudo apt-get install -y wl-clipboard # for wayland

## Python support
sudo apt-get install -y pip
pip install pynvim

## Nodejs
sudo apt-get install -y npm
npm -i -g neovim
curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -
sudo apt-get install -y nodejs

## ripgrep
sudo apt-get install -y ripgrep

# Get config from git repo
if [ ! -d "~/.config/nvim" ]
then
	git clone https://github.com/niklarz/nvim-ide.git ~/.config/nvim/
else	
	git clone https://github.com/niklarz/nvim-ide.git tmp
	mv tmp/.git ~/.config/nvim
	rm -rf tmp
fi


## Install stylua for LSP
rm stylua-linux.zip
wget https://github.com/JohnnyMorganz/StyLua/releases/download/v0.14.3/stylua-linux.zip
sudo unzip stylua-linux.zip -d /usr/bin/
rm stylua-linux.zip
