{ config, pkgs, ... }:
{
  programs.kitty = {
    enable = true;
    font = {
      name = "JetBrainsMono Nerd Font";
      size = 12;
    };
    shellIntegration.enableFishIntegration = true;
    theme = "Catppuccin-Frappe";
    settings = {
      hide_window_decorations = true;
      window_padding_width = 20;
      linux_display_server = "wayland";
      background_opacity = "0.93";
    };
  };
}