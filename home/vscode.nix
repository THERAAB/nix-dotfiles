{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    mutableExtensionsDir = false;
    userSettings = {
      "[nix]"."editor.tabSize" = 2;
      "workbench.colorTheme" = "Catppuccin Frappé";
      "window.titleBarStyle" = "custom";
      "nix.enableLanguageServer" = true;
      "nix.serverPath" = "nil";
      "extensions.experimental.affinity"."asvetliakov.vscode-neovim" = 1;
      "window.menuBarVisibility" = "compact";
      "files.autoSave" = "afterDelay";
      "telemetry.telemetryLevel" = "off";
      "editor.fontFamily" = "JetBrainsMono Nerd Font";
      "editor.minimap.enabled" = false;
    };
    extensions = with pkgs.vscode-extensions; [
      catppuccin.catppuccin-vsc
      jnoortheen.nix-ide
      asvetliakov.vscode-neovim
    ];
  };
}
