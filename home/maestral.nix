{ config, pkgs, ... }:
{
  systemd.user.services.maestral = {
    Install.WantedBy = [ "default.target" ];
    Service = {
      Type = "notify";
      ExecStart = "${pkgs.maestral}/bin/maestral start -f";
      Environment = "PYTHONOPTIMIZE=2 LC_CTYPE=UTF-8";
    };
  };
  home.packages = with pkgs; [
    maestral
  ];
}