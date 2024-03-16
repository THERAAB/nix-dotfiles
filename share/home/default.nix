{...}: let
  ulauncher-theme-dir = "/nix/persist/nix-dotfiles/share/home/ulauncher/custom";
  git-config-dir = "/nix/persist/home/raab/.config";
in {
  imports = [
    ./persist.nix
  ];
  nix-dotfiles.workstation = {
    enable = true;
    ulauncher-theme-dir = ulauncher-theme-dir;
    git-config-dir = git-config-dir;
  };
}
