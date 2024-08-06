{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    autotiling
    #swayfx
    # CLI File manager
    ranger
    # Screenshots
    slurp
    grim
    wl-clipboard
    # Status bar
    waybar
    # Application Runner
    rofi-wayland
    # Device manager
    kanshi
    # PRETTY!!!
    swww
    (pkgs.writeShellScriptBin "wallpaper" ''
      # -n tells `wal` to skip setting the wallpaper.
      wal -i ~/Pictures/Wallpaper/ -n

      sleep 0.8
      # Using feh to tile the wallpaper now.
      # We grab the wallpaper location from wal's cache so
      # that this works even when a directory is passed.
      swww img "$(<"${config.home.homeDirectory}/.cache/wal/wal")" --transition-type random --transition-step 30 --transition-fps 90
    '')
  ];

  programs.pywal.enable = true;
  services.kanshi = {
    enable = true;
    settings = [
      {
        profile.name = "undocked";
        profile.outputs = [
          {
            criteria = "eDP-1";
            status = "enable";
          }
        ];
      }
      {
        profile.name = "docked";
        profile.outputs = [
          {
            criteria = "eDP-1";
            status = "disable";
          }
          {
            criteria = "DP-2";
            status = "enable";
            mode = "2560x1440@144Hz";
          }
        ];
      }
    ];
  };

  xdg.configFile.sway = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/sway";
    recursive = true;
  };

  xdg.configFile.waybar = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/waybar";
    recursive = true;
  };

  xdg.configFile.rofi = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/rofi";
    recursive = true;
  };
}
