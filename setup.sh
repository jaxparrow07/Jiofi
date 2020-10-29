#!/usr/bin/bash

function Uninstall() {

	if [[ -f /usr/bin/JioUtils ]];then
		sudo rm /usr/bin/JioUtils
		echo "Removed Successfully"
		exit
	fi
	
}

function Showhelp() {
echo "
Use $0 --install to install to use it by 'JioUtils'
Use $0 --uninstall to uninstall if installed.

Use $0 --help to print this menu

Developed by Jaxparrow ( aka Jack )
_________________
\Developer KIDDO/"


}

function Install() {

	if [[ $installation == 2 ]];then
		echo "Install pip3 manually and try again later"
		exit
	fi

	if ! command -v pip3 &> /dev/null
	then
		echo "pip3 not installed"
		sudo apt install python3-pip
		if [[ $installation == 0 ]];then
			installation=1
		elif [[ $installation == 1 ]];then
			installation=2
		fi
		Install
	else
		pip3 install rich requests bs4

		if [[ -f /usr/bin/JioUtils ]];then
			sudo rm /usr/bin/JioUtils
		fi
		sudo cp JioUtils /usr/bin/JioUtils
		chmod +x /usr/bin/JioUtils
		echo "
Success : Installed Successfully
Info : Use command 'JioUtils' to use it anywhere"		
	fi


}


if  [[ $(whoami) == "root" ]];then
	case $1 in
		--install)
	Install;;
		--uninstall)
	Uninstall;;
		*)
	Showhelp
	esac
else
	if [[ $1 == "--help" ]];then
		Showhelp
		exit
	fi
	echo "Please run as root user"

fi



