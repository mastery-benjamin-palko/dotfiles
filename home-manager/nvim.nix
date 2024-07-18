{ pkgs, ... } : {
  home.packages = with pkgs; [
    ripgrep
    xclip
    fzf
    nixfmt-rfc-style
  ];

  xdg.configFile.nvim = {
    source = ../nvim;
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
