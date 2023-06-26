# Useful Links
1. [The Wallpaper I Use](https://www.reddit.com/r/wallpapers/comments/10lq6wr/cumulonimbus_4k_3840x2160_by_ai/)
2. [Script Directory](.local/bin)
3. [Hyprland Config](.config/hypr/hyprland.conf)

# About My System
![](.config/demo.gif)

This repository is my personal dotfiles. Dotfiles are the files responsible for customization on your Unix(-like) system. This exists so that anyone can see how I have customized my system. The customization and configuration files on Unix(-like) are referred to are dotfiles, because typically they begin with a period.

I am currently running vanilla Arch right now with Wayland. As you can see below I have started using Hyprland and have truly fallen in love with it. It is a feature rich tiling window manager that is **very** bleeding edge. *Please keep that in mind.*

I do want to point out that my config is **not** tailored to suit a large number of people. Most likely you will need to change most configs to match monitor setups, personal preference, and directory structure.

## What I Use
- [hyprland *hyprland-git*](https://github.com/hyprwm/Hyprland) (Window Manager)
- [hyprprop](https://github.com/vilari-mickopf/hyprprop) (Xprop For Hyprland/Wayland)
- [tofi](https://github.com/philj56/tofi) (Program Launcher)
- kitty (Terminal)
- pcmanfm-qt/ranger (File Manager)
- rhythmbox (Music Player)
- [hyprpaper](https://github.com/hyprwm/hyprpaper) (Setting Wallpaper)
- mpv (Video Player)
- firefox (Web Browsing)
- kdenlive (Video Editing)
- bashtop (System Monitoring)
- neovim (Terminal Text Editor / IDE)
- mako (Notifications)
- btrfs (File System)
- pipewire *Pipewire-Pulse* (Audio)
- pavucontrol, pactl, pamixer (Audio Control)
- zsh (User Shell)
- obs (Streaming/Recording Software)
- [wl-clipboard](https://github.com/bugaevc/wl-clipboard) (Wayland Clipboard Tools)
- [ydotool](https://github.com/ReimuNotMoe/ydotool) (Command Line Automation)
- [SF Pro Display](https://aur.archlinux.org/packages/apple-fonts) & [SF Mono Nerd Font](https://github.com/epk/SF-Mono-Nerd-Font) (System & Terminal Font)
- yay (AUR Helper)
- qt5ct,Kvantum,lxappearance (Theming)

*Not all programs that I have listed here necessarily have configuration files stored here. Most will, but not all. This is just a mostly complete list of the programs I use.*

## What I Do Not Use
- login/display managers (.zprofile Auto Load Hyprland)
- Xorg

# Why Am I Using Linux?
A totally reasonable question. I have used and bounced from one OS to another quite a bit. While I could use the argument that I want to be competent in all major ones that just isn't the case. I am very curious, that's probably the straightest answer I can give.
Linux is where I have come back again and again, particularly Arch Linux. The availability of packages, AUR, and overall reliable documentation is just fantastic. Not to mention I do very much enjoy the process and feeling of crafting your own system with only the packages you deem necessary. Now that isn't to say I don't enjoy other distros, I do, but Arch has just become my home.

### So Bye-Bye OpenBSD??
Hopefully not forever, but for now yes. I am very much enjoying the features, reliability *(surprisingly)*, and speed of hyprland-wayland-pipewire. These are things that are just not going to be available on OpenBSD for quite a while. Or at the very least much more unstable than their Linux counter-parts. Things change though so hopefully this line of text will age like milk.
You can still find my OpenBSD guides [here](https://gitlab.com/Zaney/openbsd-guides) please do keep in mind that it has been a while since I have used OpenBSD as my desktop OS so there may be changes needed.

## Key Bindings:

My list of combinations:

    - Super + HJKL = Move Focus
    - Super + Shift + HJKL = Move Window
    - Super + Shift + f = Floating Window
    - Super + i = Toggle Split
    - Super + a = Toggle Fullscreen
    - Super + Return = Open Kitty
    - Super + Shift + Return = Open Tofi (Program Launcher)
    - Super + w = Open Firefox
    - Super + f = Open PCManFM-QT
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
