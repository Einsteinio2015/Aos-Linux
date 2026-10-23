#!/bin/bash
set -e

export DEBIAN_FRONTEND=noninteractive

ROOT_DIR="$(cd "$(dirname "$0")" && pwd)"
WORK_DIR="$ROOT_DIR/build"

mkdir -p "$WORK_DIR"
cd "$WORK_DIR"

# Build configuration
lb config \
  --distribution noble \
  --architectures amd64 \
  --archive-areas "main restricted universe multiverse" \
  --bootappend-live "boot=casper live-config" \
  --binary-images iso-hybrid \
  --hostname aos \
  --linux-flavours generic \
  --debian-installer none

# Copy custom package list into the live-build config
mkdir -p config/package-lists
cp "$ROOT_DIR/config/package-lists/aos.list.chroot" config/package-lists/

# Copy branding and OS metadata
mkdir -p config/includes.chroot/etc
mkdir -p config/includes.chroot/usr/local/bin
mkdir -p config/hooks/normal

cp "$ROOT_DIR/config/includes.chroot/etc/os-release" config/includes.chroot/etc/os-release
cp "$ROOT_DIR/config/includes.chroot/etc/hostname" config/includes.chroot/etc/hostname
cp "$ROOT_DIR/config/includes.chroot/etc/hosts" config/includes.chroot/etc/hosts
cp "$ROOT_DIR/config/includes.chroot/usr/local/bin/aos-setup.sh" config/includes.chroot/usr/local/bin/aos-setup.sh
cp "$ROOT_DIR/config/hooks/normal/0999-aos-branding.chroot" config/hooks/normal/0999-aos-branding.chroot

# Ensure the hook is executable when copied into the live filesystem
chmod +x config/includes.chroot/usr/local/bin/aos-setup.sh
chmod +x config/hooks/normal/0999-aos-branding.chroot

# Build the ISO
lb build

echo "Aos Linux ISO build completed."
