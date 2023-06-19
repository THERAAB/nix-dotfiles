{...}: {
  programs.mangohud = {
    enable = true;
    enableSessionWide = true;
    settings = {
      toggle_hud = "Shift_R+F12"; # Right Shift + F12 to toggle display
      no_display = true;
      gpu_stats = true;
      gpu_temp = true;
      cpu_stats = true;
      cpu_temp = true;
      cpu_mhz = true;
      fps = true;
      frametime = true;
      frame_timing = true;
    };
  };
}
