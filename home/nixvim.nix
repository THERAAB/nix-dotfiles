{ config, pkgs, inputs, ... }:
{
  programs.nixvim = {
    enable = true;
#    colorschemes.nord = {
#      enable = true;
#      disable_background = true;
#    };
    plugins = {
      lightline.enable = true;
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
        pkgs.vimPlugins.base16-vim.overrideAttrs (old:
          let schemeFile = config.scheme inputs.base16-vim;
          in { patchPhase = ''cp ${schemeFile} colors/base16-scheme.vim''; }
        )
      )
    ];
    extraConfigVim = ''
      set termguicolors background=dark
      let base16colorspace=256
      colorscheme base16-scheme
    '';
  };
}
