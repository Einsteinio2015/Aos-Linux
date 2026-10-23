#!/bin/bash
set -e

# This script is intended to be run after installation or in a chroot environment.
# Customize it later for your desktop setup, user defaults, theme, wallpaper, and app config.

export DEBIAN_FRONTEND=noninteractive

apt-get update
apt-get install -y software-properties-common

echo "Aos Linux setup complete."
