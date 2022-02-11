#!/bin/bash
set -xe

SSH_PUBLIC_KEY="/home/${USER}/.ssh/id_ed25519.pub"
SD_MOUNT=/media/${USER}/
BOOT="${SD_MOUNT}"/boot/
ROOT="${SD_MOUNT}"/rootfs/

# Enable SSH
touch "${BOOT}"ssh
# Add public SSH key to authorized_keys
mkdir -p "${ROOT}"/home/pi/.ssh/
cat "${SSH_PUBLIC_KEY}" > "${ROOT}"/home/pi/.ssh/authorized_keys

# Set Static IP
sudo cat "$(pwd)"/eth0.txt >> "${ROOT}"/etc/dhcpcd.conf
