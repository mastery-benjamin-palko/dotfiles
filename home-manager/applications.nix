{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    spotify
    vivaldi
    logseq
    insomnia
    # redisinsight
    pgadmin4
    azuredatastudio
    zoom-us
  ];

  xdg.configFile.azuredatastudio = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/azuredatastudio";
    recursive = true;
  };

  xdg.configFile."zoomus.conf".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/zoomus.conf";
}
