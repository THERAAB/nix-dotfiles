{ config, pkgs, inputs, ... }:
{
  programs.nixvim = {
    enable = true;
    colorscheme = "base16-scheme";
    plugins = {
      bufferline.enable = true;
      nvim-tree.enable = true;
      nvim-cmp.enable = true;
      telescope.enable = true;
      treesitter.enable = true;
    };
    options = {
      number = true;
      relativenumber = true;
      shiftwidth = 2;
    };
    extraPlugins = with pkgs.vimPlugins; [
      vim-nix
      nvim-web-devicons
      (
        base16-vim.overrideAttrs (old:
          let schemeFile = config.scheme inputs.base16-vim;
          in { patchPhase = ''cp ${schemeFile} colors/base16-scheme.vim''; }
        )
      )
    ];
  };
}
