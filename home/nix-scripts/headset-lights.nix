{ config, pkgs, ... }:
{
  systemd.user = {
    services.headset-lights.Service.ExecStart = "${pkgs.headsetcontrol}/bin/headsetcontrol -l 0";
    timers.headset-lights = {
      Timer = {
        Unit = "headset-lights.service";
        OnCalendar = "*:0/1"; # minutely
      };
      Install.WantedBy = [ "timers.target" ];
    };
  };
}