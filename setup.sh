#!/bin/bash

SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"
current=$PWD

printf "init submodules... "
cd $SCRIPTPATH && git submodule init
cd $SCRIPTPATH && git submodule update --recursive --remote
printf "\e[32m✔\e[39m"
echo ""
printf "stowing stow... "
echo "--target=${HOME}" > stow/.stowrc
stow stow
printf "\e[32m✔\e[39m \n\n"
echo "Donerino 😁"
echo "now you can use stow [module]"
echo "example: stow zsh vim"
