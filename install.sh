#! /usr/bin/env bash
echo "Lijst van gebruikers: "
ls -lAh /home/ | awk '{print $3}'
read -p 'Selecteer een gebruiker: ' myUser 2>&1
#git clone https://github.com/thizisjay/bash ~/.config/bash


sudo cat > /etc/bash.bashrc <<EOF
if [ -s /home/$myUser/.config/bash/bashrc ]; then
	. '/home/$myUser/.config/bash/bashrc'; fi
EOF
