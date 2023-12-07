#!/bin/bash

stage="$1"
echo "Setuping configs..."

function symlinking () {
  stow -R git
  stow -R bash
  stow -R awesome
  stow -R alacritty
  stow -R nvim
}


if [ -z "$stage" ]
then
  symlinking

elif [ $stage == "link" ]
then symlinking
fi
