#!/bin/bash

# Melhorar o rep RPM
sudo echo "fastestmirror=True" >> /etc/dnf/dnf.conf
sudo echo "max_parallel_downloads=10" >> /etc/dnf/dnf.conf
sudo echo "defaultyes=True" >> /etc/dnf/dnf.conf
sudo echo "keepcache=True" >> /etc/dnf/dnf.conf

# Limpar o dnf
sudo dnf clean all

# Update no sistema
sudo dnf update

# Instalar o RPM Fusion
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# Melhorando o rep
sudo dnf groupupdate core

# Habilitando o Flathub
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

# Instalar o driver da NVIDIA e CUDA
sudo dnf install akmod-nvidia xorg-x11-drv-nvidia-cuda xorg-x11-drv-nvidia-cuda-libs -y
sudo dnf install nvidia-vaapi-driver -y

# Corrigir os problemas de codec
sudo dnf swap ffmpeg-free ffmpeg --allowerasing -y
sudo dnf groupupdate multimedia --setop="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin -y
sudo dnf groupupdate sound-and-video -y
sudo dnf install amrnb amrwb faad2 flac gpac-libs lame libde265 libfc14audiodecoder mencoder x264 x265 ffmpegthumbnailer -y

# Lojas de apps (RPM Fusion e Flatpak)
sudo dnf install dnfdragora
sudo dnf install gnome-software 

# Player de midia
sudo dnf install vlc
