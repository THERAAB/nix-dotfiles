{ config, pkgs, ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    extraConfig = ''
      bind = SUPER, Return, exec, foot
    '';
  };
}