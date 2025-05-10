#!/usr/bin/env bash


check_file_installed() {
    app_name=$1
    if [ -f ~/Applications/$app_name ]; then
        return 0 
    else
        return 1 
    fi
}

mkdir -p ~/Applications

# Download Krita
echo "Downloading Krita..."

if check_file_installed "krita-5.2.9-x86_64.appimage"; then
    echo "Krita is already installed. Skipping."
else
    wget -q --show-progress "https://download.kde.org/stable/krita/5.2.9/krita-5.2.9-x86_64.appimage" -P ~/Applications/
    if [ $? -ne 0 ]; then
	echo "Failed to download Krita"
	continue
    fi
fi

# Download Scribus
echo "Downloading Scribus..."
if check_file_installed "scribus-1.6.3-linux-x86_64.AppImage?viasf=1"; then
    echo "Scribus is already installed. Skipping"
else
    wget -q --show-progress "https://jaist.dl.sourceforge.net/project/scribus/scribus/1.6.3/scribus-1.6.3-linux-x86_64.AppImage?viasf=1" -P ~/Applications/

    if [ $? -ne 0 ]; then
	echo "Failed to download Scribus"
	continue
    fi
fi


#Downloading Inkscape
echo "Downloading Inkscape..."

if check_file_installed "Inkscape-e7c3feb-x86_64.AppImage"; then
    echo "Inkscape is already installed. Skipping"
else
    wget -q --show-progress "https://inkscape.org/gallery/item/53678/Inkscape-e7c3feb-x86_64.AppImage" -P ~/Applications/

    if [ $? -ne 0 ]; then
	echo "Failed to download Inkscape"
	continue
    fi
fi


# Installing GIMP 3 RC
echo "Installing Gimp 3 RC"
flatpak install -y --user https://flathub.org/beta-repo/appstream/org.gimp.GIMP.flatpakref

# Installing Blender
flatpak install -y flathub org.blender.Blender

echo "Finished installing art studio apps"
