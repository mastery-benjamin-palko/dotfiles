{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    spotify
    (vivaldi.override { commandLineArgs = "--password-store=gnome-libsecret"; })
    logseq
    (pkgs.callPackage ./pkgs/insomnia.nix { })
    # redisinsight
    pgadmin4
    azuredatastudio
  ];

  xdg.configFile.azuredatastudio = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/azuredatastudio";
    recursive = true;
  };

  xdg.configFile."zoomus.conf".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/zoomus.conf";
}
