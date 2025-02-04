#!/bin/bash

ScriptDir=$(readlink -f "${BASH_SOURCE%/*}")
COLOR_RED='\033[0;31m'
COLOR_GREEN='\033[1;32m'
COLOR_YELLOW='\033[1;33m'
COLOR_DEFAULT='\033[0m'
ROOT_INSTALL=0
TARGET_DIRECTORY="${HOME}/.local/share/thumbnailers"
TARGET_DIRECTORY_PERMISSIONS=0700
THUMBNAILERS_PERMISSIONS=0600


print_banner() {
cat <<eof
mmolch-thumbnailers v1.1

eof
}

thumbnailer_kra_filename='kra.thumbnailer'
thumbnailer_kra_content='[Thumbnailer Entry]
TryExec=unzip
Exec=sh -c "unzip -p %i preview.png > %o"
MimeType=application/x-krita;'

thumbnailer_ora_filename='ora.thumbnailer'
thumbnailer_ora_content='[Thumbnailer Entry]
TryExec=unzip
Exec=sh -c "unzip -p \"%i\" Thumbnails/thumbnail.png > %o"
MimeType=image/openraster;'

thumbnailer_webp_filename='webp.thumbnailer'
thumbnailer_webp_content='[Thumbnailer Entry]
TryExec=convert
Exec=convert "webp:%i" -scale 512x%s png:%o
MimeType=image/webp;'

thumbnailer_psd_filename='psd.thumbnailer'
thumbnailer_psd_content='[Thumbnailer Entry]
TryExec=convert
Exec=convert "psd:%i[0]" -scale 512x%s png:%o
MimeType=image/vnd.adobe.photoshop;'

thumbnailer_xcf_filename='xcf.thumbnailer'
thumbnailer_xcf_content='[Thumbnailer Entry]
TryExec=xcf2png
Exec=sh -c "xcf2png \"%i\" -o - | convert -scale 512x%s png:- png:%o"
MimeType=image/x-xcf;'

thumbnailer_exe_filename='exe.thumbnailer'
thumbnailer_exe_content='[Thumbnailer Entry]
TryExec=wrestool
Exec=sh -c "wrestool -x --type=14 \"%i\" 2>/dev/null | convert -scale 512x%s ico:- png:%o"
MimeType=application/x-ms-dos-executable;'

# arg1: full filepath
# arg2: content
install_thumbnailer() {
    touch "${1}"
    [ ! -f "${1}" ] && echo "Failed to create the file '${1}'" && return 1
    chmod ${THUMBNAILERS_PERMISSIONS} "${1}" || return 1
    echo "${2}" > "${1}" || return 1
}

install_failed() {
  echo -e "\n${COLOR_RED}Installation failed.${COLOR_DEFAULT}"
  exit 1
}

if [ "$(id -u)" -eq 0 ]; then
    ROOT_INSTALL=1
    TARGET_DIRECTORY='/usr/share/thumbnailers'
    TARGET_DIRECTORY_PERMISSIONS=0755
    THUMBNAILERS_PERMISSIONS=0644
fi

print_banner

cat <<eof
The thumbnailers will be installed in the following directory:
  ${TARGET_DIRECTORY}
eof

if [ "${ROOT_INSTALL}" -eq 1 ]; then
    echo -e '\nIf you want to install the thumbnailers only for you, run this script as user'
else
    echo -e '\nIf you want to install the thumbnailers for all users, run this script with root privileges'    
fi

echo -e 'Press Ctrl-C to abort or enter to continue'
read xxx

echo -e "${COLOR_YELLOW}"
[ -d "${TARGET_DIRECTORY}" ] || mkdir -m ${TARGET_DIRECTORY_PERMISSIONS} -p "${TARGET_DIRECTORY}" || install_failed

echo -e "${COLOR_DEFAULT}Installing thumbnailer for Krita ...${COLOR_YELLOW}"
install_thumbnailer "${TARGET_DIRECTORY}/${thumbnailer_kra_filename}" "${thumbnailer_kra_content}" || install_failed

echo -e "${COLOR_DEFAULT}Installing thumbnailer for OpenRaster ...${COLOR_YELLOW}"
install_thumbnailer "${TARGET_DIRECTORY}/${thumbnailer_ora_filename}" "${thumbnailer_ora_content}" || install_failed

echo -e "${COLOR_DEFAULT}Installing thumbnailer for WebP ...${COLOR_YELLOW}"
install_thumbnailer "${TARGET_DIRECTORY}/${thumbnailer_webp_filename}" "${thumbnailer_webp_content}" || install_failed

echo -e "${COLOR_DEFAULT}Installing thumbnailer for Photoshop ...${COLOR_YELLOW}"
install_thumbnailer "${TARGET_DIRECTORY}/${thumbnailer_psd_filename}" "${thumbnailer_psd_content}" || install_failed

echo -e "${COLOR_DEFAULT}Installing thumbnailer for Gimp ...${COLOR_YELLOW}"
install_thumbnailer "${TARGET_DIRECTORY}/${thumbnailer_xcf_filename}" "${thumbnailer_xcf_content}" || install_failed

echo -e "${COLOR_DEFAULT}Installing thumbnailer for Windows executables ...${COLOR_YELLOW}"
install_thumbnailer "${TARGET_DIRECTORY}/${thumbnailer_exe_filename}" "${thumbnailer_exe_content}" || install_failed

echo
if ! which convert >/dev/null; then
    echo -e "${COLOR_YELLOW}Note: imagemagick doesn't seem to be installed. The WebP and Photoshop thumbnailers won't work until you install it.${COLOR_DEFAULT}"
fi

if ! which xcf2png >/dev/null; then
    echo -e "${COLOR_YELLOW}Note: xcf2png doesn't seem to be installed. The Gimp thumbnailer won't work until you install it.${COLOR_DEFAULT}"
fi

if ! which wrestool >/dev/null; then
    echo -e "${COLOR_YELLOW}Note: wrestool doesn't seem to be installed. The EXE thumbnailer won't work until you install it.${COLOR_DEFAULT}"
fi

echo -e "\n${COLOR_GREEN}Installation complete.${COLOR_DEFAULT}\n"

