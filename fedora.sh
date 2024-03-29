#!/bin/bash

sudo dnf update --refresh -y
sudo dnf install -y fedora-workstation-repositories
sudo dnf install -y gnome-tweaks 
sudo dnf install -y dnf-plugins-core
sudo dnf install -y flatpak
sudo dnf install -y \
  https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install -y \
  https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm


# utils??
sudo dnf install -y mc curl

# Docker
sudo dnf config-manager \
    --add-repo \
    https://download.docker.com/linux/fedora/docker-ce.repo
sudo dnf install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin
# Add user to docker group
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker
sudo systemctl enable docker
# if not
sudo systemctl is-active docker
# then
sudo systemctl start docker

# k8s

# terraform
sudo dnf install -y dnf-plugins-core
sudo dnf config-manager --add-repo https://rpm.releases.hashicorp.com/$release/hashicorp.repo
sudo dnf install -y terraform

# Ansible

# ffmpeg
sudo dnf install -y ffmpeg

# Chrome
sudo dnf config-manager --set-enabled google-chrome
sudo dnf install -y google-chrome-stable

# Steam
sudo dnf install -y steam --enablerepo=rpmfusion-nonfree-steam
sudo dnf install -y steam 

# Telegram
sudo dnf install -y telegram

# Viber
curl https://download.cdn.viber.com/desktop/Linux/viber.rpm --output viber.rpm
sudo dnf install -y ./viber.rpm
rm viber.rpm

# Skype
sudo curl -o /etc/yum.repos.d/skype-stable.repo https://repo.skype.com/rpm/stable/skype-stable.repo
sudo dnf install -y skypeforlinux

# KeepassXC
sudo dnf install -y keepassxc

# VSCode
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
dnf check-update
sudo dnf install -y code