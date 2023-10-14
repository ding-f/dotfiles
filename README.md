# Useful Links
1. [Theme I Currently Use](https://draculatheme.com/)
2. [Script Directory](.local/bin)
3. [Hyprland Config](.config/hypr/hyprland.conf)
4. [Cursor Theme](https://www.gnome-look.org/p/1215613)

# About My System
![](.config/wallpaper.png)

This repository is my personal dotfiles. Dotfiles are the files responsible for customization on your Unix(-like) system. This exists so that anyone can see how I have customized my system. The customization and configuration files on Unix(-like) systems are referred to are dotfiles, because typically they begin with a period.

I currenty run Arch with Hyprland. I couldn't recommend it enough. I am currently using this setup on my laptop (Intel OEM Whitebook) & Ryzen desktop.

I do want to point out that my config was **not** tailored to suit a large number of people originally. However, I have put a lot of work into automating a lot of the setup process if you would like to repliate my system configuration.

## What I Use
- [Hyprland](https://github.com/baskerville/bspwm) (Window Manager/Compositor)
- [Hyprpaper](https://github.com/l3ib/nitrogen) (Wallpaper)
- [tofi](https://github.com/davatorium/rofi) (Program Launcher)
- [kitty](https://github.com/kovidgoyal/kitty) (Terminal)
- [pcmanfm](https://github.com/lxde/pcmanfm) (File Manager)
- [mpv](https://mpv.io/) (Video Player)
- firefox (Web Browsing)
- kdenlive / Davinci Resolve (Video Editing)
- [btop](https://github.com/aristocratos/btop) (System Monitoring)
- [neovim](https://github.com/neovim/neovim) (Text Editor / IDE)
- [dunst](https://github.com/dunst-project/dunst) (Notifications)
- pulseaudio (Audio)
- pavucontrol (Audio Control)
- bash (Shell)
- obs (Streaming/Recording Software)
- qt5ct,Kvantum,nwg-look (Theming)

# Full Install
Here is all you will need to run after you have installed Arch Linux & log in as your user:

Please go into your /etc/pacman.conf file and uncomment ParallelDownloads = 5 and add ILoveCandy under it. Also make sure you uncomment the multilib repository. Keep in mind I am leaving out hardware specific packages. So make sure you have already installed your graphics drivers and such. I also use networkmanager and assume you will aswell.

'''
sudo pacman -S ydotool wl-clipboard hyprland xdg-desktop-portal-hyprland socat mpv firefox kitty hyprpaper pcmanfm btop vim dunst pavucontrol pipewire-pulse pipewire wireplumber obs-studio qt5ct kvantum git waybar cmatrix lolcat yadm polkit-kde-agent gimp blender steam libnotify terminus-font
echo FONT=ter-u28n >> /etc/vconsole.conf
git clone https://aur.archlinux.org/nwg-look.git
cd nwg-look
makepkg -si
cd ..
rm -rf nwg-look
git clone https://aur.archlinux.org/tofi.git
cd tofi
makepkg -si
cd ..
rm -rf tofi
git clone https://aur.archlinux.org/webcord.git
cd webcord
makepkg -si
cd ..
rm -rf webcord

'''

# Key Bindings:

My list of combinations:

    - Super + HJKL = Move Focus
    - Super + Shift + HJKL = Move Window
    - Super + Shift + f = Float Window
    - Super + Shift + t = Tile Window
    - Super + Return = Open Kitty
    - Super + Shift + Return = Open Program Launcher
    - Super + w = Open Firefox
    - Super + f = Open File Browser
    - Super + g = Open Gimp
    - Super + d = Open Discord
    - Super + o = Open OBS
    - Super + e = Custom Emoji Selector Script 
    - Super + SHIFT + s = Take Screenshot
    - Volume-Up = Volume +5
    - Volume-Down = Volume -5
    - Super + q = Kill Window
    - Super + Shift + q = Exit

*For those new to tilers or maybe Linux in general, Return is the Enter key & Super is the Windows Key*

---

*Note for people who are noticing something missing from the past. I have been making videos for a long time & I often like to switch things up. It's a long story, but the dotfiles went unmaintained for quite a while. Then I made this massive change to btrfs, wayland, pipewite, etc. so I decided the dotfiles needed a major clean up. I am sorry if you cannot find something, please feel free to reach out through Discord or Mastadon.*
