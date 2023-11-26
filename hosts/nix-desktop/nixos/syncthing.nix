{...}: {
  services.syncthing = {
    enable = true;
    relay.enable = false;
    user = "raab";
    configDir = "/nix/persist/home/raab/.config/syncthing";
    openDefaultPorts = true;
    overrideDevices = true;
    overrideFolders = true;
    devices = {
      nix-server = {
        id = "F2373FD-HW5QAKL-NEXKV73-QFMLFZF-47SKVYQ-HHDCO6S-XOYOGTS-6PSKIAP";
        addresses = ["tcp://192.168.3.2:22000" "tcp://100.121.108.123:22000"];
      };
      nix-zenbook = {
        id = "H46DP2U-MISHKSS-EC64UUM-F65VNK4-QTQ2AHP-BO6CRLK-55OAZ2V-QWMGAQS";
        addresses = ["tcp://100.85.214.18:22000" "tcp://192.168.1.4:22000"];
      };
    };
    folders = {
      Dropbox = {
        path = "/dropbox/share";
        devices = ["nix-server" "nix-zenbook"];
        versioning = {
          type = "staggered";
          params.maxAge = "7776000"; # 90 days
        };
      };
    };
  };
}
