#!/bin/bash

sudo apt install ripgrep fd-find
ln -s $(which fdfind) ~/.local/bin/fd
sudo apt install build-essential
