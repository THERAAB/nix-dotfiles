{ config, pkgs, ... }:
{
  systemd.user.services.ulauncher = {
    Install = { WantedBy = [ "graphical-session.target" ]; };
    Unit = {
      After = [ "graphical-session.target" ];
    };
      Service = {
        ExecStart = ''
          ${pkgs.ulauncher}/bin/ulauncher  --hide-window
        '';
      };
  };
}