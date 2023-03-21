{ config, pkgs, ... }:
{
  programs.mangohud = {
    enable = true;
    enableSessionWide = true;
    settings = {
      toggle_hud = "Shift_R+F12"; # Right Shift + F12 to toggle display
      no_display = true;
    };
  };
}
