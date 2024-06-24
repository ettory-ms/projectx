#!/bin/bash

############################## BASIC PACKAGES INSTALLATION ##############################

sudo apt-get -y update && sudo apt-get -y upgrade
sudo apt-get install -y git			\
			alien			\
			perl			\
			make			\
			gcc			\
			g++			\
			curl			\
			wget			\
   			python3		
      

############################### SOFTWARES AND BROWSERS DOWNLOADS ################################################

# Install Brave

echo "######################### Start Brave Browser Installation #########################"

sudo apt-get install -y curl

sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list

sudo apt-get update

sudo apt-get install -y brave-browser


# Install Librewolf

echo "######################### Start Librewolf Browser Installation #########################"

sudo apt-get update && sudo apt-get install -y wget gnupg lsb-release apt-transport-https ca-certificates

distro=$(if echo " una bookworm vanessa focal jammy bullseye vera uma " | grep -q " $(lsb_release -sc) "; then lsb_release -sc; else echo focal; fi)

wget -O- https://deb.librewolf.net/keyring.gpg | sudo gpg --dearmor -o /usr/share/keyrings/librewolf.gpg

sudo tee /etc/apt/sources.list.d/librewolf.sources << EOF > /dev/null
Types: deb
URIs: https://deb.librewolf.net
Suites: $distro
Components: main
Architectures: amd64
Signed-By: /usr/share/keyrings/librewolf.gpg
EOF

sudo apt-get update

sudo apt-get install librewolf -y


# Install Powershell

echo "######################### Start Powershell Installation #########################"

cd ~/Downloads
sudo apt-get -y update
sudo apt-get install -y wget
wget https://github.com/PowerShell/PowerShell/releases/download/v7.4.3/powershell_7.4.3-1.deb_amd64.deb
sudo dpkg -i powershell_7.4.3-1.deb_amd64.deb
sudo apt-get install -f -y
rm powershell_7.4.3-1.deb_amd64.deb

# Install Virtualbox

echo "############################## Start Virtualbox Installation ##############################"

cd ~
wget https://download.virtualbox.org/virtualbox/7.0.18/virtualbox-7.0_7.0.18-162988~Debian~bookworm_amd64.deb
sudo dpkg -i virtualbox-7.0_7.0.18-162988~Debian~bookworm_amd64.deb
sudo apt-get install -f -y


# Install and Configure Kitty Terminal

echo "############################## Start Kitty Installation ##############################"


sudo apt-get install -y kitty

cd ~/Downloads/
git clone https://github.com/ettory-ms/kitty-config.git

echo "ATTENTION!!! Your Kitty Terminal file config are in ~/Downloads"
echo "Enjoy ProjectX! ;)"



