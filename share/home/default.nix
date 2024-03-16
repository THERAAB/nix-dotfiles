{...}: let
  ulauncher-theme-dir = "/nix/persist/nix-dotfiles/share/home/ulauncher/custom";
in {
  imports = [
    ./git.nix
    ./firefox.nix
    ./home.nix
    ./gtk.nix
    ./gnome.nix
    ./dconf.nix
    ./fish.nix
    ./kitty.nix
    ./vscodium.nix
    ./nvim.nix
    ./persist.nix
    ./pkgs.nix
  ];
  nix-dotfiles.workstation.ulauncher = {
    theme-dir = ulauncher-theme-dir;
    enable = true;
  };
}
