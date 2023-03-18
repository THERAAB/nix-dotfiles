{ config, pkgs, ... }:
{
  imports = [
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
    ./autostart.nix
  ];
}
