{pkgs, ...}: {
  security.auditd.enable = true;
  nix.settings.allowed-users = ["@wheel"];

  # For GNOME based apps
  programs.dconf.enable = true;

  environment.variables.EDITOR = "hx";

  fonts.fonts = with pkgs; [
    (nerdfonts.override {fonts = ["JetBrainsMono" "Noto"];})
  ];

  services.locate = {
    enable = true;
    locate = pkgs.plocate;
    localuser = null;
  };
}
