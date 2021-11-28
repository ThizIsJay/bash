#! /usr/bin/env bash

rm -rf $HOME/.config/bash
mkdir -p $HOME/.local/bin
git clone https://github.com/thizisjay/bash $HOME/.config/bash
sudo ln -sf $HOME/.config/bash/ptsh.d/ptls $HOME/.local/bin/ptls
sudo ln -sf $HOME/.config/bash/ptsh.d/ptmkdir $HOME/.local/bin/ptmkdir
sudo ln -sf $HOME/.config/bash/ptsh.d/ptpwd $HOME/.local/bin/ptpwd
sudo ln -sf $HOME/.config/bash/ptsh.d/ptrm $HOME/.local/bin/ptrm
sudo ln -sf $HOME/.config/bash/ptsh.d/pttouch $HOME/.local/bin/pttouch

echo "if [ -s $HOME/.config/bash/bashrc ]; then" | sudo tee -a /etc/bash.bashrc
echo "	. '$HOME/.config/bash/bashrc'; fi" | sudo tee -a /etc/bash.bashrc
