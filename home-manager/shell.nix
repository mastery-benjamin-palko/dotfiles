{ config, pkgs, ... }:
{
  targets.genericLinux.enable = true;
  xdg.enable = true;
  xdg.mime.enable = true;
  programs.bash = {
    enable = true;
  };
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      home = "$HOME";
      dotfiles = "~/dotfiles/";
      development = "~/Development/";
      carrier = "~/Development/carrier/";
      customer = "~/Development/customer/";
      fe = "~/Development/mastery-frontend/";
      employee = "~/Development/employee/";
      facility = "~/Development/facility/";
      nv = "nvim";
      up = "docker compose up -d";
      down = "docker compose down";
      clear = "clear && neofetch";
      update = "home-manager switch --flake $HOME/dotfiles";
      clean = "nix-store --gc";
    };
    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
    };
    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "gh"
        "bun"
        "docker"
        "docker-compose"
        "kubectl"
        "yarn"
      ];
      theme = "robbyrussell";
    };
    initExtra = ''
      neofetch
    '';
  };
  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
    };
  };
  programs.bun = {
    enable = true;
    settings = {
      install.scopes = {
        "@mastery" = {
          token = "$NPM_TOKEN";
          url = "https://npm.pkg.github.com/";
        };
        "@masterysystems" = {
          token = "$NPM_TOKEN";
          url = "https://npm.pkg.github.com/";
        };
      };
    };
  };
  programs.btop = {
    enable = true;
    settings = {
      color_theme = "TTY";
    };
  };
  programs.k9s = {
    enable = true;
    settings = {
      ui = {
        skin = "catpuccin-mocha";
      };
    };
    skins = {
      catpuccin-mocha = builtins.fromJSON (builtins.readFile ./k9s/skins/catpuccin-mocha.json);
      catpuccin-mocha-transparent = builtins.fromJSON (
        builtins.readFile ./k9s/skins/catpuccin-mocha-transparent.json
      );
    };
  };
  programs.pywal.enable = true;
  xdg.configFile.wal = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/wal";
    recursive = true;
  };
  xdg.configFile.neofetch = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/neofetch";
    recursive = true;
  };

  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    neofetch
    lazydocker
    kubectl
    azure-cli
    kubelogin
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    (pkgs.writeShellScriptBin "pywal" ''
      wal -i ~/Pictures/Wallpaper/
      sleep 0.2
      gsettings set org.gnome.desktop.background picture-uri-dark "file://$(cat ~/.cache/wal/wal)"
    '')
  ];
}
