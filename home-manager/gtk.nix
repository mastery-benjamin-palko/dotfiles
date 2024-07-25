{ pkgs, ... }:
{
  # dconf = {
  #   enable = true;
  #   settings = {
  #     "org/gnome/shell" = {
  #       disable-user-extensions = false;
  #       enabled-extensions = with pkgs.gnomeExtensions; [
  #         blur-my-shell.extensionUuid
  #         user-themes.extensionUuid
  #         caffeine.extensionUuid
  #         sound-output-device-chooser.extensionUuid
  #         control-blur-effect-on-lock-screen.extensionUuid
  #         mpris-label.extensionUuid
  #       ];
  #       "org/gnome/shell/extensions/user-theme".name = "WhiteSur-Dark";
  #     };
  #   };
  # };

  home.packages = with pkgs; [
    # gnome-tweaks
    # gnomeExtensions.user-themes
    # gnomeExtensions.blur-my-shell
    # gnomeExtensions.caffeine
    # gnomeExtensions.sound-output-device-chooser
    # gnomeExtensions.mpris-label
  ];

  gtk = {
    enable = true;
    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = "1";
    };
    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = "1";
    };
    theme = {
      name = "WhiteSur-Dark";
      package = pkgs.whitesur-gtk-theme.override {
        colorVariants = [ "Dark" ];
        opacityVariants = [ "normal" ];
        darkerColor = true;
      };
    };
    cursorTheme = {
      name = "Volantes_cursors";
      package = pkgs.volantes-cursors;
    };
    iconTheme = {
      name = "WhiteSur-dark";
      package = pkgs.whitesur-icon-theme;
    };
  };
  home.sessionVariables.GTK_THEME = "WhiteSur-Dark";
}
