{pkgs, lib, ...}: {
  dconf.settings = {
    "org/gnome/shell" = {
      disable-user-extensions = false;
      enabled-extensions = [
        "user-theme@gnome-shell-extensions.gcampax.github.com"
        "blur-my-shell@aunetx"
        "just-perfection-desktop@just-perfection"
        "auto-move-windows@gnome-shell-extensions.gcampax.github.com"
        "rounded-window-corners@yilozt"
        "activitiesworkspacename@ahmafi.ir"
        "unite@hardpixel.eu"
        "forge@jmmaranan.com"
      ];
      favorite-apps = [
        "firefox.desktop"
        "org.gnome.Nautilus.desktop"
        "vmware-view.desktop"
        "kitty.desktop"
        "steam.desktop"
        "codium.desktop"
        "org.gnome.TextEditor.desktop"
      ];
    };
    "org/gnome/shell/extensions/forge" = {
      tiling-mode-enabled = true;
      window-gap-hidden-on-single = true;
      focus-border-toggle = true;
    };
    "org/gnome/shell/extensions/unite" = {
      extend-left-box = false;
      autofocus-windows = false;
      show-legacy-tray = false;
      show-desktop-name = false;
      enable-titlebar-actions = false;
      restrict-to-primary-screen = false;
      hide-activities-button = "never";
      hide-window-titlebars = "always";
      show-window-title = "never";
      show-window-buttons = "never";
      notifications-position = "center";
    };
    "org/gnome/shell/extensions/auto-move-windows" = {
      application-list = [
        "vmware-view.desktop:2"
        "steam.desktop:3"
      ];
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
      activities-button = false;
      window-demands-attention-focus = true;
    };
    "org/gnome/shell/extensions/blur-my-shell/overview" = {
      style-components = 3;
    };
    "org/gnome/shell/extensions/blur-my-shell/panel" = {
      blur = true;
      sigma = 0;
    };
    "org/gnome/shell/extensions/rounded-window-corners" = {
      black-list = ["ulauncher"];
    };
    "org/gnome/settings-daemon/plugins/power" = {
      sleep-inactive-ac-type = lib.mkDefault "nothing";
      power-button-action = "interactive";
    };
    "org/gnome/settings-daemon/plugins/media-keys" = {
      logout = ["<Control><Alt>Page_Up"]; # Change Alt+Ctrl+Del hotkey so it doesn't get intercepted prior to VM
      custom-keybindings = [
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3/"
      ];
    };
    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
      command = "kitty";
      name = "Launch kitty";
      binding = "<Alt>Return";
    };
    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1" = {
      command = toString (pkgs.writeShellScript "switch-audio" ''
        kantoSPDIF="alsa_output.pci-0000_1b_00.6.iec958-stereo"
        logitechHeadphones="alsa_output.usb-Logitech_G733_Gaming_Headset-00.iec958-stereo"
        headPhoneIcon="/run/current-system/sw/share/icons/Adwaita/96x96/devices/audio-headset-symbolic.symbolic.png"
        kantoIcon="/run/current-system/sw/share/icons/Adwaita/96x96/devices/audio-speakers-symbolic.symbolic.png"

        currentDefault="$(${pkgs.pulseaudio}/bin/pactl get-default-sink)"

        if [ "$currentDefault" = $logitechHeadphones ]; then
          ${pkgs.pulseaudio}/bin/pactl set-default-sink $kantoSPDIF
          ${pkgs.libnotify}/bin/notify-send -i $kantoIcon -u critical "Audio Switched to Kanto"
        else
          ${pkgs.pulseaudio}/bin/pactl set-default-sink $logitechHeadphones
          ${pkgs.libnotify}/bin/notify-send -i $headPhoneIcon -u critical "Audio Switched to Logitech"
        fi
      '');
      name = "Switch Audio";
      binding = "<Alt>slash";
    };
    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2" = {
      command = "ulauncher-toggle";
      name = "Toggle ulauncher";
      binding = "<Alt>r";
    };
    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3" = {
      command = toString (pkgs.writeShellScript "headphone-battery" ''
        percentage=$(${pkgs.headsetcontrol}/bin/headsetcontrol -b -c)
        headPhoneIcon="/run/current-system/sw/share/icons/Adwaita/96x96/devices/audio-headset-symbolic.symbolic.png"

        ${pkgs.libnotify}/bin/notify-send -i "$headPhoneIcon" -u critical "$percentage% battery remaining"
      '');
      name = "Headphone battery notification";
      binding = "<Shift><Alt>slash";
    };
    "org/gnome/mutter" = {
      dynamic-workspaces = false;
      center-new-windows = true;
    };
    "org/gnome/desktop/wm/preferences" = {
      num-workspaces = 4;
      workspace-names = ["   Browse" "󰍹   Work" "   Games" "  Code"];
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
      clock-format = "12h";
      clock-show-weekday = true;
    };
    "org/gtk/settings/file-chooser" = {
      clock-format = "12h";
    };
    "org/gnome/shell/extensions/user-theme" = {
      name = "Catppuccin-Frappe-Standard-Blue-Dark";
    };
  };

  # Extra dconf settings which can't be covered by dconf module due to timing or syntax issues
  systemd.user.services.extra-dconf-gnome = {
    Install.WantedBy = ["graphical-session.target"];
    Unit.After = ["graphical-session.target"];
    Service.ExecStart = toString (pkgs.writeShellScript "extra-dconf-gnome" ''
      ${pkgs.dconf}/bin/dconf write /org/gnome/mutter/dynamic-workspaces "false"
      ${pkgs.dconf}/bin/dconf write /org/gnome/desktop/session/idle-delay "uint32 0"
    '');
  };

  home.packages = with pkgs; [
    gnomeExtensions.user-themes
    gnomeExtensions.blur-my-shell
    gnomeExtensions.just-perfection
    gnomeExtensions.auto-move-windows
    gnomeExtensions.rounded-window-corners
    gnomeExtensions.activities-workspace-name
    gnomeExtensions.unite
    gnomeExtensions.forge
    gnome.gnome-tweaks
  ];
}
