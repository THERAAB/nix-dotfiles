{ config, pkgs, ... }:
{
  imports = [
    ./headset-lights.nix
    ./restart-openrazer.nix
  ];
}
