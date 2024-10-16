{
  description = "My first flake!";

  inputs = {
    # Nixpkgs sources
    nixpkgs-stable.url = "nixpkgs/nixos-24.05";
    #nixpkgs.url = "nixpkgs/nixos-24.05";
    nixpkgs.url = "nixpkgs/nixos-unstable";

    # Home-Manager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Firefox extensions
    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Hyprland
    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };

    # Some gaming stuff, e.g. ALVR
    lemonake.url = "github:passivelemon/lemonake";
    nix-gaming.url = "github:fufexan/nix-gaming";

    # Sops
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    walker.url = "github:abenz1267/walker";

    zen-browser.url = "github:0xc000022070/zen-browser-flake";
  };

  outputs = { self, nixpkgs, home-manager, hyprland, nixpkgs-stable, walker, ... }@inputs:
    let
      system = "x86_64-linux";
      lib = nixpkgs.lib;
      pkgs = import nixpkgs { system = system; config.allowUnfree = true; };
    in
    {
      nixosConfigurations = {
        desktop = lib.nixosSystem rec {
          inherit system;
          specialArgs = {
            inherit inputs;
            inherit pkgs;
            pkgs-stable = import nixpkgs-stable {
              inherit system;
              config.allowUnfree = true;
            };
          };
          modules = [
            ./hosts/desktop/configuration.nix
            inputs.home-manager.nixosModules.default
            {
              home-manager.extraSpecialArgs = specialArgs;
              home-manager.backupFileExtension = "backup2";
            }
          ];
        };
      };
    };
}

