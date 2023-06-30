{pkgs, ...}: {
  dconf.settings = {
    "org/gnome/desktop/peripherals/touchpad" = {
      tap-to-click = true;
      speed = 0.19298245614035081;
    };
    "org/gnome/shell" = {
      last-selected-power-profile = "power-saver";
      enabled-extensions = [
        "gestureImprovements@gestures"
      ];
    };
    "org/gnome/desktop/interface" = {
      enable-hot-corners = true;
    };
    "org/gnome/settings-daemon/plugins/power" = {
      sleep-inactive-ac-type = "suspend";
    };
    "org/gnome/shell/extensions/blur-my-shell/panel" = {
      static-blur = true;
    };
    "org/gnome/desktop/screensaver" = {
      lock-enabled = false;
    };
    "org/gnome/shell/extensions/gestureImprovements" = {
      enable-window-manipulation-gesture = false;
      enable-alttab-gesture = false;
      pinch-4-finger-gesture = "NONE";
      pinch-3-finger-gesture = "CLOSE_WINDOW";
    };
    "org/gnome/desktop/interface" = {
      show-battery-percentage = true;
    };
    "org/gnome/settings-daemon/plugins/color" = {
      night-light-enabled = true;
    };
    "org/gnome/shell/extensions/just-perfection" = {
      panel-in-overview = true;
      panel = false;
    };
  };
  home.packages = with pkgs; [
    gnomeExtensions.gesture-improvements
  ];
}
