#!/bin/bash

stage="$1"
echo "Setuping configs..."

function symlinking () {
  echo "Symlinking: git"
  stow -R git

  echo "Symlinking: bash"
  stow -R bash

  echo "Symlinking: apps"
  stow -R apps
}


if [ -z "$stage" ]
then
  symlinking

elif [ $stage == "link" ]
then symlinking
fi
