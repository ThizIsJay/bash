#! /usr/bin/env bash
colors () {
	BLACK="\033[0;30m"
	RED="\033[0;31m"
	GREEN="\033[0;32m"
	BROWN="\033[0;33m"
	BLUE="\033[0;34m"
	PURPLE="\033[0;35m"
	CYAN="\033[0;36m"
	LGRAY="\033[0;37m"
	GRAY="\033[1;30m"
	LRED="\033[1;3m"
	LGREEN="\033[1;3m"
	YELLOW="\033[1;3m"
	LBLUE="\033[1;3m"
	LPURPLE="\033[1;3m"
	LCYAN="\033[1;3m"
	WHITE="\033[1;3m"
	RESET="\033[0m"
}

# Extraction Engine
function ex()
{
	if [ -f $1 ]; then
		case $1 in
      		 *.tar.bz2)   tar xjf $1   ;;
	         *.tar.gz)    tar xzf $1   ;;
		 *.tar.xz)    tar xJf $1   ;;
		 *.bz2)       bunzip2 $1   ;;
		 *.rar)       unrar x $1     ;;
		 *.gz)        gunzip $1    ;;
		 *.tar)       tar xf $1    ;;
		 *.tbz2)      tar xjf $1   ;;
		 *.tgz)       tar xzf $1   ;;
		 *.zip)       unzip $1     ;;
		 *.Z)         uncompress $1;;
		 *.7z)        7z x $1      ;;
		 *)           echo "'$1' kan niet uitgepakt worden door ex" ;;
  		 esac
 	 else
   		 echo "'$1' is geen goed bestand"
  fi
}

# Git Engine
function gt()
{
		case $1 in
			add) git add * ;;
			ls) git status ;;
			status) git status ;;
			restore) git restore;;
			discard) git discard;;
			rm) git rm $2;;
			pull) git pull;;
			pul) git pull;;
			upload) git commit -m "$2"; git push ;;
			up) git commit -m "$2"; git push ;;
		esac
}

# Package Manager

function PKGMANAGERS () {
	which apt >/dev/null 2>&1
	if [ $? -eq 0 ]; then
		export PKG=apt
	fi
	which pacman >/dev/null 2>&1
	if [ $? -eq 0 ]; then
		export PKG=pacman
	fi
	which dnf >/dev/null 2>&1
	if [ $? -eq 0 ]; then
		export PKG=dnf
	fi
	which emerge >/dev/null 2>&1
	if [ $? -eq 0 ]; then
		export PKG=portage
	fi
	which xbps-install >/dev/null 2>&1
	if [ $? -eq 0 ]; then
		export PKG=xbps
	fi
	which zypper >/dev/null 2>&1
	if [ $? -eq 0 ]; then
		export PKG=zypper
	fi

	if [[ $PKG = "apt" ]]; then APTD
	elif [[ $PKG = "pacman" ]]; then PACMAND
	elif [[ $PKG = "dnf" ]]; then DNFD
	elif [[ $PKG = "portage" ]]; then PORTD
	elif [[ $PKG = "xbps" ]]; then XBPSD
	elif [[ $PKG = "zypper" ]]; then ZYPPD
	else
		echo " Je packagemanager heeft geen support voor deze shortcuts"
	fi
}

function APTD () {
	alias apt='sudo apt-get -y'
	alias update='~/Repositories/Scripts/update'
	alias disup='sudo apt-get dist-upgrade -y'
	alias aptfix='sudo apt-get autoremove -y; sudo apt-get --fix-broken install -y'
}

function wifictl() {
	case $1 in
		connect) sudo nmcli dev wifi connect $2 password $3; echo -e "${GREEN} Verbonden";;
		disconnect) sudo nmcli radio wifi off; echo -e "${RED} Wifi is uitgeschakeld draai 'wifictl enable' om weer te activeren";;
		disable) sudo nmcli radio wifi off; echo -e "${RED} Wifi is uitgeschakeld draai 'wifictl enable' om weer te activeren";;
		enable) sudo nmcli radio wifi on; echo -e "${GREEN} Wifi uitgeschakeld";;
	esac
}

function ptsh () {
	PTPATH="$HOME/.local/bin"
	LSSRC="$PTPATH/ptls"
	if [ -f "$LSSRC" ]; then
		alias ls='ptls -lAh'
	else
		alias ls='/bin/ls -lAh'
	fi
	MKDSRC="$PTPATH/ptmkdir"
	if [ -f "$MKDSRC" ]; then
		alias mkdir='ptmkdir -p'
	else
		alias mkdir='/bin/mkdir -p'
	fi
	PWDSRC="$PTPATH/ptpwd"
	if [ -f "$PWDSRC" ]; then
		alias pwd='ptpwd'
	else
		alias pwd='/bin/pwd'
	fi
	TOUCHSRC="$PTPATH/pttouch"
	if [ -f "$TOUCHSRC" ]; then
		alias touch='pttouch'
	else
		alias touch='/bin/touch'
	fi
	RMSRC="$PTPATH/ptrm"
	if [ -f "$RMSRC" ]; then
		alias rm='ptrm -rf'
	else
		alias rm='/bin/rm -rf'
	fi

}
colors
PKGMANAGERS
ptsh
