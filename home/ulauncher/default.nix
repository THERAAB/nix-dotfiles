{ config, pkgs, ... }:
{
  home.file.".config/ulauncher/user-themes/Nord-Dark-ULauncher" = {
    source = ./Nord-Dark-ULauncher;
    recursive = true;
  };
}
