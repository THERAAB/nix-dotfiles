{ config, pkgs, ... }:
{
  systemd.services.autostart = {
    script = ''
      /home/raab/.config/scripts/autostart.sh
    '';
    wantedBy = [ "multi-user.target" ];
  };
}