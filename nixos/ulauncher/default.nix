{ config, pkgs, ... }:
let
  config-dir = "/home/raab/.config/ulauncher/user-themes/NordDark";
  local-config-dir = "/nix/persist/nix-dotfiles/nixos/ulauncher/NordDark";
in
{
  systemd.tmpfiles.rules = [
    "R  ${config-dir}   -   -       -   -   -                   "
    "C  ${config-dir}   -   -       -   -   ${local-config-dir} "
    "Z  ${config-dir}   700 raab    -   -   -                   "
  ];
}
