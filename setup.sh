#!/bin/bash

# Shell script to set up sym links to my environment config
# files.

THIS_SCRIPT=$(readlink -f "$0")
THIS_DIRECTORY=$(dirname "$THIS_SCRIPT")

ln -fs "$THIS_DIRECTORY/.bashrc" ~/.bashrc
ln -fs "$THIS_DIRECTORY/.gitconfig" ~/.gitconfig
ln -fs "$THIS_DIRECTORY/.vimrc" ~/.vimrc
