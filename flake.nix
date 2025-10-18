{
  description = "NixOS flake for aliheydaripc";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    winboat.url = "github:TibixDev/winboat";
    catppuccin.url = "github:catppuccin/nix";
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      plasma-manager,
      winboat,
      catppuccin,
      nixvim,
      ...
    }:
    {
      config.nixpkgs.config.allowUnfree = true;
      nixosConfigurations.aliheydaripc = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hardware-configuration.nix
          ./default.nix
          nixvim.nixosModules.nixvim
          ./nvim.nix
          ./shell.nix
          ./packages.nix
          ./custom-packages-and-patches.nix
          catppuccin.nixosModules.catppuccin
          winboat.nixosModules.x86_64-linux.default
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "backup";
            home-manager.sharedModules = [ plasma-manager.homeModules.plasma-manager ];

            home-manager.users.ali = {
              imports = [
                ./home.nix
                ./plasma.nix
                ./helix.nix
                ./zed.nix
                ./wave.nix
                catppuccin.homeModules.catppuccin
              ];
            };
          }
        ];
      };
    };
}
