#!/bin/bash
###############################################################################
set -xe
# Mounted ubuntu sdcard partitions
BOOT=/media/"${USER}"/system-boot/
#ROOT=/media/"${USER}"/writable/
###############################################################################
# Ubuntu Server on Raspberry Pi
###############################################################################
# Enable SSH
touch "${BOOT}"ssh
# Users, groups, ssh keys, OS updates and packages
cp "$(pwd)"/user-data "${BOOT}"user-data
# Network
cp "$(pwd)"/network-config "${BOOT}"network-config
