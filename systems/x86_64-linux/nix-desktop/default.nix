{...}: {
  imports = [
    ../../../share/nixos
    ./hardware-configuration.nix
    ./hardware.nix
  ];
  systemd.tmpfiles.rules = [
    "Z  /games  700 raab    -   -   -"
  ];
  nix-dotfiles.workstation.enable = true;
  boot = {
    loader.grub.extraConfig = ''
      if keystatus --shift ; then
        set timeout=-1
      else
        set timeout=0
      fi
    '';
  };
  programs = {
    steam.enable = true;
    gamemode = {
      enable = true;
      settings.general = {
        softrealtime = "auto";
        renice = 10;
      };
    };
  };
}
