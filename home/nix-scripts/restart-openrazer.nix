{ config, pkgs, ... }:
{
  systemd.user = {
    services.restart-openrazer.Service.ExecStart = "systemctl --user restart openrazer-daemon.service";
    timers.restart-openrazer = {
      Timer = {
        Unit = "restart-openrazer.service";
        OnCalendar = "*:0/15"; # fifteen-minutely
      };
      Install.WantedBy = [ "timers.target" ];
    };
  };
}