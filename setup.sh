#!/usr/bin/env bash

echo "
=================================
= You're Connected To Internet? =
= Also This Install Is For One, =
=  Drive,No Swap, & Uses fdisk  =
=================================

Continue? Yes or No? [y,n,Yes,No]
"

read INTERNET

case $INTERNET in

  y)
    echo "
=================================
=  Awesome, Let's Get Started   =
=================================

    "
    ;;

  Y)
    echo "
=================================
=  Awesome, Let's Get Started   =
=================================

    "
    ;;

  Yes)
    echo "
=================================
=  Awesome, Let's Get Started   =
=================================

    "
    ;;

  yes)
    echo "
=================================
=  Awesome, Let's Get Started   =
=================================

    "
    ;;

  YES)
    echo "
=================================
=  Awesome, Let's Get Started   =
=================================

    "
    ;;

  n)
    echo "
=================================
=     Get Connected First!      =
=================================

    "
    exit
    ;;

  N)
    echo "
=================================
=     Get Connected First!      =
=================================

    "
    exit
    ;;

  NO)
    echo "
=================================
=     Get Connected First!      =
=================================

    "
    exit
    ;;

  No)
    echo "
=================================
=     Get Connected First!      =
=================================

    "
    exit
    ;;

  *)
    echo "
=================================
=            What??             =
=================================

    "
    exit
    ;;
esac

echo "
=================================
=      Enabling Time Sync       =
=================================

"

timedatectl set-ntp true

echo "
=================================
=     Formatting The Drive      =
=================================

"

lsblk
echo "
*ONLY GIVE THE PART AFTER THE /dev/
-----------------------------------
"
echo "So For /dev/sda It Would Be sda"
echo "For /dev/nvme0n1, nvme0n1"
echo "Which Drive Do You Want To Use?"
read THEDRIVE

fdisk /dev/$THEDRIVE

lsblk
echo "Which partition is the boot?"
echo "Same format as before so /dev/sda1 is sda1"
echo "For /dev/nvme0n1p1 is nvme0n1p1"
read BOOTPART
mkfs.fat -F32 /dev/$BOOTPART

lsblk
echo "Which partition is the root?"
echo "Same format as before so /dev/sda2 is sda2"
echo "For /dev/nvme0n1p2 is nvme0n1p2"
read ROOTPART

echo "
=================================
=     Encrypting The Drive      =
=     &  Creating Snapshots     =
=================================

"

# Ensure Encryption Stuff Is Ready
modprobe dm-crypt
modprobe dm-mod

cryptsetup luksFormat -v -s 512 -h sha512 /dev/$ROOTPART
cryptsetup luksOpen /dev/$ROOTPART archlinux
mkfs.btrfs /dev/mapper/archlinux
mount /dev/mapper/archlinux /mnt
cd /mnt
btrfs subvolume create @
btrfs subvolume create @home
btrfs subvolume create @snapshots
cd
umount /mnt

echo "
=================================
=      Mounting Snapshots       =
=================================

"

mount -o noatime,compress=zstd:4,space_cache=v2,discard=async,subvol=@ /dev/mapper/archlinux /mnt
# create a mount point for the home directory
mkdir /mnt/home
mount -o noatime,compress=zstd:4,space_cache=v2,discard=async,subvol=@home /dev/mapper/archlinux /mnt/home

# create a mount point for the EFI partiton
mkdir /mnt/boot

mount /dev/sda1 /mnt/boot

echo "
=================================
=      Intel or AMD  CPU?       =
=================================

1) AMD
2) Intel
If you enter anything else the
default option is AMD.

"

read CPUCHOICE
case $CPUCHOICE in
1)
    echo "
=================================
=  Installing Base System Now   =
=================================

    "
    pacstrap /mnt base base-devel linux linux-headers linux-firmware sof-firmware networkmanager vim amd-ucode grub efibootmgr btrfs-progs exfatprogs e2fsprogs dosfstools gvfs
  ;;
2)
    echo "
=================================
=  Installing Base System Now   =
=================================

    "
    pacstrap /mnt base base-devel linux linux-headers linux-firmware sof-firmware networkmanager vim intel-ucode grub efibootmgr btrfs-progs exfatprogs e2fsprogs dosfstools gvfs
  ;;
*)
    echo "
=================================
=  Installing Base System Now   =
=================================

    "
    pacstrap /mnt base base-devel linux linux-headers linux-firmware sof-firmware networkmanager vim amd-ucode grub efibootmgr btrfs-progs exfatprogs e2fsprogs dosfstools gvfs
  ;;
esac

echo "
=================================
=     Generating The fstab      =
=================================

"

genfstab -U /mnt >> /mnt/etc/fstab

echo "
=================================
=  Copying Over New Script To   =
=      /mnt & Chrooting In      =
=================================

After the prompt changes all you
have to do is run ./setup.sh

"

cp setup-part2.sh /mnt/setup.sh
arch-chroot /mnt
