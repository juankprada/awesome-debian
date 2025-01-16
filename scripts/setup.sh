#!/bin/bash


base_packages=(
    "xorg"
    "xserver-xorg"
    "x11-xserver-utils"
    "x11-utils"
    "libx11-6"
    "libxft2"
    "libxinerama1"
    "libxrandr2"
    "libxss1"
    "xsettingsd"
    "xdotool"
    "xbacklight"
    "xbindkeys"
    "xvkbd"
    "xinput"
    "build-essential"
    "git"
    "lxpolkit"
    "network-manager "
    "network-manager-gnome"
    "thunar"
    "thunar-archive-plugin"
    "thunar-volman"
    "xarchiver"
    "lxappearance"
    "dialog"
    "avahi-daemon"
    "acpi"
    "acpid"
    "gvfs-backends"
    "xfce4-power-manager"
    "xfce4-power-manager-plugins"
    "xfce4-power-manager-data"
    "alsa-utils"
    "pulseaudio"
    "pavucontrol"
    "pamixer"
    "pulsemixer"
    "pasystray"
    "fonts-recommended"
    "fonts-font-awesome"
    "fonts-terminus"
    "fonts-firacode"
    "fonts-liberation2" 
    "fonts-ubuntu" 
    "papirus-icon-theme" 
    "fonts-cascadia-code"
    "exa"
    "shutter"
    "rofi"
    "dunst"
    "libnotify-bin"
    "unzip"
    "libnotify-dev"
    "arandr"
    "autorandr"
    "light"
    "redshift"
    "bluez"
    "blueman"
    "unclutter-xfixes"
    "isync"
    "trayer"
    "xsecurelock"
    "xss-lock"
    "udiskie"
    "caffeine"
    "playerctl"
    "ddcutil"    "xssproxy"
    "suckless-tools"
    # Microcode for Intel/AMD 
    "amd64-microcode"
    # "intel-microcode"
)

build_essential_tools=(
    "patch"
    "libreadline6-dev"
    "libgmp-dev"
    "libgdbm6"
    "libdb-dev"
    "uuid-dev"
    "autoconf"
    "bison"
    "cmake"
    "ansible"
    "gir1.2-clutter-1.0"
    "gir1.2-gtop-2.0"
    "gpg"
    "imagemagick"
    "libffi-dev"
    "libgdbm-dev"
    "libjemalloc2"
    "libmagickwand-dev"
    "default-libmysqlclient-dev"
    "libncurses5-dev"
    "libpq-dev"
    "libpthread-stubs0-dev"
    "libreadline-dev"
    "libreadline-dev"
    "libsqlite3-0"
    "libssl-dev"
    "libvips"
    "libyaml-dev"
    "mupdf"
    "mupdf-tools"
    "pkg-config"
    "postgresql-client"
    "postgresql-client-common"
    "redis-tools"
    "sqlite3"
    "wget"
    "zlib1g-dev"
    "build-essential"
    "binutils"
    "gcc"
    "x11-xserver-utils"
)

core_terminal_tools=(
     "kitty"
     "alacritty"
     "bat"
     "btop"
     "coreutils"
     "curl"
     "exa"
     "fd-find"
     "fzf"
     "gettext"
     "git"
     "jq"
     "libtool"
     "lsof"
     "make"
     "moreutils"
     "optipng"
     "pango1.0-tools"
     "plocate"
     "renameutils"
     "ripgrep"
     "rsync"
     "sed"
     "sshpass"
     "stow"
     "tldr"
     "tmux"
     "xclip"
     "zenity"
     "zoxide"
     "trash-cli"
     "btrbk"
)

recommended_apps=(
   "borgbackup"
   "btrfsmaintenance"
   "freefilesync"
   "syncthing"
   "samba"
   "displaycal"
   "dispcalgui"
   "argyll"
   "xiccd"
   "colord-gtk-utils"
   "colord-sensor-argyll"
   "flameshot # Better Screen shots"
   "audacity"
   "flatpak"
   "fontforge"
   "fontforge-common"
   "fontforge-extras"
   "gimp"
   "hugin"
   "peek"
   "xournalpp"
   "firewalld"
   "firewall-config"
   "yagf"
   "zim"
   "qimgv"
   "filezilla"
   "treesheets"
   "python-is-python3"
   "lightdm"
   "lightdm-gtk-greeter-settings"
)


printing_apps=(
    "cups"
    "system-config-printer"
    "simple-scan"
    "xsane"
    "xsane-common"
)

xmonad_deps=(
    "libx11-dev"
    "libxft-dev"
    "libxinerama-dev"
    "libxrandr-dev"
    "libxss-dev"
    "haskell-stack"
)

multimedia_apps=(
    "mpv"
    "mpd"
    "ncmpp"
    "mkvtoolnix-gui"
    "kdenlive"
    "obs-studio"
)

utilities=(
    "gparted"
    "gnome-disk-utility" 
    "neofetch" 
    "nitrogen" 
    "numlockx" 
    "galculator"
    "cpu-x"
    "udns-utils"
    "whois"
    "curl"
    "tree"
    "btop"
    "brightnessctl"
    
)

install_packages() {
    local pkgs=("$@")
    local missing_pkgs=()

    # Check if each package is installed
    for pkg in "${pkgs[@]}"; do
        if ! dpkg -l | grep -q " $pkg "; then
            missing_pkgs+=("$pkg")
        fi
    done

     # Install missing packages
    if [ ${#pkgs[@]} -gt 0 ]; then
        echo "Installing missing packages: ${missing_pkgs[@]}"
        sudo apt update
        sudo apt install -y "${missing_pkgs[@]}"
        if [ $? -ne 0 ]; then
            echo "Failed to install some packages. Exiting."
            exit 1
        fi
    else
        echo "All required packages are already installed."
    fi
}


install_packages "${base_packages[@]}"
install_packages "${build_essential_tools[@]}"
install_packages "${core_terminal_tools[@]}"
install_packages "${recommended_apps[@]}"
install_packages "${printing_apps[@]}"
install_packages "${xmonad_deps[@]}"
install_packages "${multimedia_apps[@]}"
install_packages "${utilities[@]}"


# enable services
sudo systemctl enable lightdm
sudo systemctl enable bluetooth
sudo systemctl enable avahi-daemon
sudo systemctl enable acpid
sudo systemctl enable cups


# Install Custom Picom
#bash ~/awesome-debian/scripts/picom.sh

# Install Xmonad
#bash ~/awesome-debian/scripts/xmonad.sh

# Install Emacs

# Install Input Remapper

# Install nvidia drivers

# Setup Starship

# Setup Java development Environment

# Setup Ruby development Environment

# Setup NodeJS development Environment

# Setup go development environment

# Setup python development environment

# Flatpacks everywhere

# Setup Extra Fonts

# Setup XDG home directories
xdg-user-dirs-update

# Clone and Stow dotfiles


# Add GTK theme and Icon theme

sudo apt autoremove -y
