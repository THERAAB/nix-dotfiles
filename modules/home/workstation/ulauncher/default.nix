{
  pkgs,
  lib,
  config,
  ...
}:
with lib;
with lib.nix-dotfiles; let
  user-themes-dir = "/home/raab/.config/ulauncher/user-themes/";
  cfg = config.nix-dotfiles.workstation.ulauncher;
in {
  options.nix-dotfiles.workstation.ulauncher = with types; {
    enable = mkEnableOption (lib.mdDoc "Setup Ulauncher");
    theme-dir = mkOption {
      type = str;
    };
  };
  config = mkIf cfg.enable {
    systemd.user.services.ulauncher = {
      Install.WantedBy = ["graphical-session.target"];
      Unit.After = ["graphical-session.target"];
      Service.ExecStart = toString (pkgs.writeShellScript "ulauncher-start" ''
        mkdir -p ${user-themes-dir}
        cp -r ${cfg.theme-dir} ${user-themes-dir}
        ${pkgs.ulauncher}/bin/ulauncher --hide-window
      '');
    };
    home.packages = with pkgs; [
      ulauncher
    ];
  };
}
