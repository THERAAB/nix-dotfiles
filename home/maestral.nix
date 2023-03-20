{ config, pkgs, ... }:
{
  systemd.user.services.maestral = {
    Install = { WantedBy = [ "default.target" ]; };
      Service = {
        ExecStart = ''
          ${pkgs.maestral}/bin/maestral start
        '';
      };
  };
  home.packages = with pkgs; [
    maestral
  ];
}