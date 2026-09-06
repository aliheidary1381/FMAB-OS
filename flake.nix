{
  description = "NixOS flake for aliheydaripc";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    systems.url = "github:nix-systems/default";
    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    chaotic = {
      url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
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
      chaotic,
      grub2-themes,
      home-manager,
      plasma-manager,
      catppuccin,
      nixvim,
      nix-jetbrains-plugins,
      treefmt-nix,
      ...
    }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
      treefmtEval = treefmt-nix.lib.evalModule pkgs {
        projectRootFile = "flake.nix";
        programs.nixfmt.enable = true;
      };
    in
    {
      formatter.${system} = treefmtEval.config.build.wrapper;
      nixosConfigurations.aliheydaripc = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit nix-jetbrains-plugins chaotic;
        };
        modules = [
          chaotic.nixosModules.default
          grub2-themes.nixosModules.default
          nixvim.nixosModules.nixvim
          catppuccin.nixosModules.catppuccin
          {
            imports = [
              ./configs/system-wide/temporary_fixes.nix
              ./configs/system-wide/hardware.nix
              ./configs/system-wide/system.nix
              ./configs/system-wide/nvim.nix
              ./configs/system-wide/shell.nix
              ./configs/system-wide/starship.nix
              ./configs/system-wide/environment.nix
              ./configs/system-wide/default_apps.nix
              ./packages/all.nix
              ./packages/jetbrains.nix
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
              ./configs/system-wide/temporary_fixes.nix
              ./packages/all.nix
              ./configs/home-manager/home.nix
              ./configs/system-wide/starship.nix
              ./configs/system-wide/nvim.nix
              ./configs/home-manager/niri.nix
              ./configs/home-manager/plasma.nix
              ./configs/home-manager/helix.nix
              ./configs/home-manager/zed.nix
              ./configs/home-manager/wave.nix
              ./configs/home-manager/tabby.nix
              ./configs/home-manager/streamrip.nix
              ./configs/home-manager/onlyoffice.nix
              ./configs/home-manager/okularpartrc.nix
              ./configs/home-manager/jetbrains.nix
              ./configs/home-manager/equalization.nix
            ];
          }
        ];
      };
    };
}
