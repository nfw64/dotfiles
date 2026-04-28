# Hyprland Dotfiles
[![Origin](https://img.shields.io/badge/Origin-GitHub-blue?style=flat-square&logo=github)](https://github.com/cebem1nt/dotfiles)

Minimalist, performance-oriented configuration for Hyprland on CachyOS.

###  System Specs
| Component | Choice |
| :--- | :--- |
| **Panel** | [Waybar](https://github.com/Alexays/Waybar) |
| **Notifications** | [SwayNC](https://github.com/ErikReider/SwayNotificationCenter) |
| **Menus** | [Rofi](https://github.com/adi1090x/rofi) (Collection by adi1090x) |
| **Terminal** | Alacritty |
| **Shell** | Zsh ([zinit](https://github.com/zdharma-continuum/zinit)) |
| **Font** | Cascadia Code |
| **GTK Theme** | [Kripton](https://github.com/EliverLara/Kripton) / [Tokyonight](https://github.com/Fausto-Korpsvart/Tokyonight-GTK-Theme) (Light) |
| **Icons** | [Papirus](https://github.com/PapirusDevelopmentTeam/papirus-icon-theme) |
| **Fetch** | fastfetch |
| **Original Author** | [cebem1nt](https://github.com/cebem1nt/dotfiles)

---

### 󱠀 Acknowledgments
* Big thanks to [adi1090x](https://github.com/adi1090x/rofi) for the incredible collection of Rofi themes.
* Wallpaper management handled by `awww`

### Installation

> [!WARNING]  
> My dotfiles are __*laptop specific*__. Despite trying to make a flexible installation script, some of the things might not work! You better install everything manually based on your needs, or use this repository as an inspiration.

The installation script assumes you have a minimal working system! Firstly lets install all the necessary packages. On arch based distros you can copy & paste this command:


> Install starship for shell
```sh
curl -sS https://starship.rs/install.sh | sh
```

```sh
sudo pacman -S hyprland hyprlock hypridle waybar swaync alacritty cava rofi pavucontrol thunar zsh ttf-cascadia-code ttf-cascadia-code-nerd awww python-psutil eza fzf htop jq neovim xdg-desktop-portal-gtk xdg-desktop-portal-hyprland grim slurp nvtop nwg-look mission-center powertop qt6ct kvantum noto-fonts noto-fonts-emoji flameshot wtype papirus-icon-theme hyprpolkitagent gnome-keyring-daemon cliphist network-manager-applet
```

And run this with your AUR helper (example with yay):

```sh
yay -S  zen-browser-bin peaclock bibata-cursor-theme kripton-theme-git papirus-folders-git pay-respects-bin
```

### XDG base directories

> [!WARNING]  
> My config files change [XDG base user directories](https://wiki.archlinux.org/title/XDG_Base_Directory#User_directories).
> Instead of having `~/Desktop`, `~/Downloads`, `~/Pictures` I use `~/wsp`, `~/dow`, `~/med/pictures` ...
> This means that some of your previous settings might be screwed up!

You can change these configurations here:
- [user-dirs.dirs](https://github.com/nfw64/dotfiles/blob/main/home/xdg/.config/user-dirs.dirs)
- [environ.conf](https://github.com/nfw64/dotfiles/blob/main/home/hypr/.config/hypr/configs/environ.conf#L53)
- [.zshrc](https://github.com/nfw64/dotfiles/blob/main/home/zsh/.config/zsh/.zshrc#L26)

Now clone the repo & run the install script:

```sh
git clone https://github.com/nfw64/dotfiles.git --depth=1
./install
```
