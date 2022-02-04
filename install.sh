#!/bin/bash

distro=$(awk -F '=' 'FNR == 3 { print $2 }' /etc/os-release)

#jq installation
echo "Installing jq"

if [[ distro -eq "arch" ]]; then
	git clone https://aur.archlinux.org/ascii-image-converter-git.git
	cd ascii-image-converter-git/
	makepkg -si
	cd ..
	rm -rf ascii-image-converter-git
	sudo pacman -Syu jq
	
elif [[ distro -eq "ubuntu" ]];  then
	echo 'deb [trusted=yes] https://apt.fury.io/ascii-image-converter/ /' | sudo tee /etc/apt/sources.list.d/ascii-image-converter.list
	sudo apt update
	sudo apt install jq ascii-image-converter
fi

chmod +x gitfetch

echo "Copying into /usr/bin folder"

sudo cp gitfetch /usr/bin

