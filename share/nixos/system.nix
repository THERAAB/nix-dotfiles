{pkgs, ...}: {
  security.auditd.enable = true;
  nix.settings = {
    allowed-users = ["@wheel"];
    substituters = ["https://cache.pumpkin.rodeo"];
    trusted-public-keys = ["cache.pumpkin.rodeo:IqbrtbXMzwCjSVZ/sWowaPXtjS+CtpCpStmabZI2TSo="];
  };

  # For GNOME based apps
  programs.dconf.enable = true;

  environment.variables.EDITOR = "nvim";

  fonts.fonts = with pkgs; [
    (nerdfonts.override {fonts = ["JetBrainsMono" "Noto"];})
  ];

  services.locate = {
    enable = true;
    locate = pkgs.plocate;
    localuser = null;
  };
}
