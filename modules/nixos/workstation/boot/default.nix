{
  lib,
  config,
  pkgs,
  ...
}:
with lib;
with lib.nix-dotfiles; let
  cfg = config.nix-dotfiles.workstation.boot;
in {
  options.nix-dotfiles.workstation.boot = with types; {
    enable = mkEnableOption (lib.mdDoc "Setup boot");
  };
  config = mkIf cfg.enable {
    boot = {
      kernelPackages = pkgs.linuxPackages_latest;
      loader.efi.canTouchEfiVariables = true;
      initrd.verbose = false;
      consoleLogLevel = 0;
      kernelParams = ["quiet" "splash" "rd.systemd.show_status=false" "udev.log_priority=3" "boot.shell_on_fail"];
      loader.grub = {
        enable = true;
        devices = ["nodev"];
        efiSupport = true;
        configurationLimit = 10;
        gfxmodeEfi = "text";
        splashImage = null;
      };
    };
  };
}
