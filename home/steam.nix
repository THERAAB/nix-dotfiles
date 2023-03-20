{ config, pkgs, ... }:
{
  systemd.user.services.steam = {
    Install = { WantedBy = [ "default.target" ]; };
      Service = {
        ExecStart = ''
          ${pkgs.steam}/bin/steam -silent
        '';
      };
  };
}