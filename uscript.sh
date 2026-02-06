#!/bin/bash
set -e

echo "➡ Actualizando sistema..."
sudo apt update
sudo apt upgrade -y

echo "➡ Instalando dependencias básicas..."
sudo apt install -y curl git flatpak gnome-software-plugin-flatpak

echo "➡ Configurando Flathub..."
flatpak remote-add --if-not-exists flathub \
https://dl.flathub.org/repo/flathub.flatpakrepo

echo "➡ Instalando aplicaciones Flatpak..."
flatpak install -y flathub \
com.bitwarden.desktop \
com.discordapp.Discord \
io.github.zen_browser.zen \
com.jetbrains.IntelliJ-IDEA-Community \
com.spotify.Client \
com.visualstudio.code

echo "➡ Instalando Brave Browser..."
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg \
https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] \
https://brave-browser-apt-release.s3.brave.com/ stable main" | \
sudo tee /etc/apt/sources.list.d/brave-browser-release.list

sudo apt update
sudo apt install -y brave-browser vlc virtualbox

echo ":white_check_mark: Instalación completada."

read -p "¿Reiniciar ahora? (s/n): " resp
if [[ "$resp" == "s" ]]; then
    sudo reboot
fi