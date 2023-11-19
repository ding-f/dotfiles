#!/usr/bin/env bash

echo "
=================================
=      Welcome To Part Two!     =
=  Let's Make Sure The fstab Is =
=            Correct            =
=================================

Remove ALL subvolid=XXX entries
-rw,noatime,compress=zstd:4,space_cache=v2,subvolid=261,subvol=/@
+rw,noatime,compress=zstd:4,space_cache=v2,subvol=/@
-rw,noatime,compress=zstd:4,space_cache=v2,subvolid=261,subvol=/@home
+rw,noatime,compress=zstd:4,space_cache=v2,subvol=/@home
"

sleep 6
vim /etc/fstab

echo "
=================================
=      Enabling Time Sync       =
=================================

"

timedatectl set-ntp true

echo "
=================================
=     Country For Timezone      =
=================================

Like America, France, etc.

"

read COUNTRYTZ

echo "
=================================
=       City For Timezone       =
=================================

Like Chicago, New_York, etc.

"

read CITYTZ

timedatectl set-timezone COUNTRYTZ/CITYTZ
hwclock --systohc

echo "
=================================
=       Select Your Locale      =
=================================

Just uncomment the line you want

"

sleep 1
vim /etc/locale.gen
locale-gen

echo "Did you choose en_US.UTF-8?"
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
    vim /etc/locale.conf;;
*)
    localectl set-locale LANG="en_US.UTF-8"
    localectl set-locale LC_TIME="en_US.UTF-8"
    localectl set-keymap us
  ;;
esac

echo "
=================================
=     Select Your Hostname      =
=================================

"

sleep 1
vim /etc/hostname

echo "
=================================
=         Setup Pacman          =
=================================

Add whatever you want, I recommend
ILoveCandy & parrallel downloads

YOU MUST ENABLE MULTILIB

"

sleep 3
vim /etc/pacman.conf

echo "
=================================
=       Update The System       =
=================================

"

pacman -Syyu

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
  pacman -S nvidia nvidia-utils;;
*)
  pacman -S xf86-video-amdgpu mesa lib32-mesa vulkan-radeon lib32-vulkan-radeon libva-mesa-driver lib32-libva-mesa-driver mesa-vdpau lib32-mesa-vdpau;;
esac

echo "
=================================
=       Start Services Up       =
=================================

"

systemctl enable NetworkManager
systemctl enable fstrim.timer

echo "
=================================
=      Add btrfs To Modules     =
=================================

Like so,
- MODULES=()
+ MODULES=(btrfs)

"

sleep 3
vim /etc/mkinitcpio.conf

echo "
=================================
=   encrypt Before filesystems  =
=================================

Like so,
- HOOKS=(base udev autodetect modconf block filesystems keyboard fsck)
+ HOOKS=(base udev autodetect modconf block encrypt filesystems keyboard fsck)

"

sleep 6
vim /etc/mkinitcpio.conf

mkinitcpio -p linux

echo "
=================================
=        Installing GRUB        =
=================================

"

grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg

echo "
=================================
=        Adding The User        =
=================================

What Would You Like The User Name To Be?

"

read USERSNAME
useradd -mG wheel,audio,power,disk,video $USERSNAME
passwd $USERSNAME

echo "
=================================
=        Configure Sudo         =
=================================

- #%wheel ALL=(ALL) ALL
+ %wheel ALL=(ALL) ALL

"

sleep 3
EDITOR=vim visudo

echo "
=================================
=      Installing Packages      =
=           & Dotfiles          =
=================================

"

pacman -S ydotool wl-clipboard hyprland xdg-desktop-portal-hyprland vivaldi \
socat mpv firefox kitty hyprpaper pcmanfm btop vim dunst pavucontrol starship \
pipewire-pulse pipewire wireplumber obs-studio qt5ct kvantum git waybar lsd \
cmatrix lolcat yadm polkit-gnome gimp blender steam libnotify terminus-font \
lm_sensors pacman-contrib grim slurp discord virt-manager v4l2loopback-dkms \
v4l2loopback-utils v4l-utils
systemctl enable libvirtd.service
systemctl enable libvirtd.socket
echo FONT=ter-u28n >> /etc/vconsole.conf
git clone https://aur.archlinux.org/nwg-look.git
cd nwg-look
makepkg -si
cd ..
rm -rf nwg-look
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
cd /home/$USERSNAME
rm .bashrc
rm .bash_profile
rm .profile
yadm clone -f https://gitlab.com/zaney/dotfiles.git
cd

echo "
=================================
=        You're All Set!        =
=================================

Now just run:
exit
umount -R /mnt
reboot

Thank you for using my script!

"
