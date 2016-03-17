#!/bin/bash

# Script desarrollado por Francisco Sanchez 
# Automatización para la instalacion de ruby on rails
# Ruby en la version: 2.2.3
# Rails en la version: 4.2.4
# Este script considera BASH, si utiliza ZSH debe modificar los parametros.

# Primero instalamos las dependencias de Ruby
echo -e "[+] Ejecutando update."
sudo apt-get update
echo -e "[+] Instalando dependencias."
sudo apt-get install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev

# Sengundo, Instalamos "rbenv" y Ruby

# Install rbenv
echo -e "[+] Instalando rbenv y Ruby"

cd
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
exec $SHELL

# Install plugins
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
exec $SHELL

git clone https://github.com/rbenv/rbenv-gem-rehash.git ~/.rbenv/plugins/rbenv-gem-rehash

# Instalando ruby
rbenv install 2.2.3
# Configurando global
rbenv global 2.2.3
# Verificando la version de ruby e instalación de Ruby
echo -e "Verificando la version e instalacion de Ruby"
ruby -v

# Tercero ejecutamos bundler
echo -e "[+] Ejecutando bundler"
gem install bundler

# Cuarto instalamos Rails
echo -e "Inicia instalacion de Rails"

echo -e "Instalando nodejs"
curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -
sudo apt-get install -y nodejs

echo -e "Instalando rails en su version 4.2.4"
gem install rails -v 4.2.4

# Ejecutar luego de instalar un bin de Ruby o correr bundle en rbenv
rbenv rehash

echo -e "Verificando la version e instalacion de Rails"
rails -v