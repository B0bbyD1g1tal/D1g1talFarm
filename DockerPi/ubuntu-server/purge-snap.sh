#!/bin/bash
set -xe

snap remove --purge lxd
snap remove --purge core18
snap remove --purge snapd

apt autoremove --purge snapd -y

rm -rf /snap /var/snap /var/lib/snapd /var/cache/snapd/
