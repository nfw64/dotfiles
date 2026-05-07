# My dotfiles

###  System Specs
| Component | Choice |
| :--- | :--- |
| **Panel** | Quickshell |
| **Notifications** | Quickshell |
| **Some menus** | [Rofi](https://github.com/adi1090x/rofi) (Collection by adi1090x) |
| **Terminal** | kitty |
| **Shell** | Zsh ([zinit](https://github.com/zdharma-continuum/zinit)) |
| **Font** | Jetbrains Mono (kitty, waybar), SF Pro (system-wide)  |
| **GTK Theme** | [Kripton](https://github.com/EliverLara/Kripton) |
| **Icons** | [Papirus](https://github.com/PapirusDevelopmentTeam/papirus-icon-theme) |
| **Fetch** | fastfetch |

---

### 󱠀 Acknowledgments
* Big thanks to [adi1090x](https://github.com/adi1090x/rofi) for the incredible collection of Rofi themes.
* Wallpaper management handled by `awww`

### Installation
The installation script assumes you have a minimal working system! Firstly lets install all the necessary packages. On arch based distros you can copy & paste this command:


> Install starship for shell
```sh
curl -sS https://starship.rs/install.sh | sh
```

```sh
sudo pacman -S hyprland hyprlock hypridle waybar swaync kitty cava rofi pavucontrol thunar zsh awww python-psutil eza fzf htop jq neovim xdg-desktop-portal-gtk xdg-desktop-portal-hyprland grim slurp nvtop nwg-look mission-center powertop qt6ct kvantum noto-fonts noto-fonts-emoji flameshot wtype papirus-icon-theme hyprpolkitagent gnome-keyring cliphist network-manager-applet gvfs zoxide brightnessctl zathura stow hyprsunset npm declaro firefox
```

And run this with your AUR helper (example with yay):

```sh
yay -S quickshell-git kripton-theme-git papirus-folders-git pay-respects-bin matugen-bin apple-fonts ttf-jetbrains-mono-nerd
```

### XDG base directories

> [!WARNING]  
> My config files change [XDG base user directories](https://wiki.archlinux.org/title/XDG_Base_Directory#User_directories).

You can change these configurations here:
- [user-dirs.dirs](https://github.com/nfw64/dotfiles/blob/main/home/xdg/.config/user-dirs.dirs)
- [environ.conf](https://github.com/nfw64/dotfiles/blob/main/home/hypr/.config/hypr/configs/environ.conf#L53)
- [.zshrc](https://github.com/nfw64/dotfiles/blob/main/home/zsh/.config/zsh/.zshrc#L26)

Now clone the repo & run the install script:

```sh
git clone https://github.com/nfw64/dotfiles.git --depth=1
./install
```
