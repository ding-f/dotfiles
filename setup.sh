#!/usr/bin/env bash

echo "
=================================
=     Welcome To My Install     =
=           Script! 🗒️          =
=================================

"

echo "Did you choose en_US.UTF-8?"
echo "As your locale?"
echo "1) yes"
echo "2) no"
echo "Respond with anything else and 1 is selected"
read LOCALEOPTION
case $LOCALEOPTION in
1)
    localectl set-locale LANG="en_US.UTF-8"
    localectl set-locale LC_TIME="en_US.UTF-8"
    localectl set-keymap us
  ;;
2)
    sudo vim /etc/locale.conf;;
*)
    localectl set-locale LANG="en_US.UTF-8"
    localectl set-locale LC_TIME="en_US.UTF-8"
    localectl set-keymap us
  ;;
esac

echo "
=================================
=         Setup Pacman          =
=================================

Add whatever you want, I recommend
ILoveCandy & parrallel downloads

YOU MUST ENABLE MULTILIB

"

sleep 3
sudo vim /etc/pacman.conf

echo "
=================================
=       Update The System       =
=================================

"

sudo pacman -Syyu

echo "
=================================
=     Which Graphics Card?      =
=================================

1) Intel
2) AMD
3) Nvidia
Defaults to AMD if you choose
something else

"

read GRAPHICSCARD
case $GRAPHICSCARD in
1)
  pacman -S xf86-video-intel mesa lib32-mesa lib32-vulkan-intel vulkan-intel;;
2)
  pacman -S xf86-video-amdgpu mesa lib32-mesa vulkan-radeon lib32-vulkan-radeon libva-mesa-driver lib32-libva-mesa-driver mesa-vdpau lib32-mesa-vdpau;;
3)
  pacman -S nvidia-dkms nvidia-utils;;
*)
  pacman -S xf86-video-amdgpu mesa lib32-mesa vulkan-radeon lib32-vulkan-radeon libva-mesa-driver lib32-libva-mesa-driver mesa-vdpau lib32-mesa-vdpau;;
esac

echo "
=================================
=      Installing Packages      =
=           & Dotfiles          =
=================================

"

sudo pacman -S ydotool wl-clipboard hyprland xdg-desktop-portal-hyprland vivaldi \
socat mpv firefox kitty thunar btop vim pavucontrol starship \
pipewire-pulse pipewire wireplumber obs-studio qt5ct kvantum git waybar lsd \
cmatrix lolcat yadm polkit-gnome gimp blender steam libnotify terminus-font \
lm_sensors pacman-contrib grim slurp discord virt-manager v4l2loopback-dkms \
v4l2loopback-utils v4l-utils unzip unrar xarchiver bash-completion qemu \
audacity mpd ario
git clone https://aur.archlinux.org/nwg-look.git
cd nwg-look
makepkg -si
cd ..
rm -rf nwg-look
git clone https://aur.archlinux.org/swaync.git
cd swaync
makepkg -si
cd ..
rm -rf swaync
git clone https://aur.archlinux.org/swww.git
cd swww
makepkg -si
cd ..
rm -rf swww
git clone https://aur.archlinux.org/fastfetch.git
cd fastfetch
makepkg -si
cd ..
rm -rf fastfetch
git clone https://aur.archlinux.org/tofi.git
cd tofi
makepkg -si
cd ..
rm -rf tofi
cd /home/$USER
rm .bashrc
rm .bash_profile
rm .profile
yadm clone -f https://gitlab.com/zaney/dotfiles.git
cd

echo "
=================================
=       Starting Services       =
=================================

"

sudo systemctl enable libvirtd.service
sudo systemctl enable libvirtd.socket
sudo systemctl start libvirtd.service
sudo systemctl start virtlogd.service
sudo usermod -aG libvirt $USER
sudo sh -c "echo 'FONT=ter-u28n' >> /etc/vconsole.conf"

echo "
=================================
=        You're All Set!        =
=================================

Thank you for using my script!

"
