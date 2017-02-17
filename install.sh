#!/bin/sh

if [ ! -d "$HOME/.yadr" ]; then
    echo "Installing YADR for the first time"
    git clone https://github.com/underscorephil/dotfiles_old.git "$HOME/.yadr"
    cd "$HOME/.yadr"
    [ "$1" = "ask" ] && export ASK="true"
    rake install

    ## Install specific packages
    if [[ "$(uname)" == "Darwin" ]]; then
	sudo ./blueutil/Install.command
    fi
else
    echo "YADR is already installed"
fi
