{ config, pkgs, ... }:
{ 
  hardware.opengl.enable = true;
  # Temporary workaround to change mesa version so GNOME Wayland can boot
  # Can remove after below is updated:
  # https://github.com/NixOS/nixpkgs/commits/nixos-unstable/nixos/modules/hardware/opengl.nix
  # hardware.opengl.mesaPackage = pkgs.mesa;
  programs.steam.enable = true;
  programs.gamemode = { 
    enable = true;
    settings = {
      general = {
        softrealtime = "auto";
        renice = 10;
      };
    };
  };
}
