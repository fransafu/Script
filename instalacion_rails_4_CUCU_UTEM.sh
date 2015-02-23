#!/bin/bash

# Desarrollado por Francisco Sánchez, basado en la guia
# de procedimientos escrita por Fernando Rubilar para
# CUCU UTEM CHILE

echo -e "\t#########################"
echo -e "\t# Script de instalación #"
echo -e "\t# para Ruby on Rails 4. #"
echo -e "\t#   CUCU UTEM CHILE.    #"
echo -e "\t#########################"
echo -e "\n"

echo -e "[+] Iniciando instalación."
# Ejecutando update
echo -e "[+] Ejecutando update"
sudo apt-get update

# Ejecutando instalación de Ruby version 1.9.3
echo -e "[+] Instalando Ruby 1.9.3.\n"
sudo apt-get install ruby1.9.3

# Ejecutando instalación de la gema Rails
echo -e "[+] Instalando gema Rails."
echo -e "Esta acción se puede demorar unos minutos\n"
sudo gem install rails

# Ejecutando instalación de nodejs
echo -e "[+] Instalando nodejs.\n"
sudo apt-get install nodejs

# Ejecutando ciclo while para instalación de librerias
while [ true ]; do
	echo -e "Aquí debe elegir el motor de base de datos que utilizará : "
	echo -e "1) Sqlite."
	echo -e "2) Mysql."
	echo -e "3) Psql."
	echo -e "Ingrese una opción: "
	read opcion

	if [ $opcion = 1 ]; then
		echo -e "[+] Instalando libsqlite3-dev."
		sudo apt-get install libsqlite3-dev
		break
	else
		if [ $opcion = 2 ]; then
			echo -e "[+] Instalando libmysqld-dev."
			sudo apt-get install libmysqld-dev
			break
		else
			if [ $opcion = 3 ]; then
				echo -e "[+] Instalando libpq-dev."
				sudo apt-get install libpq-dev
				break
			else
				echo -e "Ingrese una opción valida.\n"
			fi
		fi
	fi
done

echo -e "Instalación finalizada, hasta pronto."
