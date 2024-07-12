{ config, pkgs, ...}:
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
  };
  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
    };
  };
}
