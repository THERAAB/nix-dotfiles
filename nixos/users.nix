{ config, pkgs, ... }:
{
  users = {
    mutableUsers = false;
    groups = {
      users.gid = 100;
    };
    users = {
      # To generate a hash:
      # $ nix-shell --run 'mkpasswd -m SHA-512 -s' -p mkpasswd
      root.initialHashedPassword = "$6$89oRObq6lBVqE6Pz$lsm8TXKsGsYZ3HsmbshaTRbecNRMtRQmUUWZS2fubs6y8vF9lLp01dbrhgjGvGPco7qLdEN.hRQ0uisscBanM1";
      raab = {
        isNormalUser = true;
        description = "raab";
        extraGroups = [ "networkmanager" "wheel" "audio" "openrazer" "plugdev" "keys" ];
        initialHashedPassword = "$6$89oRObq6lBVqE6Pz$lsm8TXKsGsYZ3HsmbshaTRbecNRMtRQmUUWZS2fubs6y8vF9lLp01dbrhgjGvGPco7qLdEN.hRQ0uisscBanM1";
        uid = 1000;
      };
    };
  };
}
