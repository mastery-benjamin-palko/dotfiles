{ config, pkgs, ... }:
{

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
      pywal = "bash ~/dotfiles/.scripts/change-wallpaper.sh";
      update = "home-manager switch";
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
      if [ -e /home/benjaminpalko/.nix-profile/etc/profile.d/nix.sh ]; then . /home/benjaminpalko/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
      . "$HOME/.nix-profile/share/asdf-vm/asdf.sh"
      . "$HOME/.nix-profile/share/asdf-vm/completions/asdf.bash"
      neofetch
    '';
  };
  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
    };
  };
  programs.btop = {
    enable = true;
    settings = {
      theme = "system";
    };
  };

  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    neofetch
    asdf-vm
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
  ];
}
