{...}: {
  dconf.settings = {
    "org/gnome/desktop/peripherals/touchpad" = {
      tap-to-click = true;
    };
    "org/gnome/shell" = {
      last-selected-power-profile = "power-saver";
    };
    "org/gnome/desktop/interface" = {
      show-battery-percentage = true;
    };
    "org/gnome/desktop/background" = {
      picture-uri = "file:///nix/persist/nix-dotfiles/hosts/nix-zenbook/assets/wall.jpg";
      picture-uri-dark = "file:///nix/persist/nix-dotfiles/hosts/nix-zenbook/assets/wall.jpg";
    };
  };
}
