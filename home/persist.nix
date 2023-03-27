{ config, pkgs, ... }:
{
  home.persistence."/nix/persist/home/raab" = {
    allowOther = true;
    directories = [
      "Downloads"
      "Music"
      "Pictures"
      "Documents"
      "Videos"
      ".mozilla"
      ".config/sops/age"
      ".config/nvim"
      ".config/openrazer"
      ".config/dconf"
      ".config/maestral"
      ".config/discord"
      ".config/libreoffice"
      ".config/cef_user_data" # Steam
      ".config/JetBrains"
      ".config/ulauncher"
      ".config/pop-shell"
      ".config/fish"
      ".cache/nvim"
      ".cache/mozilla"
      ".cache/matplotlib" # Fonts
      ".cache/fontconfig"
      ".cache/libreoffice"
      ".cache/libgweather"
      ".dropbox-dist"
      ".dropbox-hm"
      ".pki" # Discord
      ".vmware"
      ".local/share/org.gnome.TextEditor"
      ".local/share/maestral"
      ".local/share/python_keyring" # Maestral
      ".local/state/wireplumber"
      ".local/share/Steam"
      ".local/share/JetBrains"
      ".local/share/vulkan"
      ".local/share/icons"
      ".local/share/applications"
      ".local/share/ulauncher"
      ".local/share/fish"
      ".java" # IntelliJ
      ".compose-cache" # Steam
    ];
    files = [
      ".ssh/known_hosts"
      ".ssh/id_rsa"
      ".config/monitors.xml"
    ];
  };
}
