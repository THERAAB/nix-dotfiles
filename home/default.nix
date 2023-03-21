{ config, pkgs, ... }:
{
  imports = [
    ./zsh
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
    ./wezterm.nix
    ./nvim.nix
    ./maestral.nix
    ./steam.nix
  ];
}
