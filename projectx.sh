#!/bin/bash


######################## Z SHELL DOWNLOAD ######################################

# Installation zsh dependencies

sudo apt-get -y update && sudo apt-get -y upgrade
sudo apt-get install -y git			\
			perl			\
			make			\
			gcc			\
			g++			\
			curl			\
			wget			\
			powerline		\
			fonts-powerline	

sudo mkdir /usr/local/bin/powerline
sudo git clone https://github.com/powerline/powerline.git /usr/local/bin/powerline/
sudo wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf -O /usr/share/fonts/PowerlineSymbols.otf
sudo wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf -O /etc/fonts/conf.d/10-powerline-symbols.conf
sudo echo './usr/local/bin/powerline/powerline/bindings/bash/powerline.sh' >> ~/.bashrc

sudo apt-get install zsh

# Installation oh-my-zsh

sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

sleep 2
echo $SHELL	# Verify if zsh is the default shell for the user
sudo chsh --shell /bin/zsh $(whoami) # define default shell for the current user logged in session

# Installing useful plugins for zsh

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
sudo apt-get install -y thefuck

# Add plugins in zsh config file

cd ~
sed -i "74s/plugins=(git)/plugins=(git colored-man-pages zsh-autosuggestions zsh-syntax-highlighting web-search)" ~/.zshrc
echo "alias mistake='thefuck'" >> ~/.zshrc
source ~/.zshrc

# Modify zsh theme

sed -i "11s/ZSH_THEME="robbyrussell"/ZSH_THEME="bira"" ~/.zshrc


############################### SOFTWARES AND BROWSERS DOWNLOADS ################################################

# Install Brave

sudo apt-get install -y curl

sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list

sudo apt-get update

sudo apt-get install -y brave-browser


# Install Librewolf

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

cd ~/Downloads
sudo apt-get -y update
sudo apt-get install -y wget
wget https://github.com/PowerShell/PowerShell/releases/download/v7.4.3/powershell_7.4.3-1.deb_amd64.deb
sudo dpkg -i powershell_7.4.3-1.deb_amd64.deb
sudo apt-get install -f -y
rm powershell_7.4.3-1.deb_amd64.deb
touch pwsh.zsh

echo "#!/bin/zsh

bash &
sleep 1
bash -c pwsh
exit 0
" >> pwsh.zsh

sudo mv pwsh.zsh /bin/

echo "alias pwsh='pwsh.zsh'" >> ~/.zshrc
source ~/.zshrc


# Install Virtualbox

cd ~
wget https://download.virtualbox.org/virtualbox/7.0.18/virtualbox-7.0_7.0.18-162988~Debian~bookworm_amd64.deb
sudo dpkg -i virtualbox-7.0_7.0.18-162988~Debian~bookworm_amd64.deb
sudo apt-get install -f -y


# Install and Configure Kitty Terminal

sudo apt-get install -y kitty

cd ~/Downloads/
git clone https://github.com/ettory-ms/kitty-config.git
cd kitty-config
mv kitty.conf ~/.config/kitty/

echo "Restart your Kitty if he's open!!!"
echo "Enjoy your Debian based distro! ;)"



