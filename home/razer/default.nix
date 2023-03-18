{ config, pkgs, ... }:
{
  home.file.".config/openrazer/razer.conf" = {
    source = ./razer.conf;
  };
}
