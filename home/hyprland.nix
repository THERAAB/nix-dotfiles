{ config, pkgs, ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    extraConfig = ''
      bind = ALT, Return, exec, foot
    '';
  };
}