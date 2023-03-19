{ config, pkgs, ... }:
{
  programs.wezterm = {
    enable = true;
    extraConfig = ''
      return {
        color_scheme = 'Edge Dark (base16)',
        font = wezterm.font 'JetBrainsMono Nerd Font',
        window_background_opacity = 0.9,
        text_background_opacity = 0.9,
        colors = {
        },
        enable_tab_bar = false,
      }
    '';
  };
}