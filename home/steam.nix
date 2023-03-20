{ config, pkgs, ... }:
{
  systemd.user.services.steam = {
    Install.WantedBy = [ "graphical-session.target" ];
    Unit.After = [ "graphical-session.target" ];
    Service.ExecStart = "${pkgs.steam}/bin/steam -silent";
  };
}