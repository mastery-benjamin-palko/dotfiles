{
  inputs,
  username,
  pkgs,
  ...
}:
{
  users.users.${username} = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [ ];
  };

  home-manager = {
    backupFileExtension = "backup";
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = {
      inherit inputs;
    };
    users.${username} = {
      home.username = username;
      home.homeDirectory = "/home/${username}";
      imports = [
        ../home-manager/git.nix
        ../home-manager/messaging.nix
        ../home-manager/nvim.nix
        ../home-manager/shell.nix
        ../home-manager/gtk.nix
        ./home.nix
      ];
    };
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    gcc
    build-essential
    wget
    curl
  ];
}
