#! /usr/bin/zsh

distro=$(awk -F '=' 'FNR == 3 { print $2 }' /etc/os-release)

#jq installation
echo "Installing jq"

if [[ distro -eq "arch" ]]; then
	sudo pacman -Syu jq
elif [[ distro -eq "ubuntu" ]];  then
	sudo apt install jq
fi

chmod +x gitfetch

echo "Copping into /usr/bin folder"

sudo cp gitfetch /usr/bin

