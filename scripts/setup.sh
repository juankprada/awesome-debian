#!/usr/bin/env bash

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
    "network-manager"
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
    "ddcutil"
    "xssproxy"
    "suckless-tools"
    # Microcode for Intel/AMD 
    "amd64-microcode"
    #"intel-microcode"
    "zram-tools"
	"wireless-tools"
	"wpasupplicant"
	"power-profiles-daemon"
	"nvidia-detect"
	"gtk2-engines"
	"firmware-amd-graphics"
	"firmware-misc-nonfree"
	"firmware-realtek"
	"dbus"
	"cron"
	"cron-daemon-common"
	"arc-theme"
	"arc-kde"
	"starship"
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
	"gdb"
	"g++"
	"clang-19"
	"clang-format"
	"clang-format-19"
	"clangd"
	"langd-19"
)

core_terminal_tools=(
    "bat"
    "btop"
    "coreutils"
    "curl"
	"eza"
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
    "tmux"
    "xclip"
    "zenity"
    "zoxide"
    "trash-cli"
    "btrbk"
	"rfkill"
)

recommended_apps=(
	"borgbackup"
	"vorta"
	"btrfsmaintenance"
	"freefilesync"
	"syncthing"
	"samba"
	"displaycal"
	"argyll"
	"xiccd"
	"colord-gtk-utils"
	"colord-sensor-argyll"
	"flameshot"
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
	"qt5-image-formats-plugins" # Needed by qimgv to open tif files :S
	"filezilla"
	"treesheets"
	"python-is-python3"
	"lightdm"
	"lightdm-gtk-greeter-settings"
	"i3"
	"fcitx5"
	"fcitx5-frontend-gtk3"
	"fcitx5-modules"
	"fcitx5-mozc"
)


printing_apps=(
    "cups"
    "system-config-printer"
    "simple-scan"
    "xsane"
    "xsane-common"
)


multimedia_apps=(
    "mpv"
    "mpd"
    "ncmpcpp"
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
	"vulkan-tools"
	"unrar"
	"yt-dlp"
	"zip"
	"gzip"
	"timeshift"
	"syncthing-gtk"
	"sound-juicer"
	"soundconverter"
	"rxvt-unicode"
	"qt5-image-formats-plugins"
    "qt5-style-kvantum-themes"
	"limageformat-plugins"
	"ifupdown"
	"font-manager"
)

games=(
	"wesnot-1.18"
	"steam-installer"
	"steam-devices"
	"lutris"
)


art=(
	"mypaint"
	"mypaint-brushes"
	"mypaint-data-extras"
)

install_packages() {
    local pkgs=("$@")
    local missing_pkgs=()


	available_pkgs=()
	for pkg in "${pkgs[@]}"; do
		if apt-cache show "$pkg" >/dev/null 2>&1; then
			available_pkgs+=("$pkg")
		else
			echo "⚠️  Package '$pkg' not found, skipping."
		fi
	done
	
    # Check if each package is installed
    for pkg in "${available_pkgs[@]}"; do
        if ! dpkg -l | grep -q " $pkg "; then
            missing_pkgs+=("$pkg")
        fi
    done

    # Install missing packages
    if [ ${#missing_pkgs[@]} -gt 0 ]; then
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


# Cache sudo password
sudo -v


install_packages "${base_packages[@]}"
install_packages "${build_essential_tools[@]}"
install_packages "${core_terminal_tools[@]}"
install_packages "${recommended_apps[@]}"
install_packages "${printing_apps[@]}"
install_packages "${multimedia_apps[@]}"
install_packages "${games[@]}"
install_packages "${art[@]}"


# enable services
sudo systemctl enable lightdm
sudo systemctl enable bluetooth
sudo systemctl enable avahi-daemon
sudo systemctl enable acpid
sudo systemctl enable cups


# Install Custom Picom
bash ./build_picom.sh

# Instal Alacritty
bash ./install_alacritty.sh 

# Install Xmonad
bash ./install_xmonad.sh

# Install Emacs
bash ./build_emacs.sh

# Install Input Remapper
bash ./input_remapper.sh

# Install Art studio
bash ./install_art_studio.sh

# Firefox
bash ./install_firfox.sh

# Fonts
bash ./install_fonts.sh

# Printer
bash ./printer.sh

# Fix Numphy
bash ./fix_numphy.sh

# Adds extra thumbnails for Krita and PSD
bash ./extra_thumbnails.sh 

# MPD Setup
bash ./mpd_setup.sh 

# Install nvidia drivers
bah ./instal_nvidia.sh

# Setup Rust Dev Environment
bash ./rust_devenv.sh 
# Setup Java development Environment
bash ./install_java_devenv.sh 

# Setup Ruby development Environment
bash ./ruby_devenv.sh

# Setup python development environment
bash ./python_devenv.sh 
# Flatpacks everywhere
bash ./install_flatpaks.sh 

# Setup XDG home directories
xdg-user-dirs-update

# Clone and Stow dotfiles
bash ./stow_dotfiles.sh


# Clone and Install Keys


# Add GTK theme and Icon theme

sudo apt autoremove -y
