{ config, pkgs, lib, ... }:
{
  services.xserver = {
    enable = true;
    displayManager = {
      lightdm = {
        enable = true;
#        greeter = {
#          enable = true;
#          package = pkgs.web-greeter;
#          name = "web-greeter";
#        };
      };
      defaultSession = "hyprland";
      autoLogin = {
        enable = true;
        user = "raab";
      };
    };
#    desktopManager.gnome.enable = true;
  };
  programs.hyprland.enable = true;
}