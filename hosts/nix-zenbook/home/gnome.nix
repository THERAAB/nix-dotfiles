{pkgs, ...}: {
  dconf.settings = {
    "org/gnome/desktop/peripherals/touchpad" = {
      tap-to-click = true;
    };
    "org/gnome/shell" = {
      last-selected-power-profile = "power-saver";
      enabled-extensions = [
        "gestureImprovements@gestures"
      ];
    };
    "org/gnome/shell/extensions/gestureImprovements" = {
      enable-window-manipulation-gesture = false;
      enable-alttab-gesture = false;
      pinch-4-finger-gesture = "NONE";
      pinch-3-finger-gesture = "CLOSE_WINDOW";
      enable-forward-back-gesture = true;
    };
    "org/gnome/desktop/interface" = {
      show-battery-percentage = true;
    };
    "org/gnome/desktop/background" = {
      picture-uri = "file:///nix/persist/nix-dotfiles/hosts/nix-zenbook/assets/wall.jpg";
      picture-uri-dark = "file:///nix/persist/nix-dotfiles/hosts/nix-zenbook/assets/wall.jpg";
    };
  };
  home.packages = with pkgs; [
    gnomeExtensions.gesture-improvements
  ];
}
