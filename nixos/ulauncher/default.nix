{ config, pkgs, ... }:
let
  config-dir = ".config/ulauncher/user-themes/NordDark";
  local-config-dir = "/nix/persist/nix-dotfiles/home/ulauncher/NordDark";
in
{

  systemd.tmpfiles.rules = [
    "R  ${config-dir}   -   -       -              -   -                   "
    "C  ${config-dir}   -   -       -              -   ${local-config-dir} "
    "Z  ${config-dir}   700 raab    {app-name}     -   -                   "
  ];
}
