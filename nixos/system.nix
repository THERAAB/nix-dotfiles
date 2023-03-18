{ config, pkgs, ... }:
{ 
  security.auditd.enable = true;
  nix.settings.allowed-users = [ "@wheel" ];
  
  # Zsh
  environment.pathsToLink = [ "share/zsh" ];
  environment.shells = with pkgs; [ zsh ];
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;
  
  # Neovim
  environment.variables.EDITOR = "nvim";
  
  fonts.fonts = with pkgs; [
    (nerdfonts.override { fonts = [ "JetBrainsMono" "Noto" ]; })
  ];
  
  services.locate = {
    enable = true;
    locate = pkgs.plocate;
    localuser = null;
  };
}
