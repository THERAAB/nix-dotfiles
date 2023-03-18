{ config, pkgs, ... }:
{
  systemd.services.autostart = {
    script = ''
      ${pkgs.maestral}/bin/maestral start &
      /home/raab/.config/scripts/headphone_lights.sh &
      /home/raab/.config/scripts/restart_openrazer_loop.sh &
      ${pkgs.steam}/bin/steam -silent &
    '';
    serviceConfig = {
      User = "raab";
      Group = "users";
    };
  };
  # Delay start for 60s because it needs to run after home-manager for /home/raab/.config/scripts/ to exist
  # There's a better way to do this with wantedBy, but lazy
  systemd.timers."start-autostart" = {
    wantedBy = [ "timers.target" ];
    timerConfig = {
      OnBootSec = "60s";
      Unit = "autostart.service";
    };
  };
}