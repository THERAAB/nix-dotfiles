{lib, ...}: {
  programs.kitty = {
    enable = true;
    font = {
      name = "JetBrainsMono Nerd Font";
      size = lib.mkDefault 12;
    };
    shellIntegration.enableFishIntegration = true;
    theme = "Catppuccin-Frappe";
    settings = {
      hide_window_decorations = true;
      window_padding_width = 20;
      linux_display_server = "wayland";
      background_opacity = "0.93";
      enable_audio_bell = false;
      confirm_os_window_close = 0;
    };
  };
}
