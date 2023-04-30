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
  security.polkit.enable = true;

  environment.systemPackages = with pkgs; [
    dunst
  ];
}