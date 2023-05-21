{...}: {
  programs.mangohud = {
    enable = true;
    enableSessionWide = true;
    settings = {
      toggle_hud = "Shift_R+F12"; # Right Shift + F12 to toggle display
      no_display = true;
      gpu_stats = true;
      gpu_temp = true;
      gpu_mem_temp = true;
      cpu_stats = true;
      cpu_temp = true;
      cpu_power = true;
      cpu_mhz = true;
      ram = true;
      fps = true;
      frametime = true;
      frame_timing = true;
    };
  };
}
