{ config, pkgs, ... }:
{
  imports = [
    ./zsh
    ./razer
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
  ];
  home.file.".config/scripts" = {
    source = ./scripts;
    recursive = true;
  };
}
