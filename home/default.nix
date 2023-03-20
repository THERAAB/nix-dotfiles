{ config, pkgs, ... }:
{
  imports = [
    ./zsh
    ./persist.nix
    ./pkgs.nix
    ./git.nix
    ./games.nix
    ./firefox.nix
    ./home.nix
    ./gtk.nix
    ./gnome.nix
    ./wezterm.nix
    ./nvim.nix
    ./maestral.nix
    ./steam.nix
    ./ulauncher.nix
  ];
  home.file.".config/scripts" = {
    source = ./scripts;
    recursive = true;
  };
}
