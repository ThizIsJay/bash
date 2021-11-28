#! /usr/bin/env bash
echo "Lijst van gebruikers: "
ls -lAh /home/ | awk '{print $3}'
read -p 'Selecteer een gebruiker: ' myUser 2>&1

mkdir -p /home/$myUser/.config/bash/
wget https://raw.githubusercontent.com/ThizIsJay/bash/master/bashrc -O /home/$myUser/.config/bash/bashrc
wget https://raw.githubusercontent.com/ThizIsJay/bash/master/functions.sh -O /home/$myUser/.config/bash/functions.sh
wget https://raw.githubusercontent.com/ThizIsJay/bash/master/starship.toml -O /home/$myUser/.config/bash/starship.toml
sudo chown $myUser:users /home/$myUser/.config/bash
sudo chown $myUser:users /home/$myUser/.config/bash/bashrc
sudo chown $myUser:users /home/$myUser/.config/bash/functions.sh
sudo chown $myUser:users /home/$myUser/.config/bash/starship.toml
sudo cat > /etc/bash.bashrc <<EOF
if [ -s /home/$myUser/.config/bash/bashrc ]; then
        . '/home/$myUser/.config/bash/bashrc'; fi
EOF
