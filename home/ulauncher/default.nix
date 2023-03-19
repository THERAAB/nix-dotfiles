{ config, pkgs, ... }:
{
  home.file.".config/ulauncher/NordDark" = {
    source = ./NordDark;
    recursive = true;
  };
}
