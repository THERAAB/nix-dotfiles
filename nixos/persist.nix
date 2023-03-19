{ config, pkgs, ... }:
{
  systemd.tmpfiles.rules = [
    "d  /nix/persist/home/raab                      -   raab    -   -   -"
    "d  /nix/persist/home/raab/.config/sops/age     700 raab    -   -   -"
    "d  /nix/persist/nix-dotfiles                   -   raab    -   -   -"
    "Z  /nix/persist/nix-dotfiles                   700 raab    -   -   -"
    "Z  /nix/persist/home/raab                      740 raab    -   -   -"
    "Z  /nix/persist/home/raab/.ssh                 700 raab    -   -   -"
    "Z  /games                                      700 raab    -   -   -"
    "Z  /dropbox                                    700 raab    -   -   -"
  ];
  programs.fuse.userAllowOther = true;
  environment.persistence."/nix/persist/system" = {
    hideMounts = true;
    directories = [
      "/etc/nixos"
      "/var/log"
      "/var/lib/"
      "/etc/NetworkManager/system-connections"
      "/etc/ssh"
    ];
    files = [
      "/etc/machine-id"
      # "/var/cache/locatedb"
      { file = "/etc/nix/id_rsa"; parentDirectory = { mode = "u=rwx,g=,o="; }; }
    ];
  };
}
