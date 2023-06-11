#!/bin/bash
# install 

# command
# if [ $? -eq 0 ]; then
#     echo "command success"
# else
#     echo "command failed"
# fi


brew --version
echo $SHELL
if [ $? -eq 0 ]; then
    echo "brew installed"
else
    echo "brew not installed"
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew install --cask iterm2
export ZSH_THEME="agnoster"