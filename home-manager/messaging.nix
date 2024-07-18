{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    slack
    teams-for-linux
  ];

  xdg.configFile."teams-for-linux" = {
    source = ../teams-for-linux;
    recursive = true;
  };

  xdg.desktopEntries = {
    "teams-for-linux" = {
      name = "Teams for Linux";
      exec = "${config.home.homeDirectory}/.nix-profile/bin/teams-for-linux %U";
      terminal = false;
      type = "Application";
      icon = "teams-for-linux";
      settings.StartupWMClass = "teams-for-linux";
      comment = "Unofficial Microsoft Teams client for Linux using Electron. It uses the Web App and wraps it as a standalone application using Electron.";
      mimeType = [ "x-scheme-handler/msteams" ];
      categories = [
        "Chat"
        "Network"
        "Office"
      ];
    };
    slack = {
      name = "Slack";
      settings.StartupWMClass = "Slack";
      comment = "Slack Desktop";
      genericName = "Slack Client for Linux";
      exec = "${config.home.homeDirectory}/.nix-profile/bin/slack %U";
      icon = "slack";
      type = "Application";
      startupNotify = true;
      categories = [
        "GNOME"
        "GTK"
        "Network"
        "InstantMessaging"
      ];
      mimeType = [ "x-scheme-handler/slack" ];
    };
  };
}
