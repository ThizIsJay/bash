#! /usr/bin/env bash

DOTDIR="$HOME/.config/bash"
source $DOTDIR/functions.sh
eval "$(starship init bash)"
export STARSHIP_CONFIG=~/.config/bash/starship.toml
