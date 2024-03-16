# Nix-Dotfiles

A [NixOS](https://nixos.org/) configuration repository for my local dotfiles.
[NixOS](https://nixos.org/) allows you to create a fully declarative operating system using the [Nix language](https://nixos.wiki/wiki/Overview_of_the_Nix_Language).
This repo contains everything needed to rebuild my workstations from scratch, with the only manual steps being in the README file(s) in each machine's directory.

![screenshot-png](https://github.com/THERAAB/nix-dotfiles/blob/main/assets/screenshot.png?raw=true "PNG of Screenshot")

## What's inside

My NixOS Machines, with:

- [GNOME](https://www.gnome.org/) on [Wayland](https://wiki.archlinux.org/title/Wayland)
- Declarative/Reproducible builds using [NixOS](https://nixos.org/)
- [Snowfall](https://snowfall.org/guides/lib/quickstart/) project structure
- An Ephemeral root/home storage scheme (See [Erase your darlings](https://grahamc.com/blog/erase-your-darlings) and [NixOS Impermanence](https://github.com/nix-community/impermanence))
- Secret management with [sops-nix](https://github.com/Mic92/sops-nix/blob/master/README.md)
- Dependency pinning with [Nix Flakes](https://nixos.wiki/wiki/Flakes)
- Local user declarative setup with [Home Manager](https://github.com/nix-community/home-manager)
- [BTRFS](https://btrfs.wiki.kernel.org/index.php/Main_Page) file system (Copy on Write, Compression)
- [Catppuccin](https://github.com/catppuccin/catppuccin) for theming
- [Forge](https://github.com/forge-ext/forge) for tiling window management

## Machine Specific documentation

[Nix-Desktop](https://github.com/THERAAB/nix-dotfiles/blob/main/systems/x86_64-linux/nix-desktop/README.md)

[Nix-Zenbook](https://github.com/THERAAB/nix-dotfiles/blob/main/systems/x86_64-linux/nix-zenbook/README.md)

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

# Reboot into UEFI
systemctl reboot --firmware-setup
```
