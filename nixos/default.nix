{ config, pkgs, ... }:
{
  imports = [
    ./plymouth
    ./persist.nix
    ./boot.nix
    ./hardware.nix
    ./users.nix
    ./games.nix
    ./system.nix
    ./pkgs.nix
    ./configuration.nix
    ./hardware-configuration.nix
    ./sops.nix
    ./gnome.nix
    # ./hyprland.nix
    ./fish.nix
    ./starship.nix
  ];
}
