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

# Gerenciamento de flatpaks
flatpak install flathub com.github.tchx84.Flatseal

# Player de midia
sudo dnf install vlc

# Habilitando o Flathub
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

# Disabilitar Desktop Magnetic (Mouse Lag)
dconf dump / |grep mag

# Instalar aplicativos p/ jogos
flatpak install flathub com.valvesoftware.Steam
flatpak install flathub com.heroicgameslauncher.hgl
sudo dnf install lutris
flatpak install flathub com.usebottles.bottles
flatpak install flathub com.vysp3r.ProtonPlus
flatpak install flathub net.davidotek.pupgui2
sudo dnf install steam-devices

# Instalar aplicativos side-game
sudo dnf install obs-studio
sudo dnf install obs-studio-plugin-browser obs-studio-plugin-vlc-video obs-studio-plugin-vkcapture obs-studio-plugin-webkitgtk
sudo dnf install obs-studio-plugin-x264
sudo dnf install xorg-x11-drv-nvidia-cuda

# Outros aplicativos
flatpak install flathub org.gnome.gitlab.YaLTeR.VideoTrimmer
flatpak install flathub org.kde.kdenlive
flatpak install flathub org.upscayl.Upscayl
flatpak install flathub org.gimp.GIMP
flatpak install flathub com.obsproject.Studio.Plugin.waveform
flatpak install com.obsproject.Studio.Plugin.MoveTransition
flatpak install flathub dev.pulsar_edit.Pulsar
flatpak install flathub md.obsidian.Obsidian
flatpak install flathub com.discordapp.Discord
