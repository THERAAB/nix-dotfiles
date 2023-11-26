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
      nix-desktop = {
        id = "4M2BE3E-NS374SE-YFOEGQZ-KDOWHHK-SG4W5QG-TDKQPBI-RF3SYDP-PDMLVAJ";
        addresses = ["tcp://192.168.2.2:22000" "tcp://100.126.231.47:22000"];
      };
      galaxy-tab = {
        id = "LYRX4BK-OXATK4G-UKSLKED-RR6HO4L-VQ2P2U4-S6NTCPQ-OHZBKSV-NH24XQU";
        addresses = ["tcp://192.168.1.36:22000"];
      };
    };
    folders = {
      Share = {
        path = "/dropbox/share";
        devices = ["nix-server" "nix-desktop" "galaxy-tab"];
        versioning = {
          type = "staggered";
          params.maxAge = "7776000"; # 90 days
        };
      };
    };
  };
}
