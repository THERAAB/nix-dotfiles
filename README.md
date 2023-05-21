# Nix-Dotfiles

A [NixOS](https://nixos.org/) configuration repository for my desktop dotfiles.
[NixOS](https://nixos.org/) allows you to create a fully declarative operating system using the [Nix language](https://nixos.wiki/wiki/Overview_of_the_Nix_Language).
This repo contains everything needed to rebuild my desktop from scratch, with the only manual steps being in the README file below.

![screenshot-png](https://github.com/THERAAB/nix-dotfiles/blob/main/assets/screenshot.png?raw=true "PNG of Screenshot")

## What's inside

My NixOS Desktop, with:

- [GNOME](https://www.gnome.org/) on [Wayland](https://wiki.archlinux.org/title/Wayland)
- Declarative/Reproducible builds using [NixOS](https://nixos.org/)
- An Ephemeral root/home storage scheme (See [Erase your darlings](https://grahamc.com/blog/erase-your-darlings) and [NixOS Impermanence](https://github.com/nix-community/impermanence))
- Secret management with [sops-nix](https://github.com/Mic92/sops-nix/blob/master/README.md)
- Dependency pinning with [Nix Flakes](https://nixos.wiki/wiki/Flakes)
- Local user declarative setup with [Home Manager](https://github.com/nix-community/home-manager)
- [BTRFS](https://btrfs.wiki.kernel.org/index.php/Main_Page) file system (Copy on Write, Compression)
- [Catppuccin](https://github.com/catppuccin/catppuccin) for theming
- [Forge](https://github.com/forge-ext/forge) for tiling window management

## Maintenance

These commands might help with some common maintenance tasks

```console
# Check recent NixOS generations
sudo nix-env -p /nix/var/nix/profiles/system --list-generations

# Check last boot logs of certain priority (0-5)
journalctl -b -1 -p 0..5

# Add/modify secrets
sops /nix/persist/nix-dotfiles/secrets/secrets.yaml

# See anything not persisted by NixOs Persistence module (non 0B files will be wiped on boot)
ncdu -x /

# List systemd units
systemctl list-units

# Check unit failures
journalctl -u ${unit-name}

# Monitor GNOME settings to be stored in gnome.nix
dconf watch /

# Snapper compare x & y
snapper -c persist list
snapper -c persist status x..y
snapper -c persist diff x..y /nix/persist/filename
```

## Installation

This repo contains some customizations for my specific setup, and you likely won't be able to follow these instructions exactly
if you're not me for 3 reasons:

- You probably don't have my hardware (Ryzen 7700X, Radeon 7900XTX, ASRock X670E Pro RS, 4 nvme)
- You probably don't have my sops keys (shoutout to my FBI agent!)
- You likely won't have same IPs and network, firewall (pfSense), and tailscale setup

### Download NixOS

- Grab the GNOME installer from the [NixOS Downloads Page](https://nixos.org/download.html#nix-install-linux)
- Copy it onto a flash drive (I recommend [Ventoy](https://www.ventoy.net/en/index.html) for this)
- Tailscale cleanup of old device
- Boot into flash drive (F11 to load boot menu on startup)

### Get this repo so we can run some scripts

```console
nix-shell -p git
sudo git clone https://github.com/THERAAB/nix-dotfiles instructions
gnome-text-editor instructions/wipe-disk-and-install.sh &
```

I recommend copy-pasting what commands you need because this script is dangerous (will wipe entire system). It also
expects you to have 4 nvme devices to be run in RAID 0 on btrfs

### Reboot, activate tailscale

```console
sudo tailscale up
```

- Update tailscale IP in share/network.properties.nix

### Setup GitHub with SSH

Place sops keys from [Bitwarden](https://vault.bitwarden.com/#/login)

```console
vi ~/.config/sops/age/keys.txt
sudo vi /nix/persist/system/etc/ssh/ssh_host_ed25519_sops
```

Change git to SSH now that we have our SSH key

```console
cd /nix/persist/nix-dotfiles
git remote set-url origin git@github.com:THERAAB/nix-dotfiles.git
```

Finally, update, optimize store, and reboot

```console
update-full-with-git
nix-store --optimise
sudo reboot
```

Check [manual-setup.md](https://github.com/THERAAB/nix-dotfiles/blob/main//manual-setup.md) for specific manual app setups
