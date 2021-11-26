#! /usr/bin/env bash


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

