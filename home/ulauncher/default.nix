{ config, pkgs, ... }:
let
  user-themes-dir = "/home/raab/.config/ulauncher/user-themes/";
  local-theme = "/nix/persist/nix-dotfiles/home/ulauncher/NordDark";
in
{
  systemd.user.services.ulauncher = {
    Install = { WantedBy = [ "graphical-session.target" ]; };
    Unit = {
      After = [ "graphical-session.target" ];
    };
      Service = {
        ExecStart = toString (pkgs.writeShellScript "ulauncher-start" ''
          mkdir -p ${user-themes-dir}
          cp -r ${local-theme} ${user-themes-dir}
          ${pkgs.ulauncher}/bin/ulauncher  --hide-window
        '');
      };
  };
}