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
  
  # Proton GE in steam
  environment.sessionVariables = rec {
    XDG_CACHE_HOME  = "\${HOME}/.cache";
    XDG_CONFIG_HOME = "\${HOME}/.config";
    XDG_BIN_HOME    = "\${HOME}/.local/bin";
    XDG_DATA_HOME   = "\${HOME}/.local/share";
    # Steam needs this to find Proton-GE
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = "\${HOME}/.steam/root/compatibilitytools.d";
    # note: this doesn't replace PATH, it just adds this to it
    PATH = [ 
      "\${XDG_BIN_HOME}"
    ];
  };
}
