{pkgs, ...}: {
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    mutableExtensionsDir = false;
    userSettings = {
      "[nix]" = {
        "editor.tabSize" = 2;
        "editor.defaultFormatter" = "kamadorueda.alejandra";
      };
      "editor.formatOnPaste" = true;
      "editor.formatOnSave" = true;
      "editor.formatOnType" = false;
      "alejandra.program" = "alejandra";
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
      "workbench.startupEditor" = "none";
      "editor.fontLigatures" = true;
      "editor.cursorBlinking" = "smooth";
      "explorer.confirmDelete" = false;
      "editor.defaultFormatter" = "esbenp.prettier-vscode";
      "workbench.iconTheme" = "vscode-icons";
      "files.trimFinalNewlines" = true;
      "vsicons.dontShowNewVersionMessage" = true;
      "window.openFoldersInNewWindow" = "on";
      "search.defaultViewMode" = "tree";
    };
    extensions = with pkgs.vscode-extensions; [
      catppuccin.catppuccin-vsc
      jnoortheen.nix-ide
      asvetliakov.vscode-neovim
      kamadorueda.alejandra
      esbenp.prettier-vscode
      vscode-icons-team.vscode-icons
      christian-kohler.path-intellisense
    ];
  };
}
