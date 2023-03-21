{ config, pkgs, ... }:
{
  systemd.user.services.static-workspaces = {
    Install.WantedBy = [ "graphical-session.target" ];
    Unit.After = [ "graphical-session.target" ];
    Service.ExecStart = "${pkgs.dconf}/bin/dconf write /org/gnome/mutter/dynamic-workspaces 'false'";
  };
}