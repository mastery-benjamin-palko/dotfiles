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
    source = config.lib.file.mkOutOfStoreSymlink ../azuredatastudio;
    recursive = true;
  };

  xdg.configFile."zoomus.conf".source = config.lib.file.mkOutOfStoreSymlink ../zoomus.conf;
}
