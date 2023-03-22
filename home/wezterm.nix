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
        window_close_confirmation = "NeverPrompt",
        enable_tab_bar = false,
        window_decorations = "RESIZE",
        enable_wayland = true,
        window_padding = {
          left = '20px',
          right = '20px',
          top = '20px',
          bottom = '20px',
        },
      }
    '';
  };
}