{
  description = "NixOS flake for aliheydaripc";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    systems.url = "github:nix-systems/default";
    grub2-themes = {
      url = "github:vinceliuice/grub2-themes";
      inputs.nixpkgs.follows = "nixpkgs";
    };
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
      inputs.systems.follows = "systems";
    };
    catppuccin = {
      url = "github:catppuccin/nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-jetbrains-plugins = {
      url = "github:nix-community/nix-jetbrains-plugins";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.systems.follows = "systems";
    };
  };

  outputs =
    {
      nixpkgs,
      grub2-themes,
      home-manager,
      plasma-manager,
      catppuccin,
      nixvim,
      nix-jetbrains-plugins,
      ...
    }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
    in
    {
      nixosConfigurations.aliheydaripc = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit nix-jetbrains-plugins; };
        modules = [
          grub2-themes.nixosModules.default
          nixvim.nixosModules.nixvim
          catppuccin.nixosModules.catppuccin
          {
            imports = [
              ./configs/hardware.nix
              ./configs/system.nix
              ./configs/nvim.nix
              ./configs/shell.nix
              ./configs/starship.nix
              ./configs/environment.nix
              ./configs/default_apps.nix
              ./packages/all.nix
            ];
          }
        ];
      };
      homeConfigurations.ali = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          plasma-manager.homeModules.plasma-manager
          nixvim.homeModules.nixvim
          catppuccin.homeModules.catppuccin
          {
            imports = [
              ./packages/all.nix
              ./configs/home.nix
              ./configs/starship.nix
              ./configs/plasma.nix
              ./configs/helix.nix
              ./configs/zed.nix
              ./configs/wave.nix
              ./configs/onlyoffice.nix
              ./configs/equalization.nix
            ];
          }
        ];
      };
    };
}
