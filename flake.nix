{
  description = "Work Nix Configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };
  outputs =
    { home-manager, nixpkgs, ... }@inputs:
    let
      system = if builtins ? currentSystem then builtins.currentSystem else "x86_64-linux";
      host = builtins.readFile /etc/hostname;
      username = "benjaminpalko";
    in
    {
      nixosConfigurations."${host}" = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          home-manager.nixosModules.home-manager
          ./nix/configuration.nix
        ];
        specialArgs = {
          inherit username;
          inherit inputs;
        };
      };
    };
}
