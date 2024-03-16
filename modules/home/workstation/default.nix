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
  };
  config = mkIf cfg.enable {
    nix-dotfiles.workstation = {
      ulauncher.enable = true;
      git.enable = true;
      dconf.enable = true;
      firefox.enable = true;
      fish.enable = true;
      gnome.enable = true;
      gtk.enable = true;
      home.enable = true;
      kitty.enable = true;
      nvim.enable = true;
      vscode.enable = true;
      persist.enable = true;
    };
  };
}
