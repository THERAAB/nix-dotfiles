{...}: {
  services.syncthing = {
    enable = true;
    relay.enable = false;
    openDefaultPorts = true;
    overrideDevices = true;
    overrideFolders = true;
    settings = {
      devices = {
        nix-server = {
          id = "F2373FD-HW5QAKL-NEXKV73-QFMLFZF-47SKVYQ-HHDCO6S-XOYOGTS-6PSKIAP";
          addresses = ["tcp://192.168.3.2:22000" "tcp://100.121.108.123:22000"];
        };
      };
      folders = {
        "/dropbox/share" = {
          id = "share";
          devices = ["nix-server"];
          versioning = {
            type = "staggered";
            params.maxAge = "7776000"; # 90 days
          };
        };
      };
    };
  };
}
