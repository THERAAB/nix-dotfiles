{ config, pkgs, ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    extraConfig = ''

      general {
        border_size = 2
        gaps_in = 5
        gaps_out = 10
        col.active_border = rgba(eebebeee) rgba(ca9ee6ee) 45deg
        col.inactive_border = rgba(303446ee)
        no_border_on_floating = true
        cursor_inactive_timeout = 15
        resize_on_border = true
      }

      decoration {
        rounding = 3
        blur = false
      }

      input {
        numlock_by_default = true
        follow_mouse = 2
      }

      misc {
        disable_hyprland_logo = true
        disable_splash_rendering = true
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

      # Move/resize windows with ALT + LMB/RMB and dragging
      bindm = ALT, mouse:272, movewindow
      bindm = ALT, mouse:273, resizewindow

    '';
  };
  programs.waybar = {
    enable = true;
    package = pkgs.waybar.overrideAttrs (oldAttrs: {
       mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
    });
    systemd.enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 30;
        output = [
          "DP-3"
        ];
        modules-left = [ "wlr/workspaces" ];
        modules-center = [ "clock" ];
        modules-right = [ "temperature" "network" "battery" ];
      };
    };
  };
}