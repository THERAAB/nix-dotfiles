{ config, pkgs, ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    extraConfig = ''
      bind = ALT, Return, exec, foot
      bind = ALT, r, exec, ulauncer-toggle
      bind = ALT SHIFT, Q, killactive
      bind = ALT, 1, workspace, 1
      bind = ALT, 2, workspace, 2
      bind = ALT, 3, workspace, 3
      bind = ALT, 4, workspace, 4
      bind = ALT, 5, workspace, 5
    '';
  };
}