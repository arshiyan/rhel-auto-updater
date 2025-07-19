#!/bin/bash

# ==============================================================================
# Project:      rhel-auto-updater
# Description:  A non-interactive script to install and configure dnf-automatic#               for applying security updates on RHEL-based systems.
#
# Author:       Mohammad Javad Arshiyan
# GitHub:       https://github.com/arshiyan/rhel-auto-updater
# Version:      1.1.0
# License:      MIT License
# Date:         July 19, 2025
# ==============================================================================

# --- Color Definitions ---
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color# --- Check for Root Privileges ---
if [ "$(id -u)" -ne 0 ]; then
  echo -e "${RED}Error: This script must be run as root. Please use 'sudo' or run as the root user.${NC}"
  exit 1
fi

echo -e "${YELLOW}Starting automatic security update setup...${NC}"

# --- Step 1: Install dnf-automatic ---
echo -e "\n${GREEN}Step 1: Installing dnf-automatic...${NC}"
dnf install -y dnf-automatic
if [ $? -ne 0 ]; then
    echo -e "${RED}Error: Failed to install dnf-automatic. Please check your dnf configuration and network.${NC}"
    exit 1
fi
echo "Package 'dnf-automatic' installed successfully."

# --- Step 2: Configure for Automatic Security Updates ---
echo -e "\n${GREEN}Step 2: Configuring for automatic security updates...${NC}"
CONFIG_FILE="/etc/dnf/automatic.conf"

# Backup the original config file just in case
if [ -f "$CONFIG_FILE" ]; then
    cp "$CONFIG_FILE" "$CONFIG_FILE.bak_$(date +%F)"
fi

# Set upgrade_type to security
sed -i 's/^\(upgrade_type\s*=\s*\).*/\1security/' $CONFIG_FILE# Set apply_updates to yes
sed -i 's/^\(apply_updates\s*=\s*\).*/\1yes/' $CONFIG_FILE

echo "Configuration file '$CONFIG_FILE' updated."echo -e "${YELLOW}Note: To receive email notifications, manually edit the [email] section in ${CONFIG_FILE}.${NC}"

# --- Step 3: Enable and Start the Systemd Timer ---
echo -e "\n${GREEN}Step 3: Enabling and starting the dnf-automatic timer...${NC}"
systemctl enable --now dnf-automatic.timer
if [ $? -ne 0 ]; then
    echo -e "${RED}Error: Failed to enable or start dnf-automatic.timer.${NC}"
    exit 1
fi

# --- Final Step: Confirmation and Status Check ---
echo -e "\n${GREEN}=====================================================${NC}"
echo -e "${GREEN}      ✅ Automatic Security Updates Enabled!          ${NC}"
echo -e "${GREEN}=====================================================${NC}"
echo "Your system is now configured to automatically install security updates daily."
echo "To check the timer status, run:"
echo -e "${YELLOW}systemctl status dnf-automatic.timer${NC}"

exit 0
