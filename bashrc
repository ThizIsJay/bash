#! /usr/bin/env bash

DOTDIR="$HOME/.config/bash"
source $DOTDIR/functions.sh
source $DOTDIR/aliasrc.sh

eval "$(starship init bash)"
export STARSHIP_CONFIG=~/.config/bash/starship.toml

echo "異$(fortune)"

export PATH=~/.local/bin:$PATH
