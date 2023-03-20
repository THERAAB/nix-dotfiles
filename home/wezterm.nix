{ config, pkgs, ... }:
{
  programs.wezterm = {
    enable = true;
    extraConfig = ''
      return {
        xcursor_theme = 'phinger-cursors-light',
        xcursor_size = 40,
        color_scheme = 'Nord (base16)',
        font = wezterm.font 'JetBrainsMono Nerd Font',
        window_background_opacity = 0.9,
        text_background_opacity = 0.9,
        colors = {
        },
        enable_tab_bar = false,
        enable_wayland = true,
        window_frame = {
          active_titlebar_bg = '#2e3440',
          inactive_titlebar_bg = '#2e3440',
          inactive_titlebar_border_bottom = '#2e3440',
          active_titlebar_border_bottom = '#2e3440',
          button_bg = '#2e3440',
        },
      }
    '';
  };
}