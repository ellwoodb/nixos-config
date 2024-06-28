{
  description = "My first flake!";

  inputs = {
    # Nixpkgs sources
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

    # Ollama
    ollama.url = "github:abysssol/ollama-flake";

    # Hyprland
    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };

    # Some gaming stuff, e.g. ALVR
    lemonake.url = "github:passivelemon/lemonake";
    nix-gaming.url = "github:fufexan/nix-gaming";
  };

  outputs = { self, nixpkgs, home-manager, ollama, hyprland, ... }@inputs:
    let
      system = "x86_64-linux";
      lib = nixpkgs.lib;
      pkgs = import nixpkgs { system = "x86_64-linux"; config.allowUnfree = true; };
      ollama-cuda = ollama.packages.${system}.cuda.override { cudaGcc = pkgs.gcc11; };
    in
    {
      nixosConfigurations = {
        desktop = lib.nixosSystem {
          inherit system;
          specialArgs = {
            inherit inputs;
            inherit pkgs;
          };
          modules = [
            ./configuration.nix
          ];
        };
      };
      homeConfigurations = {
        matthias = home-manager.lib.homeManagerConfiguration {
          pkgs = import nixpkgs {
            inherit system;
            config.allowUnfree = true;
          };
          extraSpecialArgs = {
            inherit inputs;
            inherit pkgs;
          };
          modules = [ ./home.nix ];
        };
      };
    };
}
