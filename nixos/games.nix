{ config, pkgs, ... }:
{ 
  hardware.opengl.enable = true;
  programs.steam.enable = true;
  programs.gamemode = { 
    enable = true;
    settings = {
      general = {
        softrealtime = "auto";
        renice = 10;
      };
    };
  };
}
