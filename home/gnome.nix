{ config, pkgs, ... }:
{
  dconf.settings = {
    "org/gnome/shell" = {
      disable-user-extensions = false;
      enabled-extensions = [
        "user-theme@gnome-shell-extensions.gcampax.github.com"
      ];
      favorite-apps = [
        "firefox.desktop"
        "org.gnome.Nautilus.desktop"
        "kitty.desktop"
        "vmware-view.desktop"
        "steam.desktop"
        "idea-community.desktop"
      ];
    };
    "org/gnome/shell/extensions/user-theme" = {
#      name = "Juno";
    };
    "org/gnome/settings-daemon/plugins/power" = {
      sleep-inactive-ac-type = "nothing";
      power-button-action = "interactive";
    };
    "org/gnome/settings-daemon/plugins/media-keys" = {
      custom-keybindings = ["/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"];
    };
    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
      command = "kitty";
      name = "Launch Kitty";
      binding = "<Alt>Return";
    };
    "org/gnome/desktop/wm/keybindings" = {
      switch-to-workspace-left = ["<Alt>Left"];
      switch-to-workspace-right = ["<Alt>Right"];
      move-to-workspace-1 = ["<Shift><Alt>1"];
      move-to-workspace-2 = ["<Shift><Alt>2"];
      move-to-workspace-3 = ["<Shift><Alt>3"];
      move-to-workspace-4 = ["<Shift><Alt>4"];
      switch-to-workspace-1 = ["<Alt>1"];
      switch-to-workspace-2 = ["<Alt>2"];
      switch-to-workspace-3 = ["<Alt>3"];
      switch-to-workspace-4 = ["<Alt>4"];
      close = ["<Shift><Alt>q"];
    };
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      enable-hot-corners = false;
    };
    "org/gnome/desktop/background" = {
      picture-uri-dark = "file:///nix/persist/nix-dotfiles/assets/wall.jpg";
    };
  };

  home.packages = with pkgs; [
    gnomeExtensions.user-themes
  ];
}