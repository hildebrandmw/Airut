#!/bin/bash

# From: https://stackoverflow.com/questions/59895/getting-the-source-directory-of-a-bash-script-from-within
# Get the directory of this script.
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

#####
##### Git stuff
#####

echo "Moving .gitignore/.gitconfig"
cp $DIR/../rc/.gitignore ~/.gitignore
cp $DIR/../rc/.gitconfig ~/.gitconfig

#####
##### .vimrc
#####

echo "Moving .vimrc"
cp "$DIR/../rc/.vimrc" ~

# Install vundle if it doesn't exist
#if [ ! -d ~/.vim/bundle/Vundle.vim ]; then
    echo "Installing Vundle"
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

    echo "Install VimCompleteMe"
    git clone https://github.com/ajh17/VimCompletesMe.git ~/.vim/pack/vendor/start/VimCompletesMe

    echo "Installing Vim plugins"
    vim +PluginInstall +qall

    #echo "Building YouCompleteMe"
    # install YouCompleteMe
    #~/.vim/bundle/YouCompleteMe/install.py
#fi

#####
##### it2copy
#####

# if [ ! -d ~/bin ]; then
#     mkdir ~/bin
#     cp $DIR/../rc/it2copy ~/bin/
# fi

#####
##### .zshrc
#####

echo "Moving .zshrc"
cp $DIR/../rc/.zshrc ~/.zshrc

#####
##### julia startup.jl
#####

echo "Moving startup.jl"
mkdir -p ~/.julia/config
cp "$DIR/../rc/startup.jl" ~/.julia/config/

#####
##### Ctagts
#####
echo "Moving ctags"
cp "$DIR/../rc/.ctags" ~/.ctags
