{ config, pkgs, ... }:
{
  systemd.user.services.maestral = {
    Install.WantedBy = [ "graphical-session.target" ];
    Unit.After = [ "graphical-session.target" ];
    Service.ExecStart = "${pkgs.maestral}/bin/maestral start";
  };
  home.packages = with pkgs; [
    maestral
  ];
}