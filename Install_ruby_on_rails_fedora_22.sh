#!/bin/bash

#
# Desarrollado por Francisco Sánchez.
# Script de instalacion de rbenv, ruby 2.2.3 , 
# rails (2.2.3), sobre zsh como terminal determinada.
# OS: GNU/Linux Fedora 22
#

echo -e "-> Ruby on rails\n"
echo -e "-> OS: fedora 22\n"
echo -e "-> Shell: zsh\n"
echo -e "-> Ruby 2.2.3\n"
echo -e "-> Rails 4.2.5\n"

# -- 	Install rbenv	--
echo -e "[+] Install rbenv\n"
# Git clone rbenv in ".rbenv" directory
git clone git://github.com/sstephenson/rbenv.git ~/.rbenv

# Define export PATH in ".zshrc" file
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.zshrc

# Init in ".zshrc" file
echo 'eval "$(rbenv init -)"' >> ~/.zshrc

# exec zsh shell
exec $SHELL

# --	Install ruby-build	--
# Make dir "plugins" in ".rbenv" directory
mkdir -p ~/.rbenv/plugins

# Change directory to ".rbenv/plugins"
cd ~/.rbenv/plugins

# Git clone ruby-bluild in ".rbenv/plugins" directory
git clone git://github.com/sstephenson/ruby-build.git

# Git clone "rbenv-gem-rehash" in ".rbenv/plugins/" directory
git clone https://github.com/sstephenson/rbenv-gem-rehash.git ~/.rbenv/plugins/rbenv-gem-rehash

# Reload variable enviroment
source ~/.zshrc

# --	Install ruby 	--
echo -e "[+] Install Ruby 2.2.3\n"
# rbenv install ruby 2.2.3 version
rbenv install 2.2.3

# rbenv define global 
rbenv global 2.2.3

# print ruby version
echo -e "[+] Ruby version\n"
ruby -v

# --	add "no ri" and "no doc" in new gems 	--	
# remove the rdoc and ri when installing new gems
echo -e "[+] add \"no-ri\" and \"no-rdoc\"\n"
echo "gem: --no-ri --no-rdoc" > ~/.gemrc
gem install bundler

# --	Install Rails 	--
echo -e "[+] Install Rails\n"
# Install gem rails 
gem install rails -v 4.2.5

# 
rbenv rehash

#
echo -e "[+] Rails version\n"
rails -v

# --	Install nodejs 	--
echo -e "[+] Install nodejs\n"
sudo dnf install nodejs

echo -e "Finish"