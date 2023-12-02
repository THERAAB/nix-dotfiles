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

  fonts.packages = with pkgs; [
    (nerdfonts.override {fonts = ["JetBrainsMono" "Noto"];})
  ];

  services.locate = {
    enable = true;
    package = pkgs.plocate;
    localuser = null;
  };
}
