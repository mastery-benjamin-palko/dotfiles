{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    curl
    gcc
    ripgrep
    fd
    xclip
    fzf
    nixfmt-rfc-style
  ];

  xdg.configFile.nvim = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/nvim";
    recursive = true;
  };

  programs.neovim = {
    enable = true;
  };

  programs.lazygit = {
    enable = true;
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };
}
