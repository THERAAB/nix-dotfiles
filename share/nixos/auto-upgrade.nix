{
  config,
  pkgs,
  lib,
  ...
}: {
  systemd.services = {
    nixos-upgrade.onFailure = ["nixos-upgrade-on-failure.service"];
    nixos-upgrade-on-failure = {
      script = ''
        TOKEN=`cat ${config.sops.secrets.gotify_homelab_token.path}`
        HOSTNAME=`${pkgs.nettools}/bin/hostname`

        ${pkgs.curl}/bin/curl   https://gotify.pumpkin.rodeo/message?token=$TOKEN                                       \
                                -F "title='$HOSTNAME' Upgrade Failed"                                                   \
                                -F "message=Upgrade failed on '$HOSTNAME', run journalctl -u nixos-upgrade for details" \
                                -F "priority=5"                                                                         \
      '';
    };
    nixos-update-flake = {
      script = ''
        ${pkgs.nix}/bin/nix flake update  --extra-experimental-features nix-command                   \
                                          --extra-experimental-features flakes                        \
                                          --output-lock-file /nix/persist/nix-dotfiles/flake.lock     \
                                          --debug                                                     \
                                          github:THERAAB/nix-dotfiles/main
      ''; 
    };
  };

  system.autoUpgrade = {
    enable = true;
    dates = lib.mkDefault "daily";
    flake = "github:THERAAB/nix-dotfiles/main";
    persistent = true;
    allowReboot = false;
  };
}
