{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    spotify
    vivaldi
    logseq
    insomnia
    # redisinsight
    pgadmin4
  ];

  xdg.desktopEntries = {
    spotify = {
      name = "Spotify";
      exec = "${config.home.homeDirectory}/.nix-profile/bin/spotify %U";
      terminal = false;
      type = "Application";
      icon = "spotify-client";
      settings.StartupWMClass = "spotify";
      mimeType = [ "x-scheme-handler/spotify" ];
      categories = [
        "Audio"
        "Music"
        "Player"
        "AudioVideo"
      ];
    };
    logseq = {
      name = "Logseq";
      exec = "${config.home.homeDirectory}/.nix-profile/bin/logseq %U";
      terminal = false;
      type = "Application";
      icon = "logseq";
      settings.StartupWMClass = "logseq";
      mimeType = [ "x-scheme-handler/logseq" ];
      categories = [ "Utility" ];
    };
  };
}
