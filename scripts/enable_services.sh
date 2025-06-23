#!/usr/bin/env bash

# Define the services you want to start
SERVICES=("lightdm"
		  "avahi-daemon"
		  "bluetooth"
		  "acpid"
		  "cups"
		 )

# Function to enable services using systemctl
enable_with_systemctl() {
    for service in "${SERVICES[@]}"; do
        echo "Enabling $service using systemctl..."
        sudo systemctl enable "$service"
    done
}

# Function to enable services using runit
enable_with_runit() {
    for service in "${SERVICES[@]}"; do
        echo "Enabling $service using runit..."
        # For runit, enabling typically involves creating a symlink in the runit service directory
        sudo ln -s /etc/sv/"$service" /var/service/
    done
}

# Function to enable services using sysvinit
enable_with_sysvinit() {
    for service in "${SERVICES[@]}"; do
        echo "Enabling $service using sysvinit..."
        if command -v update-rc.d &> /dev/null; then
            sudo update-rc.d "$service" defaults
        elif command -v chkconfig &> /dev/null; then
            sudo chkconfig "$service" on
        else
            echo "Neither update-rc.d nor chkconfig is available."
            exit 1
        fi
    done
}

# Check if systemd is available
if command -v systemctl &> /dev/null; then
    echo "systemd is available."
    enable_with_systemctl

# Check if runit is available
elif [ -d "/etc/runit" ] || [ -d "/etc/sv" ]; then
    echo "runit is available."
    enable_with_runit

#	# Check if sysvinit is available
elif command -v update-rc.d &> /dev/null || command -v chkconfig &> /dev/null; then
    echo "sysvinit is available."
    enable_with_sysvinit

else
    echo "Neither systemd nor runit is available."
    exit 1
fi
