{...}: let
  ulauncher-theme-dir = "/nix/persist/nix-dotfiles/share/home/ulauncher/custom";
  git-config-dir = "/nix/persist/home/raab/.config";
in {
  imports = [
    ./persist.nix
  ];
  nix-dotfiles.workstation = {
    ulauncher = {
      theme-dir = ulauncher-theme-dir;
      enable = true;
    };
    git = {
      config-dir = git-config-dir;
      enable = true;
    };
    dconf.enable = true;
    firefox.enable = true;
    fish.enable = true;
    gnome.enable = true;
    gtk.enable = true;
    home.enable = true;
    kitty.enable = true;
    nvim.enable = true;
    vscode.enable = true;
  };
}
