{...}: {
  systemd.tmpfiles.rules = [
    "Z  /games  700 raab    -   -   -"
  ];
  hardware.opengl.enable = true;
  programs = {
    steam.enable = true;
    gamemode = {
      enable = true;
      settings = {
        general = {
          softrealtime = "auto";
          renice = 10;
        };
      };
    };
  };
}
