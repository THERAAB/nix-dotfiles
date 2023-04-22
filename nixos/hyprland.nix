{ config, pkgs, lib, ... }:
{
  services.xserver = {
    enable = true;
    displayManager = {
      lightdm.enable = true;
      defaultSession = "hyprland";
      autoLogin = {
        enable = true;
        user = "raab";
      };
    };
  };
  programs.hyprland.enable = true;
}