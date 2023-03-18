{ config, pkgs, ... }:
{
  imports = [
    ./nvim
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
  ];
  home.file.".config/scripts" = {
    source = ./scripts;
    recursive = true;
  };
}
