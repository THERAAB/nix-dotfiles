{ config, pkgs, ... }:
{
  systemd.user.services.ulauncher = {
    Install = { WantedBy = [ "default.target" ]; };
      Service = {
        ExecStart = ''
          ${pkgs.ulauncher}/bin/ulauncher  --hide-window
        '';
      };
  };
}