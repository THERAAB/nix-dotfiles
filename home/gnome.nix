{ config, pkgs, ... }:
{
  dconf.settings = {
    "org/gnome/shell" = {
      disable-user-extensions = false;
      enabled-extensions = [
        "user-theme@gnome-shell-extensions.gcampax.github.com"
        "blur-my-shell@aunetx"
        "just-perfection-desktop@just-perfection"
        "auto-move-windows@gnome-shell-extensions.gcampax.github.com"
      ];
      favorite-apps = [
        "firefox.desktop"
        "vmware-view.desktop"
        "org.wezfurlong.wezterm.desktop"
        "steam.desktop"
        "idea-community.desktop"
        "org.gnome.TextEditor.desktop"
      ];
    };
    "org/gnome/shell/extensions/auto-move-windows" = {
      application-list = ["vmware-view.desktop:2"];
    };
    "org/gnome/shell/extensions/just-perfection" = {
      theme = true;
      workspace-wrap-around = true;
      startup-status = 0;
      world-clock = false;
      events-button = false;
      show-apps-button = false;
      window-menu-take-screenshot-button = false;
      animation = 3;
    };
    "org/gnome/shell/extensions/blur-my-shell/overview" = {
      style-components = 3;
    };
    "org/gnome/settings-daemon/plugins/power" = {
      sleep-inactive-ac-type = "nothing";
      power-button-action = "interactive";
    };
    "org/gnome/TextEditor" = {
      highlight-current-line = true;
      show-line-numbers = true;
      style-scheme = "peninsula-dark";
    };
    "org/gnome/settings-daemon/plugins/media-keys" = {
      custom-keybindings = [
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3/"
      ];
    };
    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
      command = "wezterm";
      name = "Launch wezterm";
      binding = "<Alt>Return";
    };
    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1" = {
      command = "/home/raab/.config/scripts/switch_audio.sh";
      name = "Switch Audio";
      binding = "<Alt>slash";
    };
    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2" = {
      command = "ulauncher-toggle";
      name = "Toggle ulauncher";
      binding = "<Alt>r";
    };
    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3" = {
      command = "/home/raab/.config/scripts/headphone_battery.sh";
      name = "Headphone battery notification";
      binding = "<Shift><Alt>slash";
    };
    "org/gnome/mutter" = {
      dynamic-workspaces = false;
      center-new-windows = true;
    };
    "org/gnome/desktop/wm/preferences" = {
      num-workspaces = 4;
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
      clock-format = "12h";
      monospace-font-name = "JetBrainsMono Nerd Font 10";
    };
    "org/gtk/settings/file-chooser" = {
      clock-format = "12h";
    };
    "org/gnome/desktop/background" = {
      picture-uri = "file:///nix/persist/nix-dotfiles/assets/wall.jpg";
      picture-uri-dark = "file:///nix/persist/nix-dotfiles/assets/wall.jpg";
    };
    "org/gnome/shell/extensions/user-theme" = {
       name = "Nordic";
    };
  };
  home.packages = with pkgs; [
    gnomeExtensions.user-themes
    gnomeExtensions.blur-my-shell
    gnomeExtensions.just-perfection
    gnomeExtensions.auto-move-windows
    gnome.gnome-tweaks
    nordic
  ];
}