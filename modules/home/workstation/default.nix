{
  lib,
  config,
  ...
}:
with lib;
with lib.nix-dotfiles; let
  cfg = config.nix-dotfiles.workstation;
in {
  options.nix-dotfiles.workstation = with types; {
    enable = mkEnableOption (lib.mdDoc "Setup workstation");
    ulauncher-theme-dir = mkOption {
      type = str;
    };
    git-config-dir = mkOption {
      type = str;
    };
  };
  config = mkIf cfg.enable {
    nix-dotfiles.workstation = {
      ulauncher = {
        theme-dir = cfg.ulauncher-theme-dir;
        enable = true;
      };
      git = {
        config-dir = cfg.git-config-dir;
        enable = true;
      };
      dconf.enable = true;
      firefox.enable = true;
      fish.enable = true;
      gnome.enable = true;
      gtk.enable = true;
      home.enable = true;
      kitty.enable = true;
      nvim.enable = true;
      vscode.enable = true;
    };
  };
}
