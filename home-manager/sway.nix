{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    swww
    (pkgs.writeShellScriptBin "pywal" ''
      # -n tells `wal` to skip setting the wallpaper.
      wal -i ~/Pictures/Wallpapers/ -n

      # Using feh to tile the wallpaper now.
      # We grab the wallpaper location from wal's cache so
      # that this works even when a directory is passed.
      swww img "$(<"${config.home.homeDirectory}/.cache/wal/wal")" --transition-type random --transition-angle 45 --transition-fps 90
    '')
  ];

  programs.kitty = {
    enable = true;
    shellIntegration.enableZshIntegration = true;
    font = {
      name = "JetBrainsMono NF";
      size = 11;
    };
    settings = {
      enable_audio_bell = "no";
      window_margin_width = 4;
      background_opacity = "0.5";
      confirm_os_window_close = 0;
    };
  };

  xdg.configFile.sway = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/sway";
    recursive = true;
  };
}
