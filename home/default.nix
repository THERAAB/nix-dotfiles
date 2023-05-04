{ config, pkgs, ... }:
{
  imports = [
    ./ulauncher
    ./nix-scripts
    ./mangohud.nix
    ./persist.nix
    ./pkgs.nix
    ./git.nix
    ./firefox.nix
    ./home.nix
    ./gtk.nix
    ./gnome.nix
    ./dconf.nix
    # ./hyprland.nix
    ./maestral.nix
    ./steam.nix
    ./nixvim.nix
    ./fish.nix
    ./helix.nix
    ./foot.nix
  ];
}
