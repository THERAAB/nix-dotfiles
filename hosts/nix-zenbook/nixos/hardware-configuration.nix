{
  config,
  lib,
  modulesPath,
  ...
}: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];
  boot = {
    initrd = {
      availableKernelModules = ["xhci_pci" "thunderbolt" "vmd" "nvme" "usb_storage" "sd_mod" "sdhci_pci"];
      kernelModules = [];
    };
    kernelModules = ["kvm-intel"];
    extraModulePackages = [];
  };
  fileSystems = {
    "/" = {
      device = "none";
      fsType = "tmpfs";
      options = ["size=6G" "mode=755"];
    };
    "/home/raab" = {
      device = "none";
      fsType = "tmpfs";
      options = ["size=2G" "mode=777"];
    };
    "/nix" = {
      device = "/dev/disk/by-label/nixos";
      fsType = "btrfs";
      options = ["subvol=nix" "compress=zstd" "noatime"];
    };
    "/nix/persist" = {
      device = "/dev/disk/by-label/nixos";
      fsType = "btrfs";
      options = ["subvol=persist" "compress=zstd" "noatime"];
      neededForBoot = true;
    };
    "/sync" = {
      device = "/dev/disk/by-label/nixos";
      fsType = "btrfs";
      options = ["subvol=sync" "compress=zstd" "noatime"];
    };
    "/swap" = {
      device = "/dev/disk/by-label/nixos";
      fsType = "btrfs";
      options = ["subvol=swap" "compress=no" "noatime"];
    };
    "/boot" = {
      device = "/dev/disk/by-label/BOOT";
      fsType = "vfat";
    };
  };
  swapDevices = [
    {
      device = "/swap/swapfile";
      size = 8 * 1024;
    }
  ];
  networking.useDHCP = lib.mkDefault true;
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
