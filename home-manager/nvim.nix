{ lib, pkgs, ... } : {
  home.packages = with pkgs; [
    ripgrep
    xclip
    fzf
    nixfmt-rfc-style
  ];

  xdg.configFile.nvim = {
    source = lib.file.mkOutOfStoreSymlink ../nvim;
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
