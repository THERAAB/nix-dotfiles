{
  config,
  pkgs,
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
        dir=/nix/persist/nix-dotfiles
        nix flake update $dir --commit-lock-file
    git -C $dir push
      '';
      path = with pkgs; [
        gitMinimal
        config.nix.package.out
        config.programs.ssh.package
      ];
    };
  };

  system.autoUpgrade = {
    enable = true;
    dates = "daily";
    flake = "github:THERAAB/nix-dotfiles/main";
    persistent = true;
    flags = [
      "--no-write-lock-file"
    ];
    allowReboot = false;
  };
}
