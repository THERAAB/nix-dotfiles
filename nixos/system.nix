{ config, pkgs, ... }:
{ 
  security.auditd.enable = true;
  nix.settings.allowed-users = [ "@wheel" ];

  # Neovim
  environment.variables.EDITOR = "hx";
  
  fonts.fonts = with pkgs; [
    (nerdfonts.override { fonts = [ "JetBrainsMono" "Noto" ]; })
  ];
  
  services.locate = {
    enable = true;
    locate = pkgs.plocate;
    localuser = null;
  };
}
