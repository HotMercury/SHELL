#!/bin/bash
# install 

# command
# if [ $? -eq 0 ]; then
#     echo "command success"
# else
#     echo "command failed"
# fi


echo $SHELL
brew --version
if [ $? -eq 0 ]; then
    echo "brew installed"
else
    echo "brew not installed"
    # https://github.com/Homebrew/install
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# install git
if ! command -v git &> /dev/null
then
    echo "git installed"
else
    echo "git not installed"
    brew install git
fi

# install iterm2
if ! command -v iterm2 &> /dev/null
then
    echo "iterm2 installed"
else
    echo "iterm2 not installed"
    brew install --cask iterm2
fi

# install oh-my-zsh
if ! command -v zsh &> /dev/null
then
    echo "zsh not installed"
    brew install zsh
else
    echo "zsh installed"
fi 

# set Zsh as default shell
sudo sh -c "echo $(which zsh) >> /etc/shells"
chsh -s $(which zsh)
echo "zsh is default shell"

# auto complete
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

ZSHRC = "$HOME/.zshrc"
if ! grep -q "zsh-autosuggestions" "$ZSHRC"; then
    echo "zsh-autosuggestions not installed"
    sed -i '' 's/plugins=(git)/plugins=(git zsh-autosuggestions)/g' $ZSHRC
    echo "zsh-autosuggestions installed"    
else
    echo "zsh-autosuggestions installed"
fi


export ZSH_THEME="agnoster"
source $ZSHRC