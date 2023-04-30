{ config, pkgs, ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    extraConfig = ''

      general {
        border_size = 2
        gaps_in = 5
        gaps_out = 10
        col.active_border = rgba(33ccffee) rgba(00ff99ee) 45deg
      }

      decoration {
        rounding = 3
        blur = false
      }

      monitor = DP-3,3440x1440@100,0x0,1
      exec-once = hyprctl setcursor phinger-cursors-light 40
      exec-once = swaybg -i /nix/persist/nix-dotfiles/assets/wall.jpg -m fill
      exec-once = systemctl --user start ulauncher.service

      bind = ALT, Return, exec, foot
      bind = ALT, r, exec, ulauncher-toggle
      bind = ALT SHIFT, Q, killactive

      bind = ALT, 1, workspace, 1
      bind = ALT, 2, workspace, 2
      bind = ALT, 3, workspace, 3
      bind = ALT, 4, workspace, 4
      bind = ALT, 5, workspace, 5

      bind = ALT SHIFT, 1, movetoworkspace, 1
      bind = ALT SHIFT, 2, movetoworkspace, 2
      bind = ALT SHIFT, 3, movetoworkspace, 3
      bind = ALT SHIFT, 4, movetoworkspace, 4
      bind = ALT SHIFT, 5, movetoworkspace, 5
    '';
  };
}