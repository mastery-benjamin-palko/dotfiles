{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    slack
    teams-for-linux
  ];

  xdg.configFile."teams-for-linux" = {
    source = config.lib.file.mkOutOfStoreSymlink ../teams-for-linux;
    recursive = true;
  };
}
