# Useful Links
1. [Theme I Currently Use](https://draculatheme.com/)
2. [Script Directory](.local/bin)
3. [Hyprland Config](.config/hypr/hyprland.conf)
4. [Cursor Theme](.icons/GoogleDot-Blue)
5. [My Website](https://zaney.org/)

# About My System
![](.config/demo.png)

This repository is my personal dotfiles. Dotfiles are the files responsible for customization on your Unix(-like) system. This exists so that anyone can see how I have customized my system. The customization and configuration files on Unix(-like) systems are referred to are dotfiles, because typically they begin with a period.

I currenty run Arch with Hyprland. I couldn't recommend it enough. I am currently using this setup on my laptop (Intel OEM Whitebook) & Ryzen desktop.

I do want to point out that my config was **not** tailored to suit a large number of people originally. However, I have put a lot of work into automating a lot of the setup process if you would like to repliate my system configuration.

## Programs That I Use
- [Hyprland](https://hyprland.org/) (Window Manager/Compositor)
- [Hyprpaper](https://github.com/hyprwm/hyprpaper) (Wallpaper)
- [tofi](https://github.com/philj56/tofi) (Program Launcher)
- [kitty](https://github.com/kovidgoyal/kitty) (Terminal)
- [pcmanfm](https://github.com/lxde/pcmanfm) (File Manager)
- [mpv](https://mpv.io/) (Video Player)
- [firefox](https://www.mozilla.org/en-US/firefox/new/) (Web Browsing)
- [Webcord](https://github.com/SpacingBat3/WebCord) (Rec Podcasts & Fun)
- [kdenlive](https://kdenlive.org/en/) (Video Editing)
- [btop](https://github.com/aristocratos/btop) (System Monitoring)
- [vim](https://www.vim.org/) (Text Editor / IDE)
- [dunst](https://github.com/dunst-project/dunst) (Notifications)
- [pavucontrol](https://freedesktop.org/software/pulseaudio/pavucontrol/) (Audio Control)
- [bash](https://www.gnu.org/software/bash/) (Shell)
- [OBS-Studio](https://obsproject.com/) (Streaming/Recording Software)
- [Blender](https://www.blender.org/) (3D Modeling)
- [Steam](https://store.steampowered.com/) (Most Gaming)
- [0 A.D](https://play0ad.com/) (Best Open Source Game)
- qt5ct,Kvantum,nwg-look (Theming)

## Features

1. Simple wallpaper that comes with the config can match with many different dark or light colorschemes. It also is high resolution making it fine for any kind of monitor config you throw at it. Not to mention its a sleek, modern, abstract design that just screams beauty.
2. Using waybar and tofi for the top bar and program launcher gives a sleek full featured user experience with very little performance impact. The bar is setup for laptops with wifi and battery modules, including all that one would expect from a bar. The tofi and waybar configuration is designed to give you a dwm feel without having to patch dwm, dmenu, etc! 😉
3. Neofetch is a great program, however it can be slow. So this setup includes an alias to the program fastfetch. Which is meant to be a faster alternative to neofetch.
4. All of the theming comes together with the dotfiles. If you like the theme I use for programs no need to set them all up individually. Besides how could you not love 🧛 Dracula? 
5. Many great scripts are included. Like the script for packagecount in the bar, the emoji selection script, and many more. 
6. Not only do you have great window animations, but the borders for your windows are an animated gradient. 

### Vim Configuration

I needed to put this in its own little section just because of how proud I am of this vimrc. **This is a fully automated Vim configuration file.** It will automatically download vim-plug, the plugins and then install all of the language servers in the config file. 

I think you'll find a moderately slim Vim configuration with all the important features of any text editor that you'd want to code or configure the day away in. 

Shortcuts:
- Ctrl + f = Toggles NERDtree
- Press t on a file in NERDtree to open in new tab, s for vertical split
- Press ii quickly to get to normal mode
- Highighlight lines with shift + v and press gc to toggle it commented
- Highlight lines and press zf to fold lines, zo to open fold

## Full Setup Guide
Here is all you will need to run after you have installed Arch Linux & log in as your user:

*Please Note:* This is assuming that your doing this on a fresh install of Arch Linux. If you are not please ensure to overwrite all your existing dotfiles with the new ones here. Also I install both Discord and Webcord. With Discord you can't screen share unless you go the OBS Virtual Camera route. With Webcord you can screen share, just it will not detect Virtual Cameras. So it's up to you which one you prefer. I also change the console font to terminus your eyes can thank me later.

Please go into your /etc/pacman.conf file and uncomment ParallelDownloads = 5 and add ILoveCandy under it. Also make sure you uncomment the multilib repository. Keep in mind I am leaving out hardware specific packages. So make sure you have already installed your graphics drivers and such.

    sudo pacman -S ydotool wl-clipboard hyprland xdg-desktop-portal-hyprland \
    socat mpv firefox kitty hyprpaper pcmanfm btop vim dunst pavucontrol starship \
    pipewire-pulse pipewire wireplumber obs-studio qt5ct kvantum git waybar lsd \
    cmatrix lolcat yadm polkit-kde-agent gimp blender steam libnotify terminus-font \
    lm_sensors pacman-contrib grim slurp discord
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
    git clone https://aur.archlinux.org/webcord.git
    cd webcord
    makepkg -si
    cd ..
    rm -rf webcord
    rm .bashrc
    rm .bash_profile
    rm .profile
    yadm clone -f https://gitlab.com/zaney/dotfiles.git

Once you are done pulling in the dotfiles you should be able to log out and log back in and see your prompt change to the starship prompt. Assuming that has happened your good to go.

*Just please go ahead and vim into ~/.config/hypr/hyprland.conf and verify the monitor section works for you. It should be safe to just delete all the monitor lines with names and work from there.* 

Then you can just start up Hyprland like so:

    Hyprland

**Please enjoy responsibly**

## Key Bindings:

My list of combinations:

### Most Important
- Super + Return = Open Kitty
- Super + Shift + Return = Open Program Launcher
- Super + Shift + q = Exit Hyprland
### Window Management
- Super + HJKL = Move Focus
- Super + Shift + HJKL = Move Window
- Super + Shift + f = Toggle Float Window
- Super + q = Kill Window
### Custom Scipts
- Super + Shift + s = Search Websites
- Super + Shift + w = Amfora Gemini Browser
- Super + e = Custom Emoji Selector Script 
### Application Shortcuts
- Super + w = Open Firefox
- Super + f = Open File Browser
- Super + g = Open Gimp
- Super + d = Open Webcord
- Super + o = Open OBS
- Super + m = Open Rhythmbox
- Super + s = Take Screenshot
### OBS Global Hotkeys
- ALT + F1-5 **(Comment out and configure them in OBS, then uncomment)**
### System Control
- Volume-Up = Volume +5
- Volume-Down = Volume -5
- Brightness-Up = Brightness +10%
- Brightness-Down = Brightness -10%

*For those new to tilers or maybe Linux in general, Return is the Enter key & Super is the Windows Key*

---

*Note for people who are noticing something missing from the past. I have been making videos for a long time & I often like to switch things up. It's a long story, but the dotfiles went unmaintained for quite a while. Then I made this massive change to btrfs, wayland, pipewite, etc. so I decided the dotfiles needed a major clean up. I am sorry if you cannot find something, please feel free to reach out through Discord.*
