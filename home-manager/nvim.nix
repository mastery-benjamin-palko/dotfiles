{ lib, pkgs, ... } : {
  home.packages = with pkgs; [
    nixfmt-rfc-style
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    lazygit
  ];

  xdg.configFile.nvim = {
    source = ../nvim;
    recursive = true;
  };

  programs.neovim = {
    enable = true;
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };
}
