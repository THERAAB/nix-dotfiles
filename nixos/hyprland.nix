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

  programs.gamescope.enable = true;
  programs.steam.gamescopeSession.enable = true;

  environment.variables.XDG_CURRENT_DESKTOP = "Hyprland";
  environment.variables.XDG_SESSION_TYPE = "wayland";
  environment.variables.XDG_SESSION_DESKTOP = "Hyprland";
  environment.variables.GDK_BACKEND = "wayland,x11";

  environment.systemPackages = with pkgs; [
    dunst
    swaybg
    mpd
    wl-clipboard
  ];
}