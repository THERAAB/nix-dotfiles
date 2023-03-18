{ config, pkgs, ... }:
{
  systemd.services.autostart = {
    script = ''
      ${pkgs.maestral}/bin/maestral start &
      /home/raab/.config/scripts/headphone_lights.sh &
      /home/raab/.config/scripts/restart_openrazer_loop.sh &
      ${pkgs.steam}/bin/steam -silent &
    '';
    wantedBy = [ "multi-user.target" ];
    after = [ "network.target" ];
  };
}