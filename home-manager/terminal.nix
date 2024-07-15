{ config, pkgs, ...}: let
  starshipCmd = "${pkgs.starship}/bin/starship";
in {
  home.packages = with pkgs; [
    neofetch
  ];

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
      plugins = [ "git" "gh" "asdf" "bun" "docker" "docker-compose" "kubectl" "yarn" ];
      theme = "robbyrussell";
    };
    initExtra = ''
      if [ -e /home/benjaminpalko/.nix-profile/etc/profile.d/nix.sh ]; then . /home/benjaminpalko/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
      eval "$(${starshipCmd} init zsh)"
      neofetch
    '';
  };
  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
    };
  };
}
