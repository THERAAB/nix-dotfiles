{ config, pkgs, ... }:
{
  systemd.user.timers.restart-openrazer = {
    Timer = {
      Unit = "openrazer-daemon.service";
      OnCalendar = "*:0/15"; # fifteen-minutely
    };
    Install.WantedBy = [ "timers.target" ];
  };
}