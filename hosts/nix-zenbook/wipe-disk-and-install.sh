#!/bin/bash

########################################################################################################################
#                                   ---------- READ HERE FIRST ---------
#   NOTE: I recommend copy-pasting what commands you need because this script is dangerous.
#   If run fully, it will wipe entire system.
#   It also expects you to have /dev/nvme0n1 formatted as per below sections
########################################################################################################################

# ----------------------------------------------------------------------------------------------------------------------
# Wipe /dev/nvme0n1 (Bootloader & OS Install) and reformat
# Don't do this unless you want to wipe your OS
# ----------------------------------------------------------------------------------------------------------------------
# Make partitions for /dev/nvme0n1
sudo parted /dev/nvme0n1 -- mklabel gpt
sudo parted /dev/nvme0n1 -- mkpart ESP fat32 1MB 512MB
sudo parted /dev/nvme0n1 -- set 1 esp on
sudo parted /dev/nvme0n1 -- mkpart primary btrfs 512MB 100%

# TODO: make swap with label "swap"

# Format /dev/nvme0n1 boot fs
sudo mkfs.fat -F 32 -n BOOT /dev/nvme0n1p1
# Create btrfs volume on /dev/nvme0n1
sudo mkfs.btrfs -f -L nixos /dev/nvme0n1p2

# ----------------------------------------------------------------------------------------------------------------------
# NixOs Setup and Install
# ----------------------------------------------------------------------------------------------------------------------
# Verify disk formatting worked
sudo fdisk -l

# Then Create btrfs subvolumes
cd /
sudo mkdir -p /mnt
sudo mount /dev/disk/by-label/nixos /mnt
cd /mnt
sudo btrfs subvolume create nix
sudo btrfs subvolume create persist
sudo btrfs subvolume create dropbox
cd ..
sudo umount /mnt

# Create dirs, Mount tmpfs & subvolumes
sudo mount -t tmpfs none /mnt
sudo mkdir -p /mnt/{home/raab,nix,boot,dropbox,etc/nixos}
sudo mount -t tmpfs none /mnt/home/raab
sudo mount -o compress=zstd,noatime,subvol=nix /dev/disk/by-label/nixos /mnt/nix
sudo mkdir -p /mnt/nix/persist
sudo mount -o compress=zstd,noatime,subvol=persist /dev/disk/by-label/nixos /mnt/nix/persist
sudo mount -o compress=zstd,noatime,subvol=dropbox /dev/disk/by-label/nixos /mnt/dropbox
sudo mkdir -p /mnt/nix/persist/system/etc/nixos
sudo mkdir -p /mnt/nix/persist/home/raab
sudo mount -o bind /mnt/nix/persist/system/etc/nixos /mnt/etc/nixos
sudo mount /dev/disk/by-label/BOOT /mnt/boot
cd /mnt/nix/persist

# Place git repo in the right spot
sudo git clone https://github.com/THERAAB/nix-dotfiles /mnt/nix/persist/nix-dotfiles
cd /mnt/nix/persist/nix-dotfiles

# !! TODO: Before nix-install we need to fix audio driver

# Install NixOs
sudo nixos-install --flake .#nix-zenbook

# Reboot, Remove flash drive, and go back to README.md
sudo reboot
# ----------------------------------------------------------------------------------------------------------------------
